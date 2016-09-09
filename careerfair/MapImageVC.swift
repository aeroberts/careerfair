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
    case chryslerBasement
    case none
}



class MapImageVC: UIViewController, UIScrollViewDelegate {
    var mapLocation:mapLocations = mapLocations.none;
    var mapMarkers = [mapMarker]()
    var displayMapMarkers = [mapMarker]()
    
    var dayOne: Bool = true
    var dayBtn: UIButton = UIButton()
    
    var drawnItems = [UIImage]()
    
    var selectedOrgId = -1
    
    @IBOutlet weak var mapScrollView: UIScrollView!
    @IBOutlet weak var mapImageView: UIImageView!
    
    
    @IBOutlet weak var imageBottomConstraint: NSLayoutConstraint!
    @IBOutlet weak var imageLeadingConstraint: NSLayoutConstraint!
    @IBOutlet weak var imageTopConstraint: NSLayoutConstraint!
    @IBOutlet weak var imageTrailingConstraint: NSLayoutConstraint!
    
    func getMapImage(mapLocation: mapLocations) -> String {
        switch (mapLocation) {
            case mapLocations.dude:
                mapMarkers = mapMarkersDude
                return "dude.png";
            case mapLocations.dow:
                mapMarkers = mapMarkersDow
                return "dow.png";
            case mapLocations.eecs:
                mapMarkers = mapMarkersEecs
                return "eecs.png";
            case mapLocations.fxb:
                mapMarkers = mapMarkersFxb
                return "fxb.png";
            case mapLocations.ggBrown:
                mapMarkers = mapMarkersGGbrown
                return "ggbrown.png";
            case mapLocations.pierpont:
                mapMarkers = mapMarkersPierpont
                return "pierpont.png";
            case mapLocations.BBB:
                mapMarkers = mapMarkersBbb
                return "bbb.png";
            case mapLocations.dudeConnector:
                mapMarkers = mapMarkersDudeConnector
                return "dude_connector.png";
            case mapLocations.chryslerBasement:
                mapMarkers = mapMarkersChryslerBasement
                return "chrysler_basement.png"
            default:
                return "cat.png";
        }
    }
    
    func createMapOverlay() {
        let mapImage = UIImage(named: getMapImage(mapLocation))!;
        
        for orgId in favoritedOrgs {
            if (orgId == selectedOrgId) {
                continue;
            }
            let currentOrg = orgData[orgId]
            
            if (currentOrg!.date == cfDayOne && !dayOne) {
                continue;
            }
            if (currentOrg!.date == cfDayTwo && dayOne) {
                continue;
            }
            if (parseLocation(currentOrg!.location) == mapLocation && orgId != selectedOrgId) {
                displayMapMarkers.append(mapMarkers[currentOrg!.booth])
            }
        }
        
        let height = mapImage.size.height
        let width = mapImage.size.width
        
        let screenHeight = view.bounds.height-60
        let screenWidth = view.bounds.width
        
        let scalingFactor = max(height/screenHeight, width/screenWidth)
        
        let imageHeight = height/scalingFactor
        let imageWidth = width/scalingFactor
        
        let mapSize = CGSizeMake(imageWidth, imageHeight)
        UIGraphicsBeginImageContextWithOptions(mapSize, false, 0.0)
        
        mapImage.drawInRect(CGRect(origin: CGPointZero, size: mapSize))
        
        for marker in displayMapMarkers /*mapMarkers*/ {
            var origin: CGPoint = marker.position;
            origin.x *= imageHeight;
            origin.y *= imageWidth;
            drawnItems.append(UIImage(named: "heartfaved")!)
            drawnItems.last!.drawInRect(CGRect(origin:origin, size:CGSizeMake(CGFloat(marker.size), CGFloat(marker.size))))
        }
        
        if (selectedOrgId != -1) {
            let selectedOrg = orgData[selectedOrgId]
            if ((selectedOrg!.date == cfDayOne && dayOne) ||
                (selectedOrg!.date == cfDayTwo && !dayOne)) {
           
                let selectedOrgBooth = selectedOrg!.booth
                if (selectedOrgBooth > -1 && selectedOrgBooth < mapMarkers.count) {
                    let selectedMarker = mapMarkers[selectedOrgBooth]
                    var origin: CGPoint = selectedMarker.position;
                    origin.x *= imageHeight;
                    origin.x -= 5;
                    origin.y *= imageWidth;
                    origin.y -= 5;
                    drawnItems.append(UIImage(named: "icon-star")!);
                    drawnItems.last!.drawInRect(CGRect(origin:origin, size:CGSizeMake(22, 22)))
                }
            }
        }
        
        let newImage:UIImage = UIGraphicsGetImageFromCurrentImageContext()
        mapImageView.image = newImage
        
        mapScrollView.bounds.size.height = view.bounds.size.height-60
        mapScrollView.bounds.size.width = view.bounds.size.width
        mapImageView.bounds.size = mapSize
        
        UIGraphicsEndImageContext()
    }
    
    func viewForZoomingInScrollView(scrollView: UIScrollView) -> UIView? {
        return self.mapImageView
    }
    
    func updateConstraintsForSize(size: CGSize) {
        let yOffset = max(0, (size.height-mapImageView.frame.height) / 2)
        imageTopConstraint.constant = yOffset
        imageBottomConstraint.constant = yOffset
        
        let xOffset = max(0, (size.width-mapImageView.frame.width) / 2)
        imageLeadingConstraint.constant = xOffset
        imageTrailingConstraint.constant = xOffset
    }
    
    func scrollViewDidZoom(scrollView: UIScrollView) {
        updateConstraintsForSize(view.bounds.size)
    }
    
    @IBAction func touchDay(sender: AnyObject) {
        if (dayOne) {
            dayBtn.setTitle("Day Two", forState: .Normal)
        }
        else {
            dayBtn.setTitle("Day One", forState: .Normal)
        }
        dayOne = !dayOne
        
        drawnItems.removeAll(keepCapacity: false)
        displayMapMarkers.removeAll(keepCapacity: false)
        mapImageView.image = nil
        mapImageView.setNeedsDisplay()
        self.mapScrollView.setZoomScale(1.0, animated: false)
        createMapOverlay()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dayBtn.setTitle("Day One", forState: .Normal)
        dayBtn.setTitleColor(UIColor(red: 255/255, green: 203/255, blue: 5/255, alpha: 1.0), forState: .Normal);
        dayBtn.frame = CGRectMake(0, 0, 70, 30)
        dayBtn.addTarget(self, action: #selector(touchDay), forControlEvents: .TouchDown)
        
        //.... Set Right/Left Bar Button item
        let rightBarButton = UIBarButtonItem()
        rightBarButton.customView = dayBtn
        self.navigationItem.rightBarButtonItem = rightBarButton
        
        
        
        self.mapScrollView.minimumZoomScale = 1.0
        self.mapScrollView.maximumZoomScale = 2.0
        self.mapScrollView.setZoomScale(1.0, animated: false)
        self.mapScrollView.delegate = self
        
        createMapOverlay()
        updateConstraintsForSize(view.bounds.size)

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func didRotateFromInterfaceOrientation(fromInterfaceOrientation: UIInterfaceOrientation) {
        updateConstraintsForSize(mapScrollView.bounds.size)
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
