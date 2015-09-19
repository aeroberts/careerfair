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
    
    var contentLabel:UITextView!
    
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
        
        contentLabel.frame = CGRectMake(20, 20, 100, 100);
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func buildControls() {
        contentLabel = UITextView();
        contentLabel.text = "Hey I'm placeholder text";
        contentLabel.delegate = self;
        
        containerView.addSubview(contentLabel);
        
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