//
//  testScrollViewController.swift
//  careerfair
//
//  Created by Roberts, Alexander on 9/18/15.
//  Copyright (c) 2015 AlexRobertsKatePanter. All rights reserved.
//

import UIKit

class testScrollViewController: UIViewController, UIScrollViewDelegate, UITextViewDelegate {
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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        scrollView = UIScrollView();
        scrollView.delegate = self;
        scrollView.contentSize = CGSizeMake(UIScreen.mainScreen().bounds.width, 2000);

        containerView = UIView();
        
        buildControls();
        
        scrollView.addSubview(containerView);
        view.addSubview(scrollView);
        
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews();
        
        scrollView.frame = view.bounds
        containerView.frame = CGRectMake(0, 0, scrollView.contentSize.width, scrollView.contentSize.height);
        
        dateAndLocationHeader.frame = CGRectMake(16, 20, UIScreen.mainScreen().bounds.width/2, 21);
        dateAndLocationContent.frame = CGRectMake(36, 63, UIScreen.mainScreen().bounds.width/2, 17);
        writeNoteHeader.frame = CGRectMake(16, 114, UIScreen.mainScreen().bounds.width/2, 21);
        writeNoteContent.frame = CGRectMake(16, 143, UIScreen.mainScreen().bounds.width-32, 130);
        aboutHeader.frame = CGRectMake(16, 309, UIScreen.mainScreen().bounds.width/2, 21);
        aboutContent.frame = CGRectMake(24, 338, UIScreen.mainScreen().bounds.width-28, aboutHeight);
        majorHeader.frame = CGRectMake(16, aboutBottomContraint+20, UIScreen.mainScreen().bounds.width/2, 21);
        majorContent.frame = CGRectMake(24, aboutBottomContraint+49, UIScreen.mainScreen().bounds.width-28, 74);
        positionsHeader.frame = CGRectMake(16, aboutBottomContraint+153, UIScreen.mainScreen().bounds.width/2, 21);
        positionsContent.frame = CGRectMake(24, aboutBottomContraint+182, UIScreen.mainScreen().bounds.width-28, 25);
        degreeHeader.frame = CGRectMake(16, aboutBottomContraint+237, UIScreen.mainScreen().bounds.width/2, 21);
        degreeContent.frame = CGRectMake(24, aboutBottomContraint+266, UIScreen.mainScreen().bounds.width-28, 25);

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func buildControls() {
        dateAndLocationHeader = UILabel();
        dateAndLocationHeader.text = Constants.OD_DateLocationHeader;
        dateAndLocationHeader.font = UIFont.systemFontOfSize(17);
        
        containerView.addSubview(dateAndLocationHeader);
        
        dateAndLocationContent = UILabel();
        dateAndLocationContent.text = "Monday, BBB";
        dateAndLocationContent.font = UIFont.systemFontOfSize(14);
        
        containerView.addSubview(dateAndLocationContent);
        
        writeNoteHeader = UILabel();
        writeNoteHeader.text = Constants.OD_WriteNoteHeader;
        writeNoteHeader.font = UIFont.systemFontOfSize(17);
        
        containerView.addSubview(writeNoteHeader);

        
        writeNoteContent = UITextView();
        writeNoteContent.text = "There is a lot of temp text used in writeNoteHeader in order to test the size of the textview and see how wrapping and scrolling works.  Here is more temp text";
        writeNoteContent.font = UIFont.systemFontOfSize(14);
        writeNoteContent.layer.borderWidth = 1.0;
        writeNoteContent.layer.cornerRadius = 5;
        var tfBorderColor:UIColor = UIColor(red: 204.0/255.0, green: 204.0/255.0, blue: 204.0/255.0, alpha: 1.0)
        writeNoteContent.layer.borderColor = tfBorderColor.CGColor;
        
        containerView.addSubview(writeNoteContent);
        
        
        aboutHeader = UILabel();
        aboutHeader.text = Constants.OD_AboutHeader;
        aboutHeader.font = UIFont.systemFontOfSize(17);
        
        containerView.addSubview(aboutHeader);
        
        
        aboutContent = UITextView();
        aboutContent.text = "Another long temp text used in aboutNoteContent in order to test hte size and fot heisfjkls; and see how wrapping and scrolling works.  Here is more temp text!";
        aboutContent.editable = false;
        aboutContent.font = UIFont.systemFontOfSize(14);
        self.aboutHeight = 130;
        self.aboutBottomContraint = 338 + aboutHeight;
        
        containerView.addSubview(aboutContent);
        
        
        majorHeader = UILabel();
        majorHeader.text = Constants.OD_MajorHeader;
        majorHeader.font = UIFont.systemFontOfSize(17);
        
        containerView.addSubview(majorHeader);
        
        majorContent = UITextView();
        majorContent.text = "FE, MSE, DS, ISD, CEE, MFE, BME, CIVIL, ROB, AOSS, IP, IOE, CLASP, CHE, EE, AUTO, NERS, AERO, CE, ESE, ENT, CS, EP, MECHE, NAME, APhys, PHARM, EE:S"
        majorContent.font = UIFont.systemFontOfSize(14);
        
        containerView.addSubview(majorContent);
        
        positionsHeader = UILabel();
        positionsHeader.text = Constants.OD_PositionsAvailHeader;
        positionsHeader.font = UIFont.systemFontOfSize(17);
        
        containerView.addSubview(positionsHeader);
        
        positionsContent = UITextView();
        positionsContent.text = "Full-Time, Internship, Co-op";
        positionsContent.font = UIFont.systemFontOfSize(14);
        
        containerView.addSubview(positionsContent);
        
        
        degreeHeader = UILabel();
        degreeHeader.text = Constants.OD_MajorHeader;
        degreeHeader.font = UIFont.systemFontOfSize(17);
        
        containerView.addSubview(degreeHeader);
        
        degreeContent = UITextView();
        degreeContent.text = "Bachelor's, Master's, Ph.D.";
        degreeContent.font = UIFont.systemFontOfSize(14);
        
        containerView.addSubview(degreeContent);

        
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