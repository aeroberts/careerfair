//
//  testScrollViewController.swift
//  careerfair
//
//  Created by Roberts, Alexander on 9/18/15.
//  Copyright (c) 2015 AlexRobertsKatePanter. All rights reserved.
//

import UIKit

class testScrollViewController: UIViewController, UIScrollViewDelegate {
    var scrollView:UIScrollView!
    var containerView:UIView!
    
    var contentLabel:UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        scrollView = UIScrollView();
        scrollView.delegate = self;
        scrollView.contentSize = CGSizeMake(UIScreen.mainScreen().bounds.width, 2000);

        containerView = UIView();
        
        buildControls()
        
        scrollView.addSubview(containerView);
        view.addSubview(scrollView);
        
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews();
        
        scrollView.frame = view.bounds
        containerView.frame = CGRectMake(0, 0, scrollView.contentSize.width, scrollView.contentSize.height);
        
        contentLabel = UILabel();
        contentLabel.frame =
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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