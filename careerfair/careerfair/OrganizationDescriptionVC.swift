//
//  OrganizationDescriptionVC.swift
//  careerfair
//
//  Created by Kathryn Panter on 8/24/15.
//  Copyright (c) 2015 AlexRobertsKatePanter. All rights reserved.
//

import UIKit
import CoreData

class OrganizationDescriptionVC: UIViewController, UIScrollViewDelegate, UITextViewDelegate {
    var org = organization();
    var orgId = -1;
    var originalText:String = "";
    var writtenNoteText = "";
    var noteTVHasPlaceholder:Bool = false;
    
    @IBOutlet weak var favoriteFromDescCB: UIButton!
    
    @IBAction func handleTouch(recognizer:UITapGestureRecognizer) {
        self.view.endEditing(true);
    }
    
    // TScrollViewController
    var scrollView:UIScrollView!
    var containerView:UIView!
    
    var dateAndLocationHeader:UILabel!
    var dateAndLocationContent:UILabel!
    var writeNoteHeader:UILabel!
    var writeNoteContent:UITextView!
    var aboutHeader:UILabel!
    var aboutContent:UITextView!
    var majorHeader:UILabel!
    var majorContent:UITextView!
    var positionsHeader:UILabel!
    var positionsContent:UITextView!
    var degreeHeader:UILabel!
    var degreeContent:UITextView!
    var jobLocHeader:UILabel!
    var jobLocContent:UITextView!
    var sponsorHeader:UILabel!
    var sponsorContent:UITextView!
    
    var aboutHeight:CGFloat = -1;
    var aboutBottomContraint:CGFloat = -1;
    
    var viewOnMapButton:UIButton!
    
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
    
    override func viewWillAppear(animated: Bool) {
        self.navigationController?.setToolbarHidden(true, animated: true);
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        scrollView.frame = view.bounds
        containerView.frame = CGRectMake(0, 0, scrollView.contentSize.width, scrollView.contentSize.height);
        
        viewOnMapButton.frame = CGRectMake(UIScreen.mainScreen().bounds.size.width-170, 20, 200, 24)

        
        dateAndLocationHeader.frame = CGRectMake(16, 20, UIScreen.mainScreen().bounds.width/2, 21);
        dateAndLocationContent.frame = CGRectMake(24, 63, UIScreen.mainScreen().bounds.width-28, 17);
        writeNoteHeader.frame = CGRectMake(16, 114, UIScreen.mainScreen().bounds.width/2, 21);
        writeNoteContent.frame = CGRectMake(16, 143, UIScreen.mainScreen().bounds.width-32, 130);
        aboutHeader.frame = CGRectMake(16, 309, UIScreen.mainScreen().bounds.width/2, 21);
        aboutContent.frame = CGRectMake(24, 338, UIScreen.mainScreen().bounds.width-28, aboutHeight);
        majorHeader.frame = CGRectMake(16, aboutBottomContraint+20, UIScreen.mainScreen().bounds.width/2, 21);
        majorContent.frame = CGRectMake(24, aboutBottomContraint+42, UIScreen.mainScreen().bounds.width-28, 24);
        positionsHeader.frame = CGRectMake(16, aboutBottomContraint+113, UIScreen.mainScreen().bounds.width/2, 21);
        positionsContent.frame = CGRectMake(24, aboutBottomContraint+135, UIScreen.mainScreen().bounds.width-28, 24);
        degreeHeader.frame = CGRectMake(16, aboutBottomContraint+207, UIScreen.mainScreen().bounds.width/2, 21);
        degreeContent.frame = CGRectMake(24, aboutBottomContraint+229, UIScreen.mainScreen().bounds.width-28, 24);
        jobLocHeader.frame = CGRectMake(16, aboutBottomContraint+300, UIScreen.mainScreen().bounds.width/2, 21);
        jobLocContent.frame = CGRectMake(24, aboutBottomContraint+322, UIScreen.mainScreen().bounds.width-28, 50);
        sponsorHeader.frame = CGRectMake(16, aboutBottomContraint+393, UIScreen.mainScreen().bounds.width/2, 21);
        sponsorContent.frame = CGRectMake(24, aboutBottomContraint+415, UIScreen.mainScreen().bounds.width-28, 24);
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = org.title
        
        favoriteFromDescCB.setImage(UIImage(named: "heartunfaved"), forState: UIControlState.Normal);
        favoriteFromDescCB.setImage(UIImage(named: "heartfaved"), forState: UIControlState.Selected);
        favoriteFromDescCB.selected = org.favorited;

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
            writtenNoteText = (managedObject?.note)!;
            originalText = writtenNoteText
            noteTVHasPlaceholder = false;
        }
        else {
            originalText = "Write a note here..."
        }
        
        scrollView = UIScrollView();
        scrollView.delegate = self;
        
        scrollView.contentSize = CGSizeMake(UIScreen.mainScreen().bounds.width, 2000);
        
        containerView = UIView();
        
        buildControls();
        
        scrollView.contentSize.height = aboutBottomContraint + 500;
        
        scrollView.addSubview(containerView);
        view.addSubview(scrollView)
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(OrganizationDescriptionVC.tap(_:)))
        view.addGestureRecognizer(tapGesture)
    }
    
    func tap(gesture: UITapGestureRecognizer) {
        writeNoteContent.resignFirstResponder()
    }
    
    @IBAction func touchBack(segue : UIStoryboardSegue) {
        self.navigationController?.popViewControllerAnimated(true);
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func textViewShouldBeginEditing(textView:UITextView) -> Bool {
        if (noteTVHasPlaceholder) {
            textView.text = "";
            textView.textColor = UIColor.blackColor();
            noteTVHasPlaceholder = false;
        }
        return true;
    }
    
    func textViewDidChange(writeNoteContent:UITextView) {
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
            if (writeNoteContent.text != originalText) {
                if (noteTVHasPlaceholder || writeNoteContent.text.characters.count == 0) {
                    // Delete from core data
                    let appDel:AppDelegate = UIApplication.sharedApplication().delegate as! AppDelegate;
                    let context:NSManagedObjectContext = appDel.managedObjectContext!;
                    let error : NSError? = nil;
                    
                    let pred = NSPredicate(format: "orgId == " + String(orgId));
                    let fetchRequest = NSFetchRequest(entityName: "NotedOrganizations");
                    fetchRequest.predicate = pred;
                
                    
                    let results: [NotedOrganizations];
                    do {
                        results = try context.executeFetchRequest(fetchRequest) as! [NotedOrganizations];
                    }
                    catch _ {
                        handleError("OrgDescVC willDisappear Delete from CD", error: error!);
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
                else if (writeNoteContent.text.characters.count > 0) {
                    // Write to core data
                    let appDel:AppDelegate = UIApplication.sharedApplication().delegate as! AppDelegate;
                    let context:NSManagedObjectContext = appDel.managedObjectContext!;
                    let error : NSError? = nil;

                    // Check if org already exists in core data
                    let pred = NSPredicate(format: "orgId == " + String(orgId));
                    let fetchRequest = NSFetchRequest(entityName: "NotedOrganizations");
                    fetchRequest.predicate = pred;
                    
                    let results: [NotedOrganizations];
                    do {
                        results = try context.executeFetchRequest(fetchRequest) as! [NotedOrganizations];
                    }
                    catch _ {
                        handleError("OrgDescVC willDissappear Check if already exists", error: error!);
                        return;
                    }
                    
                    if (results.count != 0) {
                        let managedObject = results[0];
                        managedObject.setValue(writeNoteContent.text, forKey: "note");
                    }
                    else {
                        let newNote = NSEntityDescription.insertNewObjectForEntityForName("NotedOrganizations", inManagedObjectContext: context) ;
                        newNote.setValue(orgId, forKey: "orgId");
                        newNote.setValue(writeNoteContent.text, forKey: "note");
                        
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
    
    func buildControls() {
        viewOnMapButton = UIButton();
        viewOnMapButton.setTitle("View on Map", forState: UIControlState.Normal)
        viewOnMapButton.addTarget(self, action: #selector(touchViewOnMap), forControlEvents: .TouchDown)
        viewOnMapButton.setTitleColor(UIColor.init(red: 0, green: 122.0/255.0, blue: 1.0, alpha: 1.0), forState: .Normal)
        viewOnMapButton.titleLabel!.font = UIFont.systemFontOfSize(14)
        containerView.addSubview(viewOnMapButton)
        
        dateAndLocationHeader = UILabel();
        dateAndLocationHeader.text = Constants.OD_DateLocationHeader;
        dateAndLocationHeader.font = UIFont.systemFontOfSize(17);
        
        containerView.addSubview(dateAndLocationHeader);
        
        dateAndLocationContent = UILabel();
        dateAndLocationContent.text = dateToString(org.date) + ", " + org.location;
        dateAndLocationContent.font = UIFont.systemFontOfSize(14);
        
        containerView.addSubview(dateAndLocationContent);
        
        writeNoteHeader = UILabel();
        writeNoteHeader.text = Constants.OD_WriteNoteHeader;
        writeNoteHeader.font = UIFont.systemFontOfSize(17);
        
        containerView.addSubview(writeNoteHeader);
        
        
        writeNoteContent = UITextView();
        if (!noteTVHasPlaceholder) {
            writeNoteContent.text = writtenNoteText
            writeNoteContent.textColor = UIColor.blackColor();
        }
        else {
            writeNoteContent.text = "Write a note here..."
            writeNoteContent.textColor = UIColor.lightGrayColor()
        }
        writeNoteContent.font = UIFont.systemFontOfSize(14);
        writeNoteContent.layer.borderWidth = 1.0;
        writeNoteContent.layer.cornerRadius = 5;
        let tfBorderColor:UIColor = UIColor(red: 204.0/255.0, green: 204.0/255.0, blue: 204.0/255.0, alpha: 1.0)
        writeNoteContent.layer.borderColor = tfBorderColor.CGColor;
        writeNoteContent.delegate = self;
        
        
        containerView.addSubview(writeNoteContent);
        
        
        aboutHeader = UILabel();
        aboutHeader.text = Constants.OD_AboutHeader + " " + org.title;
        aboutHeader.font = UIFont.systemFontOfSize(17);
        
        containerView.addSubview(aboutHeader);
        
        
        aboutContent = UITextView();
        aboutContent.scrollEnabled = false
        aboutContent.text = org.desc
        aboutContent.editable = false;
        aboutContent.font = UIFont.systemFontOfSize(14);
        self.aboutHeight = aboutContent.sizeThatFits(aboutContent.sizeThatFits(CGSizeMake(UIScreen.mainScreen().bounds.size.width, CGFloat(FLT_MAX)))).height
        self.aboutBottomContraint = 338 + aboutHeight;
        
        containerView.addSubview(aboutContent);
        
        
        majorHeader = UILabel();
        majorHeader.text = Constants.OD_MajorHeader;
        majorHeader.font = UIFont.systemFontOfSize(17);
        
        containerView.addSubview(majorHeader);
        
        majorContent = UITextView();
        majorContent.scrollEnabled = false
        majorContent.text = "EE, CS, MECH, CE, CHE, NME"
        majorContent.editable = false;
        majorContent.font = UIFont.systemFontOfSize(14);
        
        containerView.addSubview(majorContent);
        
        positionsHeader = UILabel();
        positionsHeader.text = Constants.OD_PositionsAvailHeader;
        positionsHeader.font = UIFont.systemFontOfSize(17);
        
        containerView.addSubview(positionsHeader);
        
        positionsContent = UITextView();
        positionsContent.scrollEnabled = false
        positionsContent.text = "Full-Time, Internship, Co-op";
        positionsContent.editable = false;
        positionsContent.font = UIFont.systemFontOfSize(14);
        
        containerView.addSubview(positionsContent);
        
        
        degreeHeader = UILabel();
        degreeHeader.text = Constants.OD_MajorHeader;
        degreeHeader.font = UIFont.systemFontOfSize(17);
        
        containerView.addSubview(degreeHeader);
        
        degreeContent = UITextView();
        degreeContent.scrollEnabled = false
        degreeContent.text = "Bachelor's, Master's, Ph.D.";
        degreeContent.editable = false;
        degreeContent.font = UIFont.systemFontOfSize(14);
        
        containerView.addSubview(degreeContent);
        
        
        jobLocHeader = UILabel();
        jobLocHeader.text = Constants.OD_JobLocHeader;
        jobLocHeader.font = UIFont.systemFontOfSize(17);
        
        containerView.addSubview(jobLocHeader);
        
        jobLocContent = UITextView();
        jobLocContent.scrollEnabled = false
        jobLocContent.text = org.jobLocation
        jobLocContent.editable = false;
        jobLocContent.font = UIFont.systemFontOfSize(14);
        
        containerView.addSubview(jobLocContent);
        
        sponsorHeader = UILabel();
        sponsorHeader.text = Constants.OD_HiringHeader;
        sponsorHeader.font = UIFont.systemFontOfSize(17);
        
        containerView.addSubview(sponsorHeader);
        
        sponsorContent = UITextView();
        sponsorContent.scrollEnabled = false
        sponsorContent.text = "Yes, On Occasion";
        sponsorContent.editable = false;
        sponsorContent.font = UIFont.systemFontOfSize(14);
        
        containerView.addSubview(sponsorContent);
    }

    

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        if (segue.identifier == "orgDescToMap") {
            let destinationVC = segue.destinationViewController as! MapImageVC;
            let location = parseLocation(org.location)

            destinationVC.mapLocation = location;
            destinationVC.selectedOrgId = orgId
        }
    }
}
