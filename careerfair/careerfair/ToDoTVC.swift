//
//  ToDoTVC.swift
//  careerfair
//
//  Created by Alex Roberts on 8/18/16.
//  Copyright © 2016 AlexRobertsKatePanter. All rights reserved.
//

import UIKit

class ToDoTVC: UITableViewController {
    var numDays = -1;
    var numItemsOnDate = [Int]();
    var displayDates = [String]();
    var toDoItems = [ToDoItem]();
    var sectionTotals = [Int]();

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
        // #warning Incomplete implementation, return the number of sections
        return numDays != -1 ? numDays : 1;
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return numItemsOnDate[section];
    }
    
    override func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return displayDates[section];
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("toDoCell", forIndexPath: indexPath) as! ToDoCell;
        let displayTDI = toDoItems[sectionTotals[indexPath.section]+indexPath.row];
        cell.title.text = displayTDI.title;
        
        var startHours = displayTDI.startHours;
        var startAMPM =  "am";
        if (startHours > 12) {
            startHours -= 12;
            startAMPM = "pm";
        }
        let displayStartHours = String(startHours);
        
        var endHours = displayTDI.endHours;
        var endAMPM =  "am";
        if (endHours > 12) {
            endHours -= 12;
            endAMPM = "pm";
        }
        let displayEndHours = String(endHours);
        
        let startMinutes = String(format: "%02d", displayTDI.startMinutes);
        let endMinutes = String(format: "%02d", displayTDI.endMinutes);
        
        
        cell.time.text = displayStartHours + ":" + startMinutes + startAMPM + " - " + displayEndHours + ":" + endMinutes + endAMPM;
        
        cell.id = displayTDI.id;
        cell.isOrg = displayTDI.isOrg;
        

        return cell
    }
    
    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 120;
    }
 

    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
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
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    // MARK: - Navigation
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let cell = tableView.cellForRowAtIndexPath(indexPath) as? ToDoCell;
        if (cell!.isOrg) {
            self.performSegueWithIdentifier("toDoToOrgDesc", sender: cell!.id);
        }
        else {
            self.performSegueWithIdentifier("toDoToEventDesc", sender: cell!.id);
        }
    }
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if (segue.identifier == "toDoToOrgDesc") {
            let org = orgData[sender as! Int]; // Use org to populate table information
            let destinationVC = segue.destinationViewController as! OrganizationDescriptionVC;
            destinationVC.org = org!;
        }
        else if (segue.identifier == "toDoToEventDesc") {
            let destinationVC = segue.destinationViewController as! EventsDescriptionVC;
            destinationVC.event = events[eventIdsToPosition[sender as! Int]!];
        }
    }
    
    @IBAction func unwindToToDoTVC(segue:UIStoryboardSegue) { }


}
