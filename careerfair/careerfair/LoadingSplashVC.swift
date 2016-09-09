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
        events.append(Event(fromTitle: "Undergrad Receptions", date_in: makeDate(18, month_in: 9, year_in: 2016, hour_in: 14, minute_in: 30), end_in: makeDate(18, month_in: 9, year_in: 2016, hour_in: 16, minute_in: 00), location_in: "Duderstadt", information_in: "Undergrad Receptions", interested_in: false, eventId_in: 0))
        
        events.append(Event(fromTitle: "Graduate Receptions", date_in: makeDate(18, month_in: 9, year_in: 2016, hour_in: 12, minute_in: 30), end_in: makeDate(18, month_in: 9, year_in: 2016, hour_in: 13, minute_in: 30), location_in: "ECRC", information_in: "Graduate Receptions", interested_in: false, eventId_in: 1))
        
        // Monday september 12
        events.append(Event(fromTitle: "ZS Associates Info Session", date_in: makeDate(12, month_in: 9, year_in: 2016, hour_in: 17, minute_in: 30), end_in: makeDate(12, month_in: 9, year_in: 2016, hour_in: 19, minute_in: 30), location_in: "EECS", information_in: "Learn about ZS Associates in an info session", interested_in: false, eventId_in: 2))
        events.append(Event(fromTitle: "BASF Info Session", date_in: makeDate(12, month_in: 9, year_in: 2016, hour_in: 18, minute_in: 00), end_in: makeDate(12, month_in: 9, year_in: 2016, hour_in: 20, minute_in: 00), location_in: "EECS", information_in: "Learn about BASF in an info session", interested_in: false, eventId_in: 3))
        events.append(Event(fromTitle: "General Electric Info Session", date_in: makeDate(12, month_in: 9, year_in: 2016, hour_in: 18, minute_in: 30), end_in: makeDate(12, month_in: 9, year_in: 2016, hour_in: 20, minute_in: 30), location_in: "EECS", information_in: "Learn about GE in an info session", interested_in: false, eventId_in: 4))
        
        // Tuesday september 13
        events.append(Event(fromTitle: "Barr Engineering Co Info Session", date_in: makeDate(13, month_in: 9, year_in: 2016, hour_in: 17, minute_in: 30), end_in: makeDate(13, month_in: 9, year_in: 2016, hour_in: 19, minute_in: 30), location_in: "EECS", information_in: "Learn about Barr Engineering Co in an info session", interested_in: false, eventId_in: 5))
        events.append(Event(fromTitle: "Whirlpool Corp. Info Session", date_in: makeDate(13, month_in: 9, year_in: 2016, hour_in: 17, minute_in: 30), end_in: makeDate(13, month_in: 9, year_in: 2016, hour_in: 19, minute_in: 30), location_in: "EECS", information_in: "Learn about Whirlpool Corporation in an info session", interested_in: false, eventId_in: 6))
        events.append(Event(fromTitle: "Fiat Chrysler Info Session", date_in: makeDate(13, month_in: 9, year_in: 2016, hour_in: 18, minute_in: 00), end_in: makeDate(13, month_in: 9, year_in: 2016, hour_in: 20, minute_in: 00), location_in: "EECS", information_in: "Learn about Fiat Chrysler Automobiles in an info session", interested_in: false, eventId_in: 7))
        events.append(Event(fromTitle: "Cummins Inc. Info Session", date_in: makeDate(13, month_in: 9, year_in: 2016, hour_in: 18, minute_in: 00), end_in: makeDate(13, month_in: 9, year_in: 2016, hour_in: 20, minute_in: 00), location_in: "EECS", information_in: "Learn about Cummins Inc. in an info session", interested_in: false, eventId_in: 8))
        
        
        // Wednesday September 14
        events.append(Event(fromTitle: "Air Products Info Session", date_in: makeDate(14, month_in: 9, year_in: 2016, hour_in: 18, minute_in: 30), end_in: makeDate(14, month_in: 9, year_in: 2016, hour_in: 20, minute_in: 30), location_in: "EECS", information_in: "Learn about Barr Engineering Co in an info session", interested_in: false, eventId_in: 9))
        
        events.append(Event(fromTitle: "Consumers Energy Info Session", date_in: makeDate(14, month_in: 9, year_in: 2016, hour_in: 19, minute_in: 00), end_in: makeDate(14, month_in: 9, year_in: 2016, hour_in: 21, minute_in: 00), location_in: "EECS", information_in: "Learn about Consumers Energy in an info session", interested_in: false, eventId_in: 10))
        
        
        // Thursday September 15
        //General Mills- Thursday, Sept. 15th 5:30pm-7:30pm
        //The Lee Company- Thursday, Sept. 15th 6pm-8pm
        //Lear Corporation- Thursday, Sept. 15th, 7pm-9pm
        events.append(Event(fromTitle: "General Mills Info Session", date_in: makeDate(15, month_in: 9, year_in: 2016, hour_in: 17, minute_in: 30), end_in: makeDate(15, month_in: 9, year_in: 2016, hour_in: 19, minute_in: 30), location_in: "EECS", information_in: "Learn about Fiat Chrysler Automobiles in an info session", interested_in: false, eventId_in: 11))
        events.append(Event(fromTitle: "The Lee Company Info Session", date_in: makeDate(15, month_in: 9, year_in: 2016, hour_in: 18, minute_in: 00), end_in: makeDate(15, month_in: 9, year_in: 2016, hour_in: 20, minute_in: 00), location_in: "EECS", information_in: "Learn about The Lee Company in an info session", interested_in: false, eventId_in: 12))
        events.append(Event(fromTitle: "Lear Corp. Info Session", date_in: makeDate(15, month_in: 9, year_in: 2016, hour_in: 19, minute_in: 00), end_in: makeDate(15, month_in: 9, year_in: 2016, hour_in: 21, minute_in: 00), location_in: "EECS", information_in: "Learn about Lear Corporation in an info session", interested_in: false, eventId_in: 13))
        
        //Monday September 19
        //Uptake Technologies, Inc. - Monday, Sept. 19th 5:30pm-7:30pm
        //National Instruments- Monday, Sept. 19th 6pm-8pm
        //Echelon Consulting LLC- Monday, Sept. 19th 6pm-8pm
        //Exponent- Monday, Sept. 19th 6:30pm-8:30pm
        events.append(Event(fromTitle: "Uptake Technologies, Inc. Info Session", date_in: makeDate(19, month_in: 9, year_in: 2016, hour_in: 18, minute_in: 00), end_in: makeDate(19, month_in: 9, year_in: 2016, hour_in: 20, minute_in: 00), location_in: "EECS", information_in: "Learn about Uptake Technologies Info Session in an info session", interested_in: false, eventId_in: 14))
        events.append(Event(fromTitle: "National Instruments Info Session", date_in: makeDate(19, month_in: 9, year_in: 2016, hour_in: 18, minute_in: 00), end_in: makeDate(15, month_in: 9, year_in: 2016, hour_in: 20, minute_in: 00), location_in: "EECS", information_in: "Learn about National Instruments in an info session", interested_in: false, eventId_in: 15))
        events.append(Event(fromTitle: "Echelon Consulting LLC Info Session", date_in: makeDate(19, month_in: 9, year_in: 2016, hour_in: 18, minute_in: 00), end_in: makeDate(19, month_in: 9, year_in: 2016, hour_in: 20, minute_in: 00), location_in: "EECS", information_in: "Learn about Echelon Consulting LLC in an info session", interested_in: false, eventId_in: 16))
        events.append(Event(fromTitle: "Exponent Info Session", date_in: makeDate(19, month_in: 9, year_in: 2016, hour_in: 18, minute_in: 30), end_in: makeDate(19, month_in: 9, year_in: 2016, hour_in: 20, minute_in: 30), location_in: "EECS", information_in: "Learn about Exponent in an info session", interested_in: false, eventId_in: 17))
        
        //Tuesday September 20
        //Textron- Tuesday, Sept. 20th 5:30pm-7:30pm
        //Amazon- Tuesday, Sept. 20th 5:30pm-7:30pm
        //ANDREESSEN HOROWITZ- Tuesday, Sept. 20th 6pm-8pm
        //Citrix Systems Inc.- Tuesday, Sept. 20th 7pm-9pm
        events.append(Event(fromTitle: "Textron Info Session", date_in: makeDate(20, month_in: 9, year_in: 2016, hour_in: 17, minute_in: 30), end_in: makeDate(19, month_in: 9, year_in: 2016, hour_in: 19, minute_in: 30), location_in: "EECS", information_in: "Learn about Textron Info Session in an info session", interested_in: false, eventId_in: 18))
        events.append(Event(fromTitle: "Amazon Info Session", date_in: makeDate(19, month_in: 9, year_in: 2016, hour_in: 17, minute_in: 30), end_in: makeDate(15, month_in: 9, year_in: 2016, hour_in: 19, minute_in: 30), location_in: "EECS", information_in: "Learn about Amazon in an info session", interested_in: false, eventId_in: 19))
        events.append(Event(fromTitle: "Andreessen Horowitz Info Session", date_in: makeDate(19, month_in: 9, year_in: 2016, hour_in: 18, minute_in: 00), end_in: makeDate(19, month_in: 9, year_in: 2016, hour_in: 20, minute_in: 00), location_in: "EECS", information_in: "Learn about Andreessen Horowitz in an info session", interested_in: false, eventId_in: 20))
        events.append(Event(fromTitle: "Citrix Systems Inc. Info Session", date_in: makeDate(19, month_in: 9, year_in: 2016, hour_in: 18, minute_in: 00), end_in: makeDate(19, month_in: 9, year_in: 2016, hour_in: 20, minute_in: 00), location_in: "EECS", information_in: "Learn about Citrix Systems Inc. in an info session", interested_in: false, eventId_in: 21))
        
        //Tuesday September 21
        //Raytheon- Tuesday, Sept. 20th 5:30pm-7:30pm
        events.append(Event(fromTitle: "Raytheon Info Session", date_in: makeDate(21, month_in: 9, year_in: 2016, hour_in: 18, minute_in: 00), end_in: makeDate(21, month_in: 9, year_in: 2016, hour_in: 20, minute_in: 00), location_in: "EECS", information_in: "Learn about Raytheon Info Session in an info session", interested_in: false, eventId_in: 18))
        
        
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
