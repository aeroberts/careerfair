//
//  FavoritedNotedTableViewController.swift
//  careerfair
//
//  Created by Alexander Roberts on 7/30/15.
//  Copyright (c) 2015 AlexRobertsKatePanter. All rights reserved.
//

import UIKit

struct orgNameToId {
    var orgName:String;
    var orgId:Int;
    var filtered:Bool;
    
    init(orgName_in:String, orgId_in:Int) {
        orgName = orgName_in;
        orgId = orgId_in;
        filtered = true;
    }
}

var orgNameToIdList = [orgNameToId]();

class FavoritedNotedTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Potentially incomplete method implementation.
        // Return the number of sections.
        return 1;
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete method implementation.
        // Return the number of rows in the section.
        if (currentArray == currentOrgArray.favorited) {
            return favoritedOrgs.count;
        }
        else if (currentArray == currentOrgArray.noted) {
            return notedOrgs.count;
        }
        println("ERROR in FavoritedNotedVC numberOfRowsInSection");
        return 0; // ERROR
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("orgCell", forIndexPath: indexPath) as! OrganizationTableViewCell
        var orgDataIndex = orgNameToIdList[indexPath.row].orgId;
        var org = orgData[orgDataIndex]; // Use org to populate table information
        
        cell.orgTitleLabel.text = org?.title;
        cell.orgDateLabel.text = org?.desc;
        
        if (org?.favorited === true) {
            cell.favoritedButton.setImage(UIImage(named: "heartfaved"), forState: UIControlState.Normal);
            //cell.favoritedButton.setImage(UIImage(contentsOfFile: "heartfaved"), forState: UIControlState.Normal);
        }
        else {
            cell.favoritedButton.setImage(UIImage(named: "heartunfaved"), forState: UIControlState.Normal);
            //cell.favoritedButton.setImage(UIImage(contentsOfFile: "heartunfaved"), forState: UIControlState.Normal);
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
            
            //Remove from list of favorites
            if (!favoritedOrgs.contains(orgId)) {
                println("ERROR, REMOVING ORG FROM FAVORITED THAT DOESN'T EXIST");
            }
            favoritedOrgs.remove(orgId);
            
            //Switch button image to unfaved
            sender.setImage(UIImage(named: "heartunfaved"), forState: UIControlState.Normal);
        }
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return NO if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return NO if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */

}
