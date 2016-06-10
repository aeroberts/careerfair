//
//  AnnouncementsDescriptionVCViewController.swift
//  careerfair
//
//  Created by Alexander Roberts on 6/10/16.
//  Copyright © 2016 AlexRobertsKatePanter. All rights reserved.
//

import UIKit

class AnnouncementsDescriptionVC: UIViewController, UIScrollViewDelegate {
    var announcement = Announcement();

    var scrollView:UIScrollView!
    var containerView:UIView!
    
    var aboutHeader:UITextView!
    var aboutContent:UITextView!
    
    var aboutHeaderHeight:CGFloat = -1;
    var aboutHeaderBottomConstraint:CGFloat = -1;
    
    var aboutContentHeight:CGFloat = -1;
    var aboutContentBottomContraint:CGFloat = -1;
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        scrollView = UIScrollView();
        scrollView.delegate = self;
        
        scrollView.contentSize = CGSizeMake(UIScreen.mainScreen().bounds.width, 2000);
        
        containerView = UIView();
        
        buildControls();
        
        scrollView.contentSize.height = min(aboutContentBottomContraint + 20, view.bounds.size.height);
        
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
        
        aboutHeader.frame = CGRectMake(16, 20, UIScreen.mainScreen().bounds.width-16, aboutHeaderHeight);
        aboutContent.frame = CGRectMake(24, aboutHeaderBottomConstraint+22, UIScreen.mainScreen().bounds.width-28, aboutContentHeight);
    }
    
    func buildControls() {
        aboutHeader = UITextView()
        aboutHeader.scrollEnabled = false
        aboutHeader.text = announcement.title
        aboutHeader.editable = false;
        aboutHeader.font = UIFont.systemFontOfSize(17);
        self.aboutHeaderHeight = aboutHeader.sizeThatFits(aboutHeader.sizeThatFits(CGSizeMake(UIScreen.mainScreen().bounds.size.width-32, CGFloat(FLT_MAX)))).height
        self.aboutHeaderBottomConstraint = 20 + aboutHeaderHeight;
        
        
        containerView.addSubview(aboutHeader);
        
        aboutContent = UITextView();
        aboutContent.scrollEnabled = false
        aboutContent.text = announcement.information
        aboutContent.editable = false;
        aboutContent.font = UIFont.systemFontOfSize(14);
        self.aboutContentHeight = aboutContent.sizeThatFits(aboutContent.sizeThatFits(CGSizeMake(UIScreen.mainScreen().bounds.size.width-40, CGFloat(FLT_MAX)))).height
        self.aboutContentBottomContraint = 63 + aboutContentHeight + 20;
        
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
