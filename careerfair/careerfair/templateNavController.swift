//
//  navigationController.swift
//  careerfair
//
//  Created by Roberts, Alexander on 9/17/15.
//  Copyright (c) 2015 AlexRobertsKatePanter. All rights reserved.
//

import UIKit

class templateNavController: UINavigationController, UINavigationBarDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationBar.barTintColor = UIColor(red: 00, green: 39/255, blue: 76/255, alpha: 1.0);
        navigationBar.translucent = false;
        navigationBar.tintColor = UIColor(red: 255/255, green: 203/255, blue: 5/255, alpha: 1.0);
        navigationBar.titleTextAttributes = [NSForegroundColorAttributeName : UIColor.whiteColor()];
        
        // Do any additional setup after loading the view.
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
