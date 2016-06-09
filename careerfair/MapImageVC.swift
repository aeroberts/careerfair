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

class mapMarker {
    var position: CGPoint
    var image: UIImage
    
    init(position_in: CGPoint, image_in: UIImage) {
        position = position_in
        image = image_in
    }
}

class MapImageVC: UIViewController, UIScrollViewDelegate {
    var mapLocation:mapLocations = mapLocations.none;
    var mapMarkers = [mapMarker]()
    
    @IBOutlet weak var mapScrollView: UIScrollView!
    @IBOutlet weak var mapImageView: UIImageView!
    
    
    @IBOutlet weak var imageBottomConstraint: NSLayoutConstraint!
    @IBOutlet weak var imageLeadingConstraint: NSLayoutConstraint!
    @IBOutlet weak var imageTopConstraint: NSLayoutConstraint!
    @IBOutlet weak var imageTrailingConstraint: NSLayoutConstraint!
    
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
                return "bbb.png";
            case mapLocations.dudeConnector:
                return "dude_connector.png";
            default:
                return "cat.png";
        }
    }
    
    func createMapOverlay(mapImage:UIImage) {
        let height = mapImage.size.height
        let width = mapImage.size.width
        
        let screenHeight = UIScreen.mainScreen().bounds.height
        let screenWidth = UIScreen.mainScreen().bounds.width
        
        let scalingFactor = max(height/screenHeight, width/screenWidth)
        
        let imageHeight = height/scalingFactor
        let imageWidth = width/scalingFactor
        
        let mapSize = CGSizeMake(imageWidth, imageHeight)
        let checkSize = CGSizeMake(10, 10)
        UIGraphicsBeginImageContextWithOptions(mapSize, false, 0.0)
        
        mapImage.drawInRect(CGRect(origin: CGPointZero, size: mapSize))
        for marker in mapMarkers {
            marker.image.drawInRect(CGRect(origin: marker.position, size: checkSize))
        }
        
        let newImage:UIImage = UIGraphicsGetImageFromCurrentImageContext()
        mapImageView.image = newImage
        
        mapScrollView.bounds.size = view.bounds.size
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
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let mapImage = UIImage(named: getMapImage(mapLocation))!;
        
        self.mapScrollView.minimumZoomScale = 1.0
        self.mapScrollView.maximumZoomScale = 2.0
        self.mapScrollView.setZoomScale(1.0, animated: false)
        self.mapScrollView.delegate = self
        
        createMapOverlay(mapImage)
        updateConstraintsForSize(view.bounds.size)

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
