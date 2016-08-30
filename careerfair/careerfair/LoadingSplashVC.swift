//
//  LoadingSplashVC.swift
//  careerfair
//
//  Created by Alexander Roberts on 6/9/16.
//  Copyright © 2016 AlexRobertsKatePanter. All rights reserved.
//

import UIKit
import CoreData

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
    
        let appDel:AppDelegate = UIApplication.sharedApplication().delegate as! AppDelegate;
        let context:NSManagedObjectContext = appDel.managedObjectContext!;
        let error : NSError? = nil;
        loadFavorited(appDel, context: context, err: error);
        loadNoted(appDel, context: context, err: error);
        
        // Insert favorited and noted orgs (could be done above and would be faster)
        for org in orgData {
            if (org.1.favorited) {
                favoritedOrgs.insert(org.0);
            }
            if (org.1.note.isEmpty == false) {
                notedOrgs.insert(org.0);
            }
        }
        
        // Check all orgId's within noted/favorited are valid
        for orgId in favoritedOrgs {
            if (orgData[orgId] == nil) {
                favoritedOrgs.remove(orgId);
            }
        }
        
        for orgId in notedOrgs {
            if (orgData[orgId] == nil) {
                notedOrgs.remove(orgId);
            }
        }

        // If all data is loaded, then transition
        orgDataHandled = true
        attemptTransition()
    }
    
    func eventDataReceived(data: NSDictionary) {
        //if let origin = data["origin"] as? String {
        //  print(origin)
        //}
        
        // Load event data into eventData
        events.append(Event(fromTitle: "Resume Check Sesh", date_in: makeDate(28, month_in: 9, year_in: 2016, hour_in: 14, minute_in: 30), end_in: makeDate(28, month_in: 9, year_in: 2016, hour_in: 16, minute_in: 00), location_in: "Duderstadt", information_in: "Come get your resume checked by the ecrc", interested_in: false, eventId_in: 10))
        events.append(Event(fromTitle: "Interviewing Prep Sesh", date_in: makeDate(29, month_in: 9, year_in: 2016, hour_in: 12, minute_in: 30), end_in: makeDate(29, month_in: 9, year_in: 2016, hour_in: 13, minute_in: 30), location_in: "ECRC", information_in: "Learn how to improve your interview skills in a mock interview", interested_in: false, eventId_in: 12))
        events.append(Event(fromTitle: "Tech Talk X", date_in: makeDate(24, month_in: 9, year_in: 2016, hour_in: 15, minute_in: 00), end_in: makeDate(24, month_in: 9, year_in: 2016, hour_in: 16, minute_in: 00), location_in: "EECS", information_in: "Literally everyones favorite compnay is giving a tech talk.  Hosted by HKN.  Food will be involved.", interested_in: false, eventId_in: 3))
        
        events.sortInPlace({ $0.startTime.timeIntervalSinceReferenceDate < $1.startTime.timeIntervalSinceReferenceDate })
        
        var pos = 0;
        for event in events {
            eventIdsToPosition[event.eventId] = pos;
            pos += 1;
        }
        
        let appDel:AppDelegate = UIApplication.sharedApplication().delegate as! AppDelegate;
        let context:NSManagedObjectContext = appDel.managedObjectContext!;
        let error : NSError? = nil;
        loadEvents(appDel, context: context, err: error);

        
        
        // If all data is loaded, then transition
        eventDataHandled = true
        attemptTransition()
    }
    
    func announcementDataReceived(data: NSDictionary) {
        //if let origin = data["origin"] as? String {
        //  print(origin)
        //}
        
        // Load announcement data into announcementData
        announcements.append(Announcement(information_in: "Fitbit has sponsored pizza at the dB Cafe!  Visit the fitbit booth to get a token for pizza", title_in: "Fitbit sponsors pizza at dB Cafe"))
        
        // If all data is loaded, then transition
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
    
    func loadFavorited(appDel:AppDelegate, context:NSManagedObjectContext, err:NSError?) {
        
        let favoriteRequest = NSFetchRequest(entityName: "FavoritedOrganizations");
        favoriteRequest.returnsObjectsAsFaults = false;
        
        let favoritedResults: [FavoritedOrganizations];
        do {
            favoritedResults = try context.executeFetchRequest(favoriteRequest) as! [FavoritedOrganizations];
            for result:NSManagedObject in favoritedResults {
                let orgId = result.valueForKey("orgId") as! Int;
                if (orgData[orgId] != nil) {
                    orgData[orgId]?.favorited = true;
                }
            }
        }
        catch _ {
            handleError("AppDelegate favoritedResults fetchRequest", error: err!);
        }
    }
    
    func loadNoted(appDel:AppDelegate, context:NSManagedObjectContext, err:NSError?) {
        let notedRequest = NSFetchRequest(entityName: "NotedOrganizations");
        notedRequest.returnsObjectsAsFaults = false;
        
        let notedResults: [NotedOrganizations];
        do {
            notedResults = try context.executeFetchRequest(notedRequest) as! [NotedOrganizations];
            for result:NSManagedObject in notedResults {
                let orgId = result.valueForKey("orgId") as! Int;
                if (orgData[orgId] != nil) {
                    orgData[orgId]?.note = result.valueForKey("note") as! String;
                }
            }
        }
        catch _ {
            handleError("AppDelegate notedResults fetchRequest", error: err!);
            
        }
        
    }
    
    func loadEvents(appDel:AppDelegate, context:NSManagedObjectContext, err:NSError?) {
        let eventRequest = NSFetchRequest(entityName: "ToDoEvents");
        eventRequest.returnsObjectsAsFaults = false;
        
        let eventResults: [ToDoEvents];
        do {
            eventResults = try context.executeFetchRequest(eventRequest) as! [ToDoEvents];
            for result:NSManagedObject in eventResults {
                let eventId = result.valueForKey("eventId") as! Int;
                if (eventIdsToPosition[eventId] != nil) {
                    events[eventIdsToPosition[eventId]!].interested = true;
                    toDoEvents.insert(eventId);
                }
                else {
                    
                    let pred = NSPredicate(format: "eventId == " + String(eventId));
                    let fetchRequest = NSFetchRequest(entityName: "ToDoEvents");
                    fetchRequest.predicate = pred;
                    
                    let results = (try? context.executeFetchRequest(fetchRequest)) as? [ToDoEvents];
                    context.deleteObject(results!.first!);
                    do {
                        try context.save()
                    } catch _ {
                    };
                    
                }
            }
        }
        catch _ {
            handleError("AppDelegate notedResults fetchRequest", error: err!);
            
        }
        
        
    }

}
