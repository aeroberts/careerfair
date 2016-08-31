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
    
    @IBOutlet weak var dayOneCB: UIButton!
    @IBOutlet weak var dayTwoCB: UIButton!
    
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
    
    //events for day checkboxes
    @IBAction func checkDayOne(sender: AnyObject) {
        dayOneCB.selected = !dayOneCB.selected;
    }
    @IBAction func checkDayTwo(sender: AnyObject) {
        dayTwoCB.selected = !dayTwoCB.selected;
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
        var checked = Dictionary<String, Set<Int>>();
        //Determine checked checkboxes
        checked["type"] = Set<Int>();
        if (internshipCB.selected) { checked["type"]!.insert(0); }
        if (fulltimeCB.selected) { checked["type"]!.insert(1); }
        if (coopCB.selected) { checked["type"]!.insert(2); }
        
        checked["degree"] = Set<Int>();
        if (bachelorsCB.selected) { checked["degree"]!.insert(0); }
        if (mastersCB.selected) { checked["degree"]!.insert(1); }
        if (doctoralCB.selected) { checked["degree"]!.insert(2); }
        
        checked["day"] = Set<Int>();
        if (dayOneCB.selected) { checked["day"]!.insert(0); }
        if (dayTwoCB.selected) { checked["day"]!.insert(1); }
        
        checked["sponsor"] = Set<Int>();
        if (sponsorYesCB.selected) { checked["sponsor"]!.insert(0); }
        if (sponsorNoCB.selected) { checked["sponsor"]!.insert(1); }
        if (sponsorOnOccasionCB.selected) { checked["sponsor"]!.insert(2); }
        
        checked["major"] = Set<Int>();
        if (majorPV.selectedRowInComponent(0) > 0) {
            checked["major"]!.insert(majorPV.selectedRowInComponent(0));
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
        
        dayOneCB.setImage(UIImage(named: "uncheckedcb"), forState: UIControlState.Normal);
        dayOneCB.setImage(UIImage(named: "checkedcb"), forState: UIControlState.Selected);
        dayOneCB.selected = false;
        
        dayTwoCB.setImage(UIImage(named: "uncheckedcb"), forState: UIControlState.Normal);
        dayTwoCB.setImage(UIImage(named: "checkedcb"), forState: UIControlState.Selected);
        dayTwoCB.selected = false;
        
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
    func filtersMatchOrg(filters:Dictionary<String, Set<Int>>, org: organization) -> Bool {
        if (orgMatchesType(filters["type"]!, org: org) &&
            orgMatchesDegree(filters["degree"]!, org: org) &&
            orgMatchesDay(filters["day"]!, org: org) &&
            orgMatchesSponsor(filters["sponsor"]!, org: org) &&
            orgMatchesMajor(filters["major"]!, org: org)) {
            return true;
        }
        return false;
    }
    
    func orgMatchesType(filters:Set<Int>, org: organization) -> Bool {
        if (filters.isEmpty) { return true; }
        if (filters.contains(0) && org.internshipC) { return true; }
        if (filters.contains(1) && org.coopC) { return true; }
        if (filters.contains(2) && org.fulltimeC) { return true; }
        return false;
    }
    
    func orgMatchesDegree(filters:Set<Int>, org: organization) -> Bool {
        if (filters.isEmpty) { return true; }
        if (filters.contains(0) && org.bachelorsC) { return true; }
        if (filters.contains(1) && org.mastersC) { return true; }
        if (filters.contains(2) && org.doctoralC) { return true; }
        return false;
    }
    
    func orgMatchesDay(filters:Set<Int>, org: organization) -> Bool {
        if (filters.isEmpty) { return true; }
        if (filters.contains(0) && org.internshipC) { return true; }
        if (filters.contains(1) && org.coopC) { return true; }
        return false;
    }
    
    func orgMatchesSponsor(filters:Set<Int>, org: organization) -> Bool {
        if (filters.isEmpty) { return true; }
        if (filters.contains(0) && org.sponsorYesC) { return true; }
        if (filters.contains(1) && org.sponsorNoC) { return true; }
        if (filters.contains(2) && org.sponsorOnOccasionC) { return true; }
        return false;
    }
    
    func orgMatchesMajor(filters:Set<Int>, org: organization) -> Bool {
        if (filters.isEmpty) { return true; }
        for major in filters {
            return org.majorC[major];
        }
        return true;
    }
}
