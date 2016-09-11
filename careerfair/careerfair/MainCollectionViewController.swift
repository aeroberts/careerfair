//
//  MainCollectionViewController.swift
//  careerfair
//
//  Created by Alexander Roberts on 7/21/15.
//  Copyright (c) 2015 AlexRobertsKatePanter. All rights reserved.
//

import UIKit

let reuseIdentifier = "Cell"
var currentArray:currentOrgArray = currentOrgArray.none;

class MainCollectionViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    private let navigationTileReuse = "navigationTile";
    private let sectionInsets = UIEdgeInsets(top: 50.0, left: 20.0, bottom: 50.0, right: 20.0)
    
    override func viewDidLoad() {
        super.viewDidLoad()

        collectionView?.backgroundColor = UIColor.whiteColor();

        // Register cell classes
        self.collectionView!.registerClass(UICollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
        if (segue.identifier == "navigationTileToFavorited") {
            currentArray = currentOrgArray.favorited;
            orgNameToIdList.removeAll();
            
            for orgId in favoritedOrgs {
                orgNameToIdList.append(orgNameToId(orgName_in: orgData[orgId]!.title, orgId_in: orgId));
            }
            orgNameToIdList.sortInPlace({ $0.orgName < $1.orgName });
        }
        else if (segue.identifier == "navigationTileToNoted") {
            currentArray = currentOrgArray.noted;
            orgNameToIdList.removeAll();
            
            for orgId in notedOrgs {
                orgNameToIdList.append(orgNameToId(orgName_in: orgData[orgId]!.title, orgId_in: orgId));
            }
            orgNameToIdList.sortInPlace({ $0.orgName < $1.orgName });
        }
        else if (segue.identifier == "navigationTileToOrgs") {
            currentArray = currentOrgArray.all;
            orgNameToIdList.removeAll();
            
            for (orgId, org) in orgData {
                orgNameToIdList.append(orgNameToId(orgName_in: org.title, orgId_in: orgId));
            }
            orgNameToIdList.sortInPlace({ $0.orgName < $1.orgName });
        }
        else if (segue.identifier == "navigationTileToToDo") {
            toDoItems.removeAll(keepCapacity: true);
            for orgId in favoritedOrgs {
                toDoItems.append(ToDoItem(fromOrg: orgData[orgId]!));
            }
            
            for eventId in toDoEvents {
                toDoItems.append(ToDoItem(fromEvent: events[eventIdsToPosition[eventId]!]));
            }
            
            // Sort
            toDoItems.sortInPlace({ $0.startDate.timeIntervalSinceReferenceDate < $1.startDate.timeIntervalSinceReferenceDate })

            // Determine number of different dates
            var displayDates = [String]();
            var numItemsForDate = [Int]();
            var sectionTotals = [Int]();
            
            sectionTotals.append(0);
            
            let dateFormatter = NSDateFormatter();
            dateFormatter.dateFormat = "EEEE, MMM dd";
            
            
            var currentDay = -1;
            var numDays = 0;
            let calendar = NSCalendar.currentCalendar()
            
            // Every time we see a new date we append a 1 to the end of numItemsForDate
            // Every time we see a repeat date we increment the end of numItemsForDate
            
            
            for elt in toDoItems {
                let components = calendar.components([.Day], fromDate: elt.startDate);
                if (components.day != currentDay) {
                    displayDates.append(dateFormatter.stringFromDate(elt.startDate));
                    numDays += 1;
                    currentDay = components.day;
                    numItemsForDate.append(1);
                    sectionTotals.append(numDays);
                }
                else {
                    numItemsForDate[numItemsForDate.count-1] += 1;
                }
            }

            // pass numDays to ToDoTVC
            let navController = segue.destinationViewController as! templateNavController;
            let destinationVC = navController.viewControllers.first as! ToDoTVC;
            destinationVC.numDays = numDays;
            destinationVC.numItemsOnDate = numItemsForDate;
            destinationVC.displayDates = displayDates;
            destinationVC.toDoItems = toDoItems;
            destinationVC.sectionTotals = sectionTotals;
        }
    }

    // MARK: UICollectionViewDataSource

    override func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        //#warning Incomplete method implementation -- Return the number of sections
        return 1;
    }


    override func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        //#warning Incomplete method implementation -- Return the number of items in the section
        return 9;
    }

    override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier(navigationTileReuse, forIndexPath: indexPath) as! MainCollectionViewCell
        
        // Configure the cell
        cell.imageView.image = UIImage(named: "Test2");
        
        switch (indexPath.row) {
            case 0: // Organizations
                cell.imageView.image = UIImage(named: "icon-organizations.png");
                cell.tileLabel.text = "Organizations"
                break;
            case 1: // Map
                cell.imageView.image = UIImage(named: "icon-map.png");
                cell.tileLabel.text = "Map"
                break;
            case 2: // Favorited
                cell.imageView.image = UIImage(named: "icon-favorite.png");
                cell.tileLabel.text = "Favorited"
                break;
            case 3: // Notes
                cell.imageView.image = UIImage(named: "icon-notes.png");
                cell.tileLabel.text = "Noted"
                break;
            case 4: // ToDo list
                cell.imageView.image = UIImage(named: "icon-todo.png");
                cell.tileLabel.text = "To-do List"
                break;
            case 5: // Events
                cell.imageView.image = UIImage(named: "icon-events.png");
                cell.tileLabel.text = "Events"
                break;
            case 6: // Announcements
                cell.imageView.image = UIImage(named: "icon-announcements.png");
                cell.tileLabel.text = "Announcements"
                break;
            case 7: // Tips
                cell.imageView.image = UIImage(named: "icon-tips.png");
                cell.tileLabel.text = "Career Fair Tips"
                break;
            case 8: // General Info
                cell.imageView.image = UIImage(named: "icon-info.png");
                cell.tileLabel.text = "General Info"
                break;
            default:
                print("Too many cells created")
        }
        return cell
    }
    
    override func collectionView(collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, atIndexPath indexPath: NSIndexPath) -> UICollectionReusableView {
            let headerView = collectionView.dequeueReusableSupplementaryViewOfKind(kind, withReuseIdentifier: "mainCollectionViewHeader", forIndexPath: indexPath) as! MainCollectionViewHeader;
            headerView.backgroundColor = UIColor(red: 00, green: 39/255, blue: 76/255, alpha: 1.0);

            headerView.titleLabel.textColor = UIColor.whiteColor();
            headerView.titleLabel.text = "SWE / TBP Career Fair 2016";
        
        return headerView;
    }

    // MARK: UICollectionViewDelegate

    /*
    // Uncomment this method to specify if the specified item should be highlighted during tracking
    override func collectionView(collectionView: UICollectionView, shouldHighlightItemAtIndexPath indexPath: NSIndexPath) -> Bool {
        return true
    }
    */
    @IBAction func unwindToMainVC(segue:UIStoryboardSegue) {
        isFiltered = false;
        self.collectionView?.collectionViewLayout.invalidateLayout();
    }
    
    // Uncomment this method to specify if the specified item should be selected
    override func collectionView(collectionView: UICollectionView, shouldSelectItemAtIndexPath indexPath: NSIndexPath) -> Bool {
        switch indexPath.row {
        case 0: // Organizations
            // Segue to organizationTableView
            performSegueWithIdentifier("navigationTileToOrgs", sender: self);
            break;
        case 1: // Map
            performSegueWithIdentifier("navigationTileToMapTable", sender: self);
            break;
        case 2: // Favorited
            performSegueWithIdentifier("navigationTileToFavorited", sender: self);
            break;
        case 3: // Notes
            performSegueWithIdentifier("navigationTileToNoted", sender: self);
            break;
        case 4: // Todo list
            performSegueWithIdentifier("navigationTileToToDo", sender: self);
            break;
        case 5: // Events
            performSegueWithIdentifier("navigationTileToEvents", sender: self);
            break;
        case 6: // Announcements
            performSegueWithIdentifier("navigationTileToAnnouncements", sender: self);
            break;
        case 7: // Career Fair Tips
            // Segue to
            performSegueWithIdentifier("navigationTileToTips", sender: self);
            break;
        case 8: // General Info / FAQ
            // Segue to
            performSegueWithIdentifier("navigationTileToFAQ", sender: self);
            break;
        default:
            // ERROR
            print("ERROR");
            break;
        }
        return true;
    }
    

    /*
    // Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
    override func collectionView(collectionView: UICollectionView, shouldShowMenuForItemAtIndexPath indexPath: NSIndexPath) -> Bool {
        return false
    }

    override func collectionView(collectionView: UICollectionView, canPerformAction action: Selector, forItemAtIndexPath indexPath: NSIndexPath, withSender sender: AnyObject?) -> Bool {
        return false
    }

    override func collectionView(collectionView: UICollectionView, performAction action: Selector, forItemAtIndexPath indexPath: NSIndexPath, withSender sender: AnyObject?) {
    
    }
    */
    
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout:UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        if (UIScreen.mainScreen().bounds.width >= 375.0) {
            return CGSize(width: 100, height: 110)
        }
        else {
            return CGSize(width: 86, height: 96)
        }
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAtIndex section: Int) -> UIEdgeInsets {
        if (UIInterfaceOrientationIsLandscape(UIApplication.sharedApplication().statusBarOrientation)) {
            return UIEdgeInsetsMake(30, 20, 30, 20);
        }
        if (UIScreen.mainScreen().bounds.width >= 375.0) {
            return UIEdgeInsetsMake(48, 20, 30, 20);
        }
        else {
            return UIEdgeInsetsMake(32, 20, 30, 20);
        }
        
    }

    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAtIndex section: Int) -> CGFloat {
        if (UIInterfaceOrientationIsLandscape(UIApplication.sharedApplication().statusBarOrientation)) {
            return 40;
        }
        else {
            if (UIScreen.mainScreen().bounds.width >= 375.0) {
                return 70;
            }
            else {
                return 30;
            }
        }
    }
    
}
