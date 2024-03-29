//
//  EventsDescriptionVC.swift
//  careerfair
//
//  Created by Roberts, Alexander on 9/16/15.
//  Copyright (c) 2015 AlexRobertsKatePanter. All rights reserved.
//

import UIKit
import CoreData

class EventsDescriptionVC: UIViewController, UIScrollViewDelegate {
    var event:Event = Event();
    
    var scrollView:UIScrollView!
    var containerView:UIView!
    
    var dateAndLocationHeader:UILabel!
    var dateAndLocationContent:UITextView!
    var aboutHeader:UILabel!
    var aboutContent:UITextView!
    
    var dateHeight:CGFloat = -1;
    var dateBottom:CGFloat = -1;
    
    var aboutHeight:CGFloat = -1;
    var aboutBottomContraint:CGFloat = -1;

    
    
    @IBOutlet weak var toDoButton: UIButton!
    @IBAction func touchToDo(sender: AnyObject) {
        if (!event.interested) {
            // Add to To-Do List
            
            let appDel:AppDelegate = UIApplication.sharedApplication().delegate as! AppDelegate;
            let context:NSManagedObjectContext = appDel.managedObjectContext!;
            
            let newFavorite = NSEntityDescription.insertNewObjectForEntityForName("ToDoEvents", inManagedObjectContext: context) ;
            newFavorite.setValue(event.eventId, forKey: "eventId");
            do {
                try context.save()
            } catch _ {
            };
            
            if (toDoEvents.contains(event.eventId)) {
                print("ERROR, INSERTING ORG ID INTO FAVORITED THAT ALREADY EXISTS");
            }
            toDoEvents.insert(event.eventId);
            
            sender.setImage(UIImage(named: "heartfaved"), forState: UIControlState.Normal);
        }
        else {
            // Remove from To-Do List
            let appDel:AppDelegate = UIApplication.sharedApplication().delegate as! AppDelegate;
            let context:NSManagedObjectContext = appDel.managedObjectContext!;
            let pred = NSPredicate(format: "eventId == " + String(event.eventId));
            let fetchRequest = NSFetchRequest(entityName: "ToDoEvents");
            fetchRequest.predicate = pred;
            
            let results = (try? context.executeFetchRequest(fetchRequest)) as? [ToDoEvents];
            context.deleteObject(results!.first!);
            do {
                try context.save()
            } catch _ {
            };
            
            //Remove from list of favorites
            if (!toDoEvents.contains(event.eventId)) {
                print("ERROR, REMOVING ORG FROM FAVORITED THAT DOESN'T EXIST");
            }
            toDoEvents.remove(event.eventId);
            
            sender.setImage(UIImage(named: "heartunfaved"), forState: UIControlState.Normal);
        }
        
        event.interested = !event.interested
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        toDoButton.setImage(UIImage(named: "heartunfaved"), forState: UIControlState.Normal);
        toDoButton.setImage(UIImage(named: "heartfaved"), forState: UIControlState.Selected);
        toDoButton.selected = event.interested;
        
        self.title = event.title
        
        scrollView = UIScrollView();
        scrollView.delegate = self;
        
        scrollView.contentSize = CGSizeMake(UIScreen.mainScreen().bounds.width, 2000);
        
        containerView = UIView();
        
        buildControls();
        
        scrollView.contentSize.height = min(aboutBottomContraint + 20, view.bounds.size.height);
        
        scrollView.addSubview(containerView);
        view.addSubview(scrollView);
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews();
        
        scrollView.frame = view.bounds
        containerView.frame = CGRectMake(0, 0, scrollView.contentSize.width, scrollView.contentSize.height);
        
        dateAndLocationHeader.frame = CGRectMake(16, 20, UIScreen.mainScreen().bounds.width-32, 21);
        dateAndLocationContent.frame = CGRectMake(36, 63, UIScreen.mainScreen().bounds.width-52, dateHeight);
        
        aboutHeader.frame = CGRectMake(16, 128, UIScreen.mainScreen().bounds.width-32, 21);
        aboutContent.frame = CGRectMake(24, 150, UIScreen.mainScreen().bounds.width-28, aboutHeight);
    }
    
    @IBAction func touchBack(segue: UIStoryboardSegue) {
        self.navigationController?.popViewControllerAnimated(true);
    }
    
    func buildControls() {
        dateAndLocationHeader = UILabel();
        dateAndLocationHeader.text = Constants.OD_DateLocationHeader;
        dateAndLocationHeader.font = UIFont.systemFontOfSize(17);
        
        containerView.addSubview(dateAndLocationHeader);
        
        dateAndLocationContent = UITextView();
        dateAndLocationContent.scrollEnabled = false
        dateAndLocationContent.text = dateToStringWithTime(event.startTime) + " - " + event.location;
        dateAndLocationContent.font = UIFont.systemFontOfSize(13);
        self.dateHeight = dateAndLocationContent.sizeThatFits(dateAndLocationContent.sizeThatFits(CGSizeMake(UIScreen.mainScreen().bounds.size.width-32, CGFloat(FLT_MAX)))).height
        self.dateBottom = 36 + dateAndLocationContent.bounds.height
        containerView.addSubview(dateAndLocationContent);
        
        
        aboutHeader = UILabel();
        aboutHeader.text = Constants.OD_AboutHeader;
        aboutHeader.font = UIFont.systemFontOfSize(17);
        containerView.addSubview(aboutHeader);
        
        
        aboutContent = UITextView();
        aboutContent.scrollEnabled = false
        aboutContent.text = event.information;
        aboutContent.editable = false;
        aboutContent.font = UIFont.systemFontOfSize(14);
        self.aboutHeight = aboutContent.sizeThatFits(aboutContent.sizeThatFits(CGSizeMake(UIScreen.mainScreen().bounds.size.width-32, CGFloat(FLT_MAX)))).height
        self.aboutBottomContraint = 338 + aboutHeight;
        
        containerView.addSubview(aboutContent);
    }


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
