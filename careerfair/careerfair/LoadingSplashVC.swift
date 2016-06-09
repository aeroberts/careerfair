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
    var orgDataHandled = false
    var eventDataHandled = false
    var announcementDataHandled = false
    
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    func attemptTransition() {
        if (orgDataHandled && eventDataHandled && announcementDataHandled) {
            self.performSegueWithIdentifier("activityDone", sender: self);
        }
    }
    
    func orgDataReceived(data: NSDictionary) {
        //if let origin = data["origin"] as? String {
        //  print(origin)
        //}
        
        // Load org data into orgData
    
        // If all data is loaded, then transition
        orgDataHandled = true
        print("OD Handled")
        attemptTransition()
    }
    
    func eventDataReceived(data: NSDictionary) {
        //if let origin = data["origin"] as? String {
        //  print(origin)
        //}
        
        // Load event data into eventData
        
        // If all data is loaded, then transition
        print("ED Handled")
        eventDataHandled = true
        attemptTransition()
    }
    
    func announcementDataReceived(data: NSDictionary) {
        //if let origin = data["origin"] as? String {
        //  print(origin)
        //}
        
        // Load announcement data into announcementData
        
        // If all data is loaded, then transition
        print("AD Handled")
        announcementDataHandled = true
        attemptTransition()
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
        
        get("http://httpbin.org/ip", successHandler: orgDataReceived)
        get("http://httpbin.org/user-agent", successHandler: eventDataReceived)
        get("http://httpbin.org/get", successHandler: announcementDataReceived)
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
