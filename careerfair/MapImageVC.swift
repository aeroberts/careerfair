//
//  MapImageVC.swift
//  careerfair
//
//  Created by Roberts, Alexander on 9/15/15.
//  Copyright (c) 2015 AlexRobertsKatePanter. All rights reserved.
//

import UIKit

enum mapLocations {
    case dudeConnector
    case dude
    case dow
    case eecs
    case fxb
    case ggBrown
    case pierpont
    case BBB
    case none
}

class MapImageVC: UIViewController {
    var mapLocation:mapLocations = mapLocations.none;
    
    @IBOutlet weak var mapImage: UIImageView!

    func getMapImage(mapLocation: mapLocations) -> String {
        switch (mapLocation) {
            case mapLocations.dude:
                return "dude.png";
            case mapLocations.dow:
                return "dow.png";
            case mapLocations.eecs:
                return "eecs.png";
            case mapLocations.fxb:
                return "fxb.png";
            case mapLocations.ggBrown:
                return "ggbrown.png";
            case mapLocations.pierpont:
                return "pierpont.png";
            case mapLocations.BBB:
                return "cat.png";
            case mapLocations.dudeConnector:
                return "dude_connector.png";
            default:
                return "cat.png";
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mapImage.image = UIImage(named: getMapImage(mapLocation));
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
