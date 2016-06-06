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
    
    @IBOutlet weak var descL: UILabel!
    @IBOutlet weak var descTV: UITextView!
    
    @IBAction func handleTouch(recognizer:UITapGestureRecognizer) {
        self.view.endEditing(true);
    }
    
    @IBAction func touchFavorite(sender: AnyObject) {
        favoriteFromDescCB.selected = !favoriteFromDescCB.selected;
        let orgId = self.orgId;
        if (orgData[orgId] == nil) {
            print("ERROR");
            return;
        }
        
        let favoritedStatus = orgData[orgId]!.favorited;
        orgData[orgId]!.favorited = !favoritedStatus;
        if (favoritedStatus == false) {
            //Write to core data
            let appDel:AppDelegate = UIApplication.sharedApplication().delegate as! AppDelegate;
            let context:NSManagedObjectContext = appDel.managedObjectContext!;
            
            let newFavorite = NSEntityDescription.insertNewObjectForEntityForName("FavoritedOrganizations", inManagedObjectContext: context) ;
            newFavorite.setValue(orgId, forKey: "orgId");
            do {
                try context.save()
            } catch _ {
            };
            
            
            //Add to list of favorites
            if (favoritedOrgs.contains(orgId)) {
                print("ERROR, INSERTING ORG ID INTO FAVORITED THAT ALREADY EXISTS");
            }
            favoritedOrgs.insert(orgId);
            //Switch button image to faved
            
            sender.setImage(UIImage(named: "heartfaved"), forState: UIControlState.Normal);
        }
        else {
            //Remove from core data
            let appDel:AppDelegate = UIApplication.sharedApplication().delegate as! AppDelegate;
            let context:NSManagedObjectContext = appDel.managedObjectContext!;
            let pred = NSPredicate(format: "orgId == " + String(orgId));
            let fetchRequest = NSFetchRequest(entityName: "FavoritedOrganizations");
            fetchRequest.predicate = pred;
            
            let results = (try? context.executeFetchRequest(fetchRequest)) as? [FavoritedOrganizations];
            context.deleteObject(results!.first!);
            do {
                try context.save()
            } catch _ {
            };
            
            //Remove from list of favorites
            if (!favoritedOrgs.contains(orgId)) {
                print("ERROR, REMOVING ORG FROM FAVORITED THAT DOESN'T EXIST");
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
        let tfBorderColor:UIColor = UIColor(red: 204.0/255.0, green: 204.0/255.0, blue: 204.0/255.0, alpha: 1.0)
        self.noteTV.layer.borderColor = tfBorderColor.CGColor;
        
        favoriteFromDescCB.setImage(UIImage(named: "heartunfaved"), forState: UIControlState.Normal);
        favoriteFromDescCB.setImage(UIImage(named: "heartfaved"), forState: UIControlState.Selected);
        favoriteFromDescCB.selected = org.favorited;
        
        descL.text = ("About " + org.title);
        descTV.text = org.desc;

        // Attempt to load note from core data
        let appDel:AppDelegate = UIApplication.sharedApplication().delegate as! AppDelegate;
        let context:NSManagedObjectContext = appDel.managedObjectContext!;
        
        // Check if orgId for org exists in NotedOrganizations
        let pred = NSPredicate(format: "orgId == " + String(orgId));
        let fetchRequest = NSFetchRequest(entityName: "NotedOrganizations");
        fetchRequest.predicate = pred;
        
        let results = (try? context.executeFetchRequest(fetchRequest)) as? [NotedOrganizations];
        if (results?.count != 0) {
            let managedObject = results?[0];
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
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
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
                if (noteTVHasPlaceholder || noteTV.text.characters.count == 0) {
                    // Delete from core data
                    let appDel:AppDelegate = UIApplication.sharedApplication().delegate as! AppDelegate;
                    let context:NSManagedObjectContext = appDel.managedObjectContext!;
                    var error : NSError?
                    
                    let pred = NSPredicate(format: "orgId == " + String(orgId));
                    let fetchRequest = NSFetchRequest(entityName: "NotedOrganizations");
                    fetchRequest.predicate = pred;
                
                    
                    let results: [NotedOrganizations];
                    do {
                        results = try context.executeFetchRequest(fetchRequest) as! [NotedOrganizations];
                    }
                    catch _ {
                        handleError("OrgDescVC willDisappear Delete from CD", error: &error);
                        return;
                    }
                    
                    if (results.count > 0) {
                        context.deleteObject(results.first!);
                    }
                    do {
                        try context.save()
                    } catch _ {
                    };
                    
                    // Remove from Noted Data Structure
                    notedOrgs.remove(orgId);
                }
                else if (noteTV.text.characters.count > 0) {
                    // Write to core data
                    let appDel:AppDelegate = UIApplication.sharedApplication().delegate as! AppDelegate;
                    let context:NSManagedObjectContext = appDel.managedObjectContext!;
                    var error : NSError?

                    // Check if org already exists in core data
                    let pred = NSPredicate(format: "orgId == " + String(orgId));
                    let fetchRequest = NSFetchRequest(entityName: "NotedOrganizations");
                    fetchRequest.predicate = pred;
                    
                    let results: [NotedOrganizations];
                    do {
                        results = try context.executeFetchRequest(fetchRequest) as! [NotedOrganizations];
                    }
                    catch _ {
                        handleError("OrgDescVC willDissappear Check if already exists", error: &error);
                        return;
                    }
                    
                    if (results.count != 0) {
                        let managedObject = results[0];
                        managedObject.setValue(noteTV.text, forKey: "note");
                    }
                    else {
                        let newNote = NSEntityDescription.insertNewObjectForEntityForName("NotedOrganizations", inManagedObjectContext: context) ;
                        newNote.setValue(orgId, forKey: "orgId");
                        newNote.setValue(noteTV.text, forKey: "note");
                        
                        // Add to Noted Data Structure
                        notedOrgs.insert(orgId);
                    }
                    
                    do {
                        try context.save()
                    } catch _ {
                    };
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
