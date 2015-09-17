//
//  OrganizationsTableViewController.swift
//  careerfair
//
//  Created by Alexander Roberts on 7/30/15.
//  Copyright (c) 2015 AlexRobertsKatePanter. All rights reserved.
//

import UIKit
import CoreData

var isFiltered = false;

class OrganizationsTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        switch (currentArray) {
        case .favorited:
            self.title = "Favorited Organizations";
            break;
        case .noted:
            self.title = "Noted Organizations";
            break;
        case .all:
            self.title = "Organizations";
            break;
        default:
            self.title = "Organizations";
        }
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    override func viewWillAppear(animated: Bool) {
        self.tableView.reloadData();
        if (isFiltered) {
            self.navigationController?.setToolbarHidden(false, animated: true);
        }
        else {
            self.navigationController?.setToolbarHidden(true, animated: true);
            
        }
    }
    
    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Potentially incomplete method implementation.
        // Return the number of sections.
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete method implementation.
        // Return the number of rows in the section.
        if (!isFiltered) {
            return orgNameToIdList.count;
        }
        else {
            return filteredOrgNameToIdList.count;
        }
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("orgCell", forIndexPath: indexPath) as! OrganizationTableViewCell
    
        var orgDataIndex = -1;
        if (!isFiltered) {
            orgDataIndex = orgNameToIdList[indexPath.row].orgId;
        }
        else {
            orgDataIndex = filteredOrgNameToIdList[indexPath.row].orgId;
        }
        
        if (orgDataIndex == -1) {
            println("ERRRRRRRORRRRRRR");
            orgDataIndex = 0;
        }
        var org = orgData[orgDataIndex]; // Use org to populate table information

        cell.orgTitleLabel.text = org?.title;
        var temp = org?.date;
        var temp2 = org?.location;
        cell.orgDateLabel.text = temp! + ", " + temp2!;
        
        if (org?.favorited === true) {
            cell.favoritedButton.setImage(UIImage(named: "heartfaved"), forState: UIControlState.Normal);
        }
        else {
            cell.favoritedButton.setImage(UIImage(named: "heartunfaved"), forState: UIControlState.Normal);
        }
        
        cell.favoritedButton.tag = orgDataIndex;
        cell.favoritedButton.addTarget(self, action: "touchFavorite:", forControlEvents: .TouchUpInside);
        
        return cell;
    }
    
    
    
    @IBAction func touchFavorite(sender: UIButton) {
        let orgId = sender.tag;
        if (orgData[orgId] == nil) {
            println("ERROR");
            return;
        }
        
        let favoritedStatus = orgData[orgId]!.favorited;
        orgData[orgId]!.favorited = !favoritedStatus;
        if (favoritedStatus == false) {
            //Write to core data
            var appDel:AppDelegate = UIApplication.sharedApplication().delegate as! AppDelegate;
            var context:NSManagedObjectContext = appDel.managedObjectContext!;
            
            var newFavorite = NSEntityDescription.insertNewObjectForEntityForName("FavoritedOrganizations", inManagedObjectContext: context) as! NSManagedObject;
            newFavorite.setValue(orgId, forKey: "orgId");
            context.save(nil);
            
            //Add to list of favorites
            if (favoritedOrgs.contains(orgId)) {
                println("ERROR, INSERTING ORG ID INTO FAVORITED THAT ALREADY EXISTS");
            }
            favoritedOrgs.insert(orgId);
            //Switch button image to faved
            
            sender.setImage(UIImage(named: "heartfaved"), forState: UIControlState.Normal);
        }
        else {
            //Remove from core data
            var appDel:AppDelegate = UIApplication.sharedApplication().delegate as! AppDelegate;
            var context:NSManagedObjectContext = appDel.managedObjectContext!;
            var error : NSError?

            var pred = NSPredicate(format: "orgId == " + toString(orgId));
            let fetchRequest = NSFetchRequest(entityName: "FavoritedOrganizations");
            fetchRequest.predicate = pred;
            
            let results = context.executeFetchRequest(fetchRequest, error: &error) as? [FavoritedOrganizations];
            if ((error) != nil) { handleError("OrgTVC touchFavorite Remove From Core Data", &error); }
            context.deleteObject(results!.first!);
            context.save(nil);
            
            //Remove from list of favorites
            if (!favoritedOrgs.contains(orgId)) {
                println("ERROR, REMOVING ORG FROM FAVORITED THAT DOESN'T EXIST");
            }
            favoritedOrgs.remove(orgId);
            
            //Switch button image to unfaved
            sender.setImage(UIImage(named: "heartunfaved"), forState: UIControlState.Normal);
            
            // If the table is favorited table, remove cell
/*            let view = sender.superview!;
            let cell = view.superview as! OrganizationTableViewCell;
            let indexpath = self.tableView.indexPathForCell(cell);
            println("\n\n\n");
            println("indexpath: ");
            println(indexpath!);
            println("\n\n\n");
            
            self.tableView.deleteRowsAtIndexPaths([indexpath!], withRowAnimation: UITableViewRowAnimation.Automatic);
*/
        }
    }
    

    @IBAction func clearFilter(sender: AnyObject) {
        isFiltered = false;
        self.tableView.reloadData();
        if (isFiltered) {
            self.navigationController?.setToolbarHidden(false, animated: true);
        }
        else {
            self.navigationController?.setToolbarHidden(true, animated: true);
            
        }
    }

    // MARK: - Navigation
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        self.performSegueWithIdentifier("orgCellToDesc", sender: indexPath);
    }
    
    

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
        if (segue.identifier == "orgToFilter") {
            self.navigationController?.setToolbarHidden(true, animated: true);
        }
        else if (segue.identifier == "orgCellToDesc") {
            let ip = (sender as! NSIndexPath);
            let row = ip.row;
            var orgDataIndex = -1;
            if (!isFiltered) {
                orgDataIndex = orgNameToIdList[row].orgId;
            }
            else {
                orgDataIndex = filteredOrgNameToIdList[row].orgId;
            }
            
            if (orgDataIndex == -1) {
                println("ERRRRRRRORRRRRRR");
                orgDataIndex = 0;
            }
            var org = orgData[orgDataIndex]; // Use org to populate table information
            
            let destinationVC = segue.destinationViewController as! OrganizationDescriptionVC;
            destinationVC.org = org!;
            
            let currentCell = tableView.cellForRowAtIndexPath(ip) as! OrganizationTableViewCell;
            destinationVC.orgId = currentCell.favoritedButton.tag;
        }
    }
    

}
