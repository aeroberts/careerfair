//
//  OrganizationDescriptionVC.swift
//  careerfair
//
//  Created by Kathryn Panter on 8/24/15.
//  Copyright (c) 2015 AlexRobertsKatePanter. All rights reserved.
//

import UIKit

class OrganizationDescriptionVC: UIViewController {
    var org = organization();
    var orgId = -1;
    
    @IBOutlet weak var viewOnMap: UIButton!
    @IBOutlet weak var favoriteFromDescCB: UIButton!
    @IBOutlet weak var dateLocationLabel: UILabel!
    
    @IBAction func touchFavorite(sender: AnyObject) {
        favoriteFromDescCB.selected = !favoriteFromDescCB.selected;
        let orgId = self.orgId;
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
    
    @IBAction func touchViewOnMap(sender: AnyObject) {
        self.performSegueWithIdentifier("orgDescToMap", sender: "temp");
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = org.title;

        dateLocationLabel.text = org.date + ", " + org.location;
        
        favoriteFromDescCB.setImage(UIImage(named: "heartunfaved"), forState: UIControlState.Normal);
        favoriteFromDescCB.setImage(UIImage(named: "heartfaved"), forState: UIControlState.Selected);
        favoriteFromDescCB.selected = org.favorited;
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // Given an organization's location, return the enum for the Map Location
    func parseLocation(location:String) -> mapLocations {
        switch(location) {
            case "BBB":
                return mapLocations.BBB;
            case "eecs":
                return mapLocations.eecs;
            case "dow":
                return mapLocations.dow;
            case "dude":
                return mapLocations.dude;
            case "dudeConnector":
                return mapLocations.dudeConnector;
            case "fxb":
                return mapLocations.fxb;
            case "GG Brown":
                return mapLocations.ggBrown;
            default:
                return mapLocations.dude;
        }
    }
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        if (segue.identifier == "orgDescToMap") {
            let destinationVC = segue.destinationViewController as! MapImageVC;
            destinationVC.mapLocation = parseLocation(org.location);
        }
    }
}
