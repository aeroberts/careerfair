//
//  MapTVC.swift
//  careerfair
//
//  Created by Kathryn Panter on 9/15/15.
//  Copyright (c) 2015 AlexRobertsKatePanter. All rights reserved.
//

import UIKit

class MapTVC: UITableViewController {
    
    private let NUM_MAPS = 9;
    private let MAP_NAMES = [
        "Chrysler Lobby",
        "Dow",
        "Duderstadt",
        "Duderstadt Connector",
        "EECS",
        "BBB",
        "GG Brown",
        "FXB",
        "Pierpont"
    ];

    @IBOutlet weak var backButton: UIBarButtonItem!
    
    
    @IBAction func touchBackButton(sender: AnyObject) {
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Career Fair Maps";
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
        return NUM_MAPS;
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("mapCell", forIndexPath: indexPath) 

        // Configure the cell...
        cell.textLabel?.text = MAP_NAMES[indexPath.row];
        return cell
    }

    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 74;
    }
    
    // MARK: - Navigation
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        self.performSegueWithIdentifier("mapTVCtoMapImageVC", sender: indexPath);
    }

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
        if (segue.identifier == "mapTVCtoMapImageVC") {
            let ip = (sender as! NSIndexPath);
            let row = ip.row;
            let mapName = MAP_NAMES[row];
            
            let destinationVC = segue.destinationViewController as! MapImageVC;
            destinationVC.mapLocation = parseLocation(mapName);
        }

    }
    

}
