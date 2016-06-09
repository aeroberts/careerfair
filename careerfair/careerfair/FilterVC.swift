//
//  FilterVC.swift
//  careerfair
//
//  Created by Kathryn Panter on 8/19/15.
//  Copyright (c) 2015 AlexRobertsKatePanter. All rights reserved.
//

import UIKit

var filteredOrgNameToIdList = [orgNameToId]();

class FilterVC: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    private var majorsArray = ["All", "Aerospace Engineering", "AOSS", "Biomedical Engineering",
        "Chemical Engineering", "Civil Engineering", "Computer Engineering", "Computer Science", "Data Science", "Electrical Engineering", "Engineering Physics", "Environmental Engineering", "Industrial & Operations Engineering", "Materials Science & Engineering", "Mechanical Engineering", "Naval Architecture and Marine Engineering", "Nuclear Engineering"];
    
    @IBOutlet weak var majorPV: UIPickerView!

    @IBOutlet weak var internshipCB: UIButton!
    @IBOutlet weak var fulltimeCB: UIButton!
    @IBOutlet weak var coopCB: UIButton!
    
    @IBOutlet weak var bachelorsCB: UIButton!
    @IBOutlet weak var mastersCB: UIButton!
    @IBOutlet weak var doctoralCB: UIButton!
    
    @IBOutlet weak var sponsorYesCB: UIButton!
    @IBOutlet weak var sponsorNoCB: UIButton!
    @IBOutlet weak var sponsorOnOccasionCB: UIButton!
    
    //events for position checkboxes
    @IBAction func checkInternship(sender: AnyObject) {
        internshipCB.selected = !internshipCB.selected;
    }
    @IBAction func checkFulltime(sender: AnyObject) {
        fulltimeCB.selected = !fulltimeCB.selected;
    }
    @IBAction func checkCoop(sender: AnyObject) {
        coopCB.selected = !coopCB.selected;
    }
    
    //events for degree checkboxes
    @IBAction func checkBachelors(sender: AnyObject) {
        bachelorsCB.selected = !bachelorsCB.selected;
    }
    @IBAction func checkMasters(sender: AnyObject) {
        mastersCB.selected = !mastersCB.selected;
    }
    @IBAction func checkDoctoral(sender: AnyObject) {
        doctoralCB.selected = !doctoralCB.selected;
    }
    
    //events for sponsor checkboxes
    @IBAction func checkYes(sender: AnyObject) {
        sponsorYesCB.selected = !sponsorYesCB.selected;
    }
    
    @IBAction func checkNo(sender: AnyObject) {
        sponsorNoCB.selected = !sponsorNoCB.selected;
    }
    @IBAction func checkOnOccasion(sender: AnyObject) {
        sponsorOnOccasionCB.selected = !sponsorOnOccasionCB.selected;
    }
    
    
    @IBAction func filterDone(sender: AnyObject) {
        var checked = [Int]();
        //Determine checked checkboxes
        if (internshipCB.selected) { checked.append(1); }
        if (fulltimeCB.selected) { checked.append(2); }
        if (coopCB.selected) { checked.append(3); }
        
        if (bachelorsCB.selected) { checked.append(4); }
        if (mastersCB.selected) { checked.append(5); }
        if (doctoralCB.selected) { checked.append(6); }
        
        if (sponsorYesCB.selected) { checked.append(7); }
        if (sponsorNoCB.selected) { checked.append(8); }
        if (sponsorOnOccasionCB.selected) { checked.append(9); }
        
        if (majorPV.selectedRowInComponent(0) > 0) {
            checked.append(majorPV.selectedRowInComponent(0) + 9);
        }

        filteredOrgNameToIdList.removeAll(keepCapacity: false);
        for org in orgNameToIdList {
            if ((orgData[org.orgId]) == nil) { continue; }

            if (filtersMatchOrg(checked, org: orgData[org.orgId]!)) {
                filteredOrgNameToIdList.append(org);
            }
        }
        
        isFiltered = true;
        navigationController?.popViewControllerAnimated(true);
    }
    @IBAction func filterCancel(sender: AnyObject) {
        isFiltered = false;
        navigationController?.popViewControllerAnimated(true);
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Create Filter";
        
        internshipCB.setImage(UIImage(named: "uncheckedcb"), forState: UIControlState.Normal);
        internshipCB.setImage(UIImage(named: "checkedcb"), forState: UIControlState.Selected);
        internshipCB.selected = false;

        fulltimeCB.setImage(UIImage(named: "uncheckedcb"), forState: UIControlState.Normal);
        fulltimeCB.setImage(UIImage(named: "checkedcb"), forState: UIControlState.Selected);
        fulltimeCB.selected = false;
        
        coopCB.setImage(UIImage(named: "uncheckedcb"), forState: UIControlState.Normal);
        coopCB.setImage(UIImage(named: "checkedcb"), forState: UIControlState.Selected);
        coopCB.selected = false;
        
        bachelorsCB.setImage(UIImage(named: "uncheckedcb"), forState: UIControlState.Normal);
        bachelorsCB.setImage(UIImage(named: "checkedcb"), forState: UIControlState.Selected);
        bachelorsCB.selected = false;
        
        mastersCB.setImage(UIImage(named: "uncheckedcb"), forState: UIControlState.Normal);
        mastersCB.setImage(UIImage(named: "checkedcb"), forState: UIControlState.Selected);
        mastersCB.selected = false;
        
        doctoralCB.setImage(UIImage(named: "uncheckedcb"), forState: UIControlState.Normal);
        doctoralCB.setImage(UIImage(named: "checkedcb"), forState: UIControlState.Selected);
        doctoralCB.selected = false;

        sponsorYesCB.setImage(UIImage(named: "uncheckedcb"), forState: UIControlState.Normal);
        sponsorYesCB.setImage(UIImage(named: "checkedcb"), forState: UIControlState.Selected);
        sponsorYesCB.selected = false;
        
        sponsorNoCB.setImage(UIImage(named: "uncheckedcb"), forState: UIControlState.Normal);
        sponsorNoCB.setImage(UIImage(named: "checkedcb"), forState: UIControlState.Selected);
        sponsorNoCB.selected = false;
        
        sponsorOnOccasionCB.setImage(UIImage(named: "uncheckedcb"), forState: UIControlState.Normal);
        sponsorOnOccasionCB.setImage(UIImage(named: "checkedcb"), forState: UIControlState.Selected);
        sponsorOnOccasionCB.selected = false;

        // Do any additional setup after loading the view.
    }
    
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1;
    }
    
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return majorsArray.count;
    }
    
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return majorsArray[row];
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

 /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
    }
    
*/
    func filtersMatchOrg(filters:[Int], org: organization) -> Bool {
        for filter in filters {
            switch (filter) {
                case 1:
                    if (org.internshipC == false) { return false; }
                    break;
                case 2:
                    if (!org.fulltimeC) { return false; }
                    break;
                case 3:
                    if (!org.coopC) { return false; }
                    break;
                case 4:
                    if (!org.bachelorsC) { return false; }
                    break;
                case 5:
                    if (!org.mastersC) { return false; }
                    break;
                case 6:
                    if (!org.doctoralC) { return false; }
                    break;
                case 7:
                    if (!org.sponsorYesC) { return false; }
                    break;
                case 8:
                    if (!org.sponsorNoC) { return false; }
                    break;
                case 9:
                    if (!org.sponsorOnOccasionC) { return false; }
                    break;
                default:
                    if (filter > 9 && filter < 27) {
                        if (!org.majorC[filter-9]) {
                            return false;
                        }
                    }
                    break;
            }
        }
        return true;
    }
}
