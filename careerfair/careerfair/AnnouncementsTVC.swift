//
//  AnnouncementsTVC.swift
//  careerfair
//
//  Created by Alexander Roberts on 6/10/16.
//  Copyright © 2016 AlexRobertsKatePanter. All rights reserved.
//

import UIKit

class AnnouncementsTVC: UITableViewController {
    
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
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return announcements.count
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("announcementCell", forIndexPath: indexPath) as! AnnouncmentsTableViewCell

        // Configure the cell...
        cell.titleLabel.text = announcements[indexPath.row].title
        return cell
    }
    
    @IBAction func unwindToAnnouncementsTVC(segue:UIStoryboardSegue) { }

    // MARK: - Navigation
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        self.performSegueWithIdentifier("announceTCtoAnnounceDesc", sender: indexPath);
    }

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        
        if (segue.identifier == "announceTCtoAnnounceDesc") {
            let ip = (sender as! NSIndexPath);
            let row = ip.row;
            
            let destinationVC = segue.destinationViewController as! AnnouncementsDescriptionVC
            destinationVC.announcement = announcements[row]
        }
    }


}
