//
//  MainCollectionViewController.swift
//  careerfair
//
//  Created by Alexander Roberts on 7/21/15.
//  Copyright (c) 2015 AlexRobertsKatePanter. All rights reserved.
//

import UIKit

let reuseIdentifier = "Cell"
var currentArray:currentOrgArray = currentOrgArray.none;

class MainCollectionViewController: UICollectionViewController, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    private let navigationTileReuse = "navigationTile";
    private let sectionInsets = UIEdgeInsets(top: 50.0, left: 20.0, bottom: 50.0, right: 20.0)


    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Register cell classes
        self.collectionView!.registerClass(UICollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)
        println("ahh");
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
        if (segue.identifier == "navigationTileToFavorited") {
            println("To Favorited");
            currentArray = currentOrgArray.favorited;
            orgNameToIdList.removeAll();
            
            for orgId in favoritedOrgs {
                orgNameToIdList.append(orgNameToId(orgName_in: orgData[orgId]!.title, orgId_in: orgId));
            }
            orgNameToIdList.sort({ $0.orgName < $1.orgName });
            println("Bob is a good guy");
            for x in orgNameToIdList {
                println("x: " + toString(x.orgId) + " " + x.orgName);
            }
        }
        else if (segue.identifier == "navigationTileToNoted") {
            currentArray = currentOrgArray.noted;
            orgNameToIdList.removeAll();
            
            for orgId in notedOrgs {
                orgNameToIdList.append(orgNameToId(orgName_in: orgData[orgId]!.title, orgId_in: orgId));
            }
            orgNameToIdList.sort({ $0.orgName < $1.orgName });
        }
        else if (segue.identifier == "navigationTileToOrgs") {
            currentArray = currentOrgArray.all;
            orgNameToIdList.removeAll();
            
            for (orgId, org) in orgData {
                orgNameToIdList.append(orgNameToId(orgName_in: org.title, orgId_in: orgId));
            }
            orgNameToIdList.sort({ $0.orgName < $1.orgName });
        }
    }

    // MARK: UICollectionViewDataSource

    override func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        //#warning Incomplete method implementation -- Return the number of sections
        return 1;
    }


    override func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        //#warning Incomplete method implementation -- Return the number of items in the section
        return 9;
    }

    override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier(navigationTileReuse, forIndexPath: indexPath) as! MainCollectionViewCell
        cell.backgroundColor = UIColor.blackColor();
        
        //println("AWW YEE");
        // Configure the cell
        cell.imageView.image = UIImage(named: "cat.png");
        return cell
    }

    // MARK: UICollectionViewDelegate

    /*
    // Uncomment this method to specify if the specified item should be highlighted during tracking
    override func collectionView(collectionView: UICollectionView, shouldHighlightItemAtIndexPath indexPath: NSIndexPath) -> Bool {
        return true
    }
    */
    @IBAction func unwindToMainVC(segue:UIStoryboardSegue) {
        isFiltered = false;
    }
    
    // Uncomment this method to specify if the specified item should be selected
    override func collectionView(collectionView: UICollectionView, shouldSelectItemAtIndexPath indexPath: NSIndexPath) -> Bool {
        switch indexPath.row {
        case 0: // Organizations
            // Segue to organizationTableView
            println("performingSegueWithIdentifier: navigationTileToOrgs");
            performSegueWithIdentifier("navigationTileToOrgs", sender: self);
            break;
        case 1: // Map
            performSegueWithIdentifier("navigationTileToMapTable", sender: self);
            break;
        case 2: // Favorited
            performSegueWithIdentifier("navigationTileToFavorited", sender: self);
            break;
        case 3: // Notes
            performSegueWithIdentifier("navigationTileToNoted", sender: self);
            break;
        case 4: // Todo list
            // Segue to
            break;
        case 5: // Events
            // Segue to
            break;
        case 6: // Announcements
            // Segue to
            break;
        case 7: // Career Fair Tips / FAQ
            // Segue to
            break;
        case 8: // General Info
            // Segue to
            break;
        default:
            // ERROR
            println("ERROR");
            break;
        }
        return true;
    }
    

    /*
    // Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
    override func collectionView(collectionView: UICollectionView, shouldShowMenuForItemAtIndexPath indexPath: NSIndexPath) -> Bool {
        return false
    }

    override func collectionView(collectionView: UICollectionView, canPerformAction action: Selector, forItemAtIndexPath indexPath: NSIndexPath, withSender sender: AnyObject?) -> Bool {
        return false
    }

    override func collectionView(collectionView: UICollectionView, performAction action: Selector, forItemAtIndexPath indexPath: NSIndexPath, withSender sender: AnyObject?) {
    
    }
    */
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout:UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        return CGSize(width: 100, height: 100)
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAtIndex section: Int) -> UIEdgeInsets {
        return UIEdgeInsetsMake(76, 10, 30, 10);
    }

    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAtIndex section: Int) -> CGFloat {
        return 70;
    }
    
}
