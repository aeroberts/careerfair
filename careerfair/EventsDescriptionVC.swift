//
//  EventsDescriptionVC.swift
//  careerfair
//
//  Created by Roberts, Alexander on 9/16/15.
//  Copyright (c) 2015 AlexRobertsKatePanter. All rights reserved.
//

import UIKit

class EventsDescriptionVC: UIViewController, UIScrollViewDelegate {
    var event:Event = Event();
    
    var scrollView:UIScrollView!
    var containerView:UIView!
    
    var dateAndLocationHeader:UILabel!
    var dateAndLocationContent:UILabel!
    var aboutHeader:UILabel!
    var aboutContent:UITextView!
    
    var aboutHeight:CGFloat = -1;
    var aboutBottomContraint:CGFloat = -1;

    
    
    @IBOutlet weak var toDoButton: UIButton!
    @IBAction func touchToDo(sender: AnyObject) {
        if (!event.interested) {
            // Add to To-Do List
            sender.setImage(UIImage(named: "heartfaved"), forState: UIControlState.Normal);
        }
        else {
            // Remove from To-Do List
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
        
        dateAndLocationHeader.frame = CGRectMake(16, 20, UIScreen.mainScreen().bounds.width/2, 21);
        dateAndLocationContent.frame = CGRectMake(36, 63, UIScreen.mainScreen().bounds.width/2, 17);
        
        aboutHeader.frame = CGRectMake(16, 120, UIScreen.mainScreen().bounds.width/2, 21);
        aboutContent.frame = CGRectMake(24, 142, UIScreen.mainScreen().bounds.width-28, aboutHeight);
    }
    
    func buildControls() {
        dateAndLocationHeader = UILabel();
        dateAndLocationHeader.text = Constants.OD_DateLocationHeader;
        dateAndLocationHeader.font = UIFont.systemFontOfSize(17);
        
        containerView.addSubview(dateAndLocationHeader);
        
        dateAndLocationContent = UILabel();
        dateAndLocationContent.text = dateToStringWithTime(event.date) + " - " + event.location;
        dateAndLocationContent.font = UIFont.systemFontOfSize(14);
        
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
        self.aboutHeight = aboutContent.sizeThatFits(aboutContent.sizeThatFits(CGSizeMake(UIScreen.mainScreen().bounds.size.width, CGFloat(FLT_MAX)))).height
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
