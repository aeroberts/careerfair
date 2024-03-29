//
//  FAQVC.swift
//  careerfair
//
//  Created by Alexander Roberts on 6/10/16.
//  Copyright © 2016 AlexRobertsKatePanter. All rights reserved.
//

import UIKit

class FAQVC: UIViewController {
    @IBOutlet weak var faqTV: UITextView!
    @IBOutlet weak var navigationBar: UINavigationBar!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationBar.barTintColor = UIColor(red: 00, green: 39/255, blue: 76/255, alpha: 1.0);
        navigationBar.translucent = false;
        navigationBar.tintColor = UIColor(red: 255/255, green: 203/255, blue: 5/255, alpha: 1.0);
        navigationBar.titleTextAttributes = [NSForegroundColorAttributeName : UIColor.whiteColor()];
        
        let path = NSBundle.mainBundle().pathForResource("faq", ofType: "txt")
        if path == nil { /* Error */ }
        
        var fileContents: String? = nil
        do {
            fileContents = try String(contentsOfFile: path!, encoding: NSUTF8StringEncoding)
        } catch _ as NSError { /* Error */ }
        
        faqTV.text = fileContents;
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
