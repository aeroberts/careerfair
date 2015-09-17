//
//  AppDelegate.swift
//  careerfair
//
//  Created by Alexander Roberts on 7/19/15.
//  Copyright (c) 2015 AlexRobertsKatePanter. All rights reserved.
//

import UIKit
import CoreData

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        // Load orgData from database
        
        orgData[0]=(organization(fromTitle: "Bob", desc_in: "This is bob", note_in: "", favorited_in: false, date_in: "Thursday", location_in: "BBB", internshipC_in: true, fulltimeC_in: false, coopC_in: false, bachelorsC_in: true, mastersC_in: false, doctoralC_in: false, sponsorYesC_in: true, sponsorNoC_in: false, sponsorOnOccasionC_in: false, majorC_in: [1, 2, 3, 4, 5]));
        orgData[1]=(organization(fromTitle: "Kathyyy", desc_in: "Is the...", note_in: "", favorited_in: false, date_in: "Friday", location_in: "EECS", internshipC_in: true, fulltimeC_in: false, coopC_in: false, bachelorsC_in: true, mastersC_in: false, doctoralC_in: false, sponsorYesC_in: false, sponsorNoC_in: false, sponsorOnOccasionC_in: false, majorC_in: [8]));
        orgData[2]=(organization(fromTitle: "Alx", desc_in: "Best", note_in: "Suchacutie", favorited_in: false, date_in: "Thrusday", location_in: "BBB", internshipC_in: false, fulltimeC_in: true, coopC_in: true, bachelorsC_in: true, mastersC_in: true, doctoralC_in: false, sponsorYesC_in: false, sponsorNoC_in: true, sponsorOnOccasionC_in: true, majorC_in: [1,2,3,4,5,6,7,8,9]));
        orgData[3]=(organization(fromTitle: "Dow Company", desc_in: "In", note_in: "Dow", favorited_in: false, date_in: "Friday", location_in: "Dow", internshipC_in: false, fulltimeC_in: true, coopC_in: true, bachelorsC_in: true, mastersC_in: true, doctoralC_in: false, sponsorYesC_in: false, sponsorNoC_in: true, sponsorOnOccasionC_in: true, majorC_in: [1,2,3,4,5,6,7,8,9]));
        
        
        
        // Load favorited/noted from memory
        var appDel:AppDelegate = UIApplication.sharedApplication().delegate as! AppDelegate;
        var context:NSManagedObjectContext = appDel.managedObjectContext!;
        
        var favoriteRequest = NSFetchRequest(entityName: "FavoritedOrganizations");
        favoriteRequest.returnsObjectsAsFaults = false;
        // NOT RETURNING ERROR NEED TO FIXT HIS
        var error : NSError?

        var favoritedResults = context.executeFetchRequest(favoriteRequest, error: &error) as? [FavoritedOrganizations];
        
        println("ERROR:");
        println(error);
        for result:NSManagedObject in favoritedResults! {
            var orgId = result.valueForKey("orgId") as! Int;
            if (orgData[orgId] != nil) {
                orgData[orgId]?.favorited = true;
            }
        }
        
        var notedRequest = NSFetchRequest(entityName: "NotedOrganizations");
        notedRequest.returnsObjectsAsFaults = false;
        var notedResults = context.executeFetchRequest(notedRequest, error: nil) as? [NotedOrganizations];
        
        for result:NSManagedObject in notedResults! {
            var orgId = result.valueForKey("orgId") as! Int;
            if (orgData[orgId] != nil) {
                orgData[orgId]?.note = result.valueForKey("note") as! String;
            }
        }
        
        
        // Insert favorited and noted orgs (could be done above and would be faster)
        for org in orgData {
            if (org.1.favorited) {
                println(org.0);
                favoritedOrgs.insert(org.0);
            }
            if (org.1.note.isEmpty == false) {
                println(org.0);
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
        
        return true;
    }

    func applicationWillResignActive(application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(application: UIApplication) {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
        // Saves changes in the application's managed object context before the application terminates.
        self.saveContext()
    }

    // MARK: - Core Data stack

    lazy var applicationDocumentsDirectory: NSURL = {
        // The directory the application uses to store the Core Data store file. This code uses a directory named "com.AlexRobertsKatePanter.careerfair" in the application's documents Application Support directory.
        let urls = NSFileManager.defaultManager().URLsForDirectory(.DocumentDirectory, inDomains: .UserDomainMask)
        return urls[urls.count-1] as! NSURL
    }()

    lazy var managedObjectModel: NSManagedObjectModel = {
        // The managed object model for the application. This property is not optional. It is a fatal error for the application not to be able to find and load its model.
        let modelURL = NSBundle.mainBundle().URLForResource("careerfair", withExtension: "momd")!
        return NSManagedObjectModel(contentsOfURL: modelURL)!
    }()

    lazy var persistentStoreCoordinator: NSPersistentStoreCoordinator? = {
        // The persistent store coordinator for the application. This implementation creates and return a coordinator, having added the store for the application to it. This property is optional since there are legitimate error conditions that could cause the creation of the store to fail.
        // Create the coordinator and store
        var coordinator: NSPersistentStoreCoordinator? = NSPersistentStoreCoordinator(managedObjectModel: self.managedObjectModel)
        let url = self.applicationDocumentsDirectory.URLByAppendingPathComponent("careerfair.sqlite")
        var error: NSError? = nil
        var failureReason = "There was an error creating or loading the application's saved data."
        if coordinator!.addPersistentStoreWithType(NSSQLiteStoreType, configuration: nil, URL: url, options: nil, error: &error) == nil {
            coordinator = nil
            // Report any error we got.
            var dict = [String: AnyObject]()
            dict[NSLocalizedDescriptionKey] = "Failed to initialize the application's saved data"
            dict[NSLocalizedFailureReasonErrorKey] = failureReason
            dict[NSUnderlyingErrorKey] = error
            error = NSError(domain: "YOUR_ERROR_DOMAIN", code: 9999, userInfo: dict)
            // Replace this with code to handle the error appropriately.
            // abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
            NSLog("Unresolved error \(error), \(error!.userInfo)")
            abort()
        }
        
        return coordinator
    }()

    lazy var managedObjectContext: NSManagedObjectContext? = {
        // Returns the managed object context for the application (which is already bound to the persistent store coordinator for the application.) This property is optional since there are legitimate error conditions that could cause the creation of the context to fail.
        let coordinator = self.persistentStoreCoordinator
        if coordinator == nil {
            return nil
        }
        var managedObjectContext = NSManagedObjectContext()
        managedObjectContext.persistentStoreCoordinator = coordinator
        return managedObjectContext
    }()

    // MARK: - Core Data Saving support

    func saveContext () {
        if let moc = self.managedObjectContext {
            var error: NSError? = nil
            if moc.hasChanges && !moc.save(&error) {
                // Replace this implementation with code to handle the error appropriately.
                // abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                NSLog("Unresolved error \(error), \(error!.userInfo)")
                abort()
            }
        }
    }

}

