//
//  OrganizationDescriptionVC.swift
//  careerfair
//
//  Created by Kathryn Panter on 8/24/15.
//  Copyright (c) 2015 AlexRobertsKatePanter. All rights reserved.
//

import UIKit
import CoreData

class OrganizationDescriptionVC: UIViewController, UITextViewDelegate {
    var org = organization();
    var orgId = -1;
    var originalText:String = "";
    var noteTVHasPlaceholder:Bool = false;
    
    @IBOutlet weak var viewOnMap: UIButton!
    @IBOutlet weak var favoriteFromDescCB: UIButton!
    @IBOutlet weak var dateLocationLabel: UILabel!
    
    @IBOutlet weak var noteTV: UITextView!
    
    @IBAction func handleTouch(recognizer:UITapGestureRecognizer) {
        self.view.endEditing(true);
    }
    
    @IBAction func touchFavorite(sender: AnyObject) {
        favoriteFromDescCB.selected = !favoriteFromDescCB.selected;
        let orgId = self.orgId;
        if (orgData[orgId] == nil) {
            println("ERROR");
            return;
        }
        
        let favoritedStatus = orgData[orgId]!.favorited;
        orgData[orgId]!.favorited = !favoritedStatus;
        if (favoritedStatus == false) {
            //Write to core data
            var appDel:AppDelegate = UIApplication.sharedApplication().delegate as! AppDelegate;
            var context:NSManagedObjectContext = appDel.managedObjectContext!;
            
            var newFavorite = NSEntityDescription.insertNewObjectForEntityForName("FavoritedOrganizations", inManagedObjectContext: context) as! NSManagedObject;
            newFavorite.setValue(orgId, forKey: "orgId");
            context.save(nil);
            
            
            //Add to list of favorites
            if (favoritedOrgs.contains(orgId)) {
                println("ERROR, INSERTING ORG ID INTO FAVORITED THAT ALREADY EXISTS");
            }
            favoritedOrgs.insert(orgId);
            //Switch button image to faved
            
            sender.setImage(UIImage(named: "heartfaved"), forState: UIControlState.Normal);
        }
        else {
            //Remove from core data
            var appDel:AppDelegate = UIApplication.sharedApplication().delegate as! AppDelegate;
            var context:NSManagedObjectContext = appDel.managedObjectContext!;
            var pred = NSPredicate(format: "orgId == " + toString(orgId));
            let fetchRequest = NSFetchRequest(entityName: "FavoritedOrganizations");
            fetchRequest.predicate = pred;
            
            let results = context.executeFetchRequest(fetchRequest, error: nil) as? [FavoritedOrganizations];
            context.deleteObject(results!.first!);
            context.save(nil);
            
            //Remove from list of favorites
            if (!favoritedOrgs.contains(orgId)) {
                println("ERROR, REMOVING ORG FROM FAVORITED THAT DOESN'T EXIST");
            }
            favoritedOrgs.remove(orgId);
            
            //Switch button image to unfaved
            sender.setImage(UIImage(named: "heartunfaved"), forState: UIControlState.Normal);
        }
    }
    
    @IBAction func touchViewOnMap(sender: AnyObject) {
        self.performSegueWithIdentifier("orgDescToMap", sender: "temp");
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = org.title;

        dateLocationLabel.text = org.date + ", " + org.location;
        
        // Set up TextView Styling
        self.noteTV.layer.borderWidth = 1.0;
        self.noteTV.layer.cornerRadius = 5;
        var tfBorderColor:UIColor = UIColor(red: 204.0/255.0, green: 204.0/255.0, blue: 204.0/255.0, alpha: 1.0)
        self.noteTV.layer.borderColor = tfBorderColor.CGColor;
        
        favoriteFromDescCB.setImage(UIImage(named: "heartunfaved"), forState: UIControlState.Normal);
        favoriteFromDescCB.setImage(UIImage(named: "heartfaved"), forState: UIControlState.Selected);
        favoriteFromDescCB.selected = org.favorited;

        // Attempt to load note from core data
        var appDel:AppDelegate = UIApplication.sharedApplication().delegate as! AppDelegate;
        var context:NSManagedObjectContext = appDel.managedObjectContext!;
        
        // Check if orgId for org exists in NotedOrganizations
        var pred = NSPredicate(format: "orgId == " + toString(orgId));
        let fetchRequest = NSFetchRequest(entityName: "NotedOrganizations");
        fetchRequest.predicate = pred;
        
        let results = context.executeFetchRequest(fetchRequest, error: nil) as? [NotedOrganizations];
        if (results?.count != 0) {
            var managedObject = results?[0];
            noteTV.text = managedObject?.note;
            noteTVHasPlaceholder = false;
        }
        else {
            noteTV.text = "Write a note here...";
            noteTV.textColor = UIColor.lightGrayColor();
            noteTVHasPlaceholder = true;
        }
        
        noteTV.delegate = self;
        originalText = noteTV.text;
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func touchesBegan(touches: Set<NSObject>, withEvent event: UIEvent) {
        self.noteTV.resignFirstResponder();
    }
    
    func textViewShouldBeginEditing(textView:UITextView) -> Bool {
        if (noteTVHasPlaceholder) {
            textView.text = "";
            textView.textColor = UIColor.blackColor();
            noteTVHasPlaceholder = false;
        }
        return true;
    }
    
    func textViewDidChange(noteTV:UITextView) {
        /*if (count(noteTV.text) == 0) {
            noteTV.text = "Write a note here...";
            noteTV.textColor = UIColor.lightGrayColor();
            noteTVHasPlaceholder = true;
            noteTV.resignFirstResponder();
        }
*/
    }

    
    // MARK: - Navigation
    
    override func viewWillDisappear(animated : Bool) {
        super.viewWillDisappear(animated)
        
        if (self.isMovingFromParentViewController()){
            if (noteTV.text != originalText) {
                if (noteTVHasPlaceholder || count(noteTV.text) == 0) {
                    // Delete from core data
                    var appDel:AppDelegate = UIApplication.sharedApplication().delegate as! AppDelegate;
                    var context:NSManagedObjectContext = appDel.managedObjectContext!;
                    var error : NSError?
                    
                    var pred = NSPredicate(format: "orgId == " + toString(orgId));
                    let fetchRequest = NSFetchRequest(entityName: "NotedOrganizations");
                    fetchRequest.predicate = pred;
                
                    let results = context.executeFetchRequest(fetchRequest, error: &error) as? [NotedOrganizations];
                    if ((error) != nil) { handleError("OrgDescVC willDisappear Delete from CD", &error); }
                    if (results!.count > 0) {
                        context.deleteObject(results!.first!);
                    }
                    context.save(nil);
                    
                    // Remove from Noted Data Structure
                    notedOrgs.remove(orgId);
                }
                else if (count(noteTV.text) > 0) {
                    // Write to core data
                    var appDel:AppDelegate = UIApplication.sharedApplication().delegate as! AppDelegate;
                    var context:NSManagedObjectContext = appDel.managedObjectContext!;
                    var error : NSError?

                    // Check if org already exists in core data
                    var pred = NSPredicate(format: "orgId == " + toString(orgId));
                    let fetchRequest = NSFetchRequest(entityName: "NotedOrganizations");
                    fetchRequest.predicate = pred;
                    
                    let results = context.executeFetchRequest(fetchRequest, error: &error) as? [NotedOrganizations];
                    if ((error) != nil) { handleError("OrgDescVC willDissappear Check if already exists", &error); }
                    if (results?.count != 0) {
                        var managedObject = results?[0];
                        managedObject?.setValue(noteTV.text, forKey: "note");
                    }
                    else {
                        var newNote = NSEntityDescription.insertNewObjectForEntityForName("NotedOrganizations", inManagedObjectContext: context) as! NSManagedObject;
                        newNote.setValue(orgId, forKey: "orgId");
                        newNote.setValue(noteTV.text, forKey: "note");
                        
                        // Add to Noted Data Structure
                        notedOrgs.insert(orgId);
                    }
                    
                    context.save(nil);
                }
            }
        }
    }

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        if (segue.identifier == "orgDescToMap") {
            let destinationVC = segue.destinationViewController as! MapImageVC;
            destinationVC.mapLocation = parseLocation(org.location);
        }
    }
}
