//
//  EventsTVC.swift
//  careerfair
//
//  Created by Roberts, Alexander on 9/16/15.
//  Copyright (c) 2015 AlexRobertsKatePanter. All rights reserved.
//

import UIKit

class EventsTVC: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Career Fair Events";

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
        return events.count
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("reuseIdentifier", forIndexPath: indexPath) as! EventsTableViewCell

        let row = indexPath.row
        let event = events[row]
        
        cell.eventTitleLabel.text = event.title
        cell.eventDateLabel.text = event.date + ", " + event.location + ", " + event.time
        
        return cell
    }
 

    
    
    // MARK: - Navigation

    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        self.performSegueWithIdentifier("eventsTVCtoEventDesc", sender: indexPath);
    }
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
        
        if (segue.identifier == "eventsTVCtoEventDesc") {
            let ip = (sender as! NSIndexPath);
            let row = ip.row;
            
            let destinationVC = segue.destinationViewController as! EventsDescriptionVC;
            destinationVC.event = events[row]
        }
    }

}
