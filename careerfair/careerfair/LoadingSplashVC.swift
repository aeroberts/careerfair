//
//  LoadingSplashVC.swift
//  careerfair
//
//  Created by Alexander Roberts on 6/9/16.
//  Copyright © 2016 AlexRobertsKatePanter. All rights reserved.
//

import UIKit

enum JSONError: String, ErrorType {
    case NoData = "ERROR: no data"
    case ConversionFailed = "ERROR: conversion from JSON failed"
}


class LoadingSplashVC: UIViewController {
    
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    // Load orgData
    func activityFinished(data: NSDictionary) {
        //if let origin = data["origin"] as? String {
        //  print(origin)
        //}
        self.performSegueWithIdentifier("activityDone", sender: self);
    }
    
    func get(url : String, successHandler: (response: NSDictionary) -> Void) {
        let url = NSURL(string: url)
        let request = NSMutableURLRequest(URL: url!);
        request.HTTPMethod = "GET"
        
        let task = NSURLSession.sharedSession().dataTaskWithRequest(request) {
            data, response, error in
            do {
                guard let data = data else {
                    throw JSONError.NoData
                }
                guard let json = try NSJSONSerialization.JSONObjectWithData(data, options: []) as? NSDictionary else {
                    throw JSONError.ConversionFailed
                }
                successHandler(response: json)
            } catch let error as JSONError {
                print(error.rawValue)
            } catch let error as NSError {
                print(error.debugDescription)
            }
        }
        task.resume();
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        activityIndicator.startAnimating()
        
        get("http://httpbin.org/ip", successHandler: activityFinished)
        
        //_ = NSTimer.scheduledTimerWithTimeInterval(6, target: self, selector: #selector(LoadingSplash.activityFinished), userInfo: nil, repeats: false)
        
        // Do any additional setup after loading the view.
    }
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        
    }
}
