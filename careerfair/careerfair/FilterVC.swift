//
//  FilterVC.swift
//  careerfair
//
//  Created by Kathryn Panter on 8/19/15.
//  Copyright (c) 2015 AlexRobertsKatePanter. All rights reserved.
//

import UIKit

var filteredOrgNameToIdList = [orgNameToId]();

class FilterVC: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource, UIScrollViewDelegate {
    var scrollView:UIScrollView!
    var containerView:UIView!
    
    private var majorsArray = ["All", "Aerospace Engineering", "AOSS", "Biomedical Engineering",
        "Chemical Engineering", "Civil Engineering", "Computer Engineering", "Computer Science", "Data Science", "Electrical Engineering", "Engineering Physics", "Environmental Engineering", "Industrial & Operations Engineering", "Materials Science & Engineering", "Mechanical Engineering", "Naval Architecture and Marine Engineering", "Nuclear Engineering"];
    
    
    var majorPV: UIPickerView = UIPickerView();
    
    var jobTypeLabel:        UILabel!
    var internshipCB:       UIButton!
    var internshipLabel:    UILabel!
    var fulltimeCB:         UIButton!
    var fulltimeLabel:      UILabel!
    var coopCB:             UIButton!
    var coopLabel:          UILabel!
    
    var dayLabel:           UILabel!
    var dayOneCB:           UIButton!
    var dayOneLabel:        UILabel!
    var dayTwoCB:           UIButton!
    var dayTwoLabel:        UILabel!

    var degreeLabel:        UILabel!
    var bachelorsCB:        UIButton!
    var bachelorsLabel:     UILabel!
    var mastersCB:          UIButton!
    var mastersLabel:       UILabel!
    var doctoralCB:         UIButton!
    var doctoralLabel:      UILabel!
    
    var sponsorLabel:       UILabel!
    var sponsorYesCB:       UIButton!
    var sponsorYesLabel:    UILabel!
    var sponsorNoCB:        UIButton!
    var sponsorNoLabel:     UILabel!
    var sponsorOccCB:       UIButton!
    var sponsorOccLabel:    UILabel!
    
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
        sponsorOccCB.selected = !sponsorOccCB.selected;
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
        if (sponsorOccCB.selected) { checked["sponsor"]!.insert(2); }
        
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
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        scrollView.frame = view.bounds
        containerView.frame = CGRectMake(0, 0, scrollView.contentSize.width, scrollView.contentSize.height);
        
        jobTypeLabel.frame = CGRectMake(16, 20, UIScreen.mainScreen().bounds.width-16, 21);
        internshipCB.frame = CGRectMake(45, 56, 26, 26);
        internshipLabel.frame = CGRectMake(30, 84, 61, 16)
        coopCB.frame = CGRectMake(133, 56, 26, 26)
        coopLabel.frame = CGRectMake(129, 84, 39, 16)
        fulltimeCB.frame = CGRectMake(220, 56, 26, 26)
        fulltimeLabel.frame = CGRectMake(210, 84, 55, 16)
        
        dayLabel.frame = CGRectMake(16, 136, UIScreen.mainScreen().bounds.width-16, 21)
        dayOneCB.frame = CGRectMake(45, 172, 26, 26)
        dayOneLabel.frame = CGRectMake(36, 200, 60, 16)
        dayTwoCB.frame = CGRectMake(133, 172, 26, 26)
        dayTwoLabel.frame = CGRectMake(125, 200, 60, 16)
        
        degreeLabel.frame = CGRectMake(16, 252, UIScreen.mainScreen().bounds.width-16, 21);
        bachelorsCB.frame = CGRectMake(45, 288, 26, 26)
        bachelorsLabel.frame = CGRectMake(30, 316, 61, 16)
        mastersCB.frame = CGRectMake(135, 288, 26, 26)
        mastersLabel.frame = CGRectMake(125, 316, 61, 16)
        doctoralCB.frame = CGRectMake(220, 288, 26, 26)
        doctoralLabel.frame = CGRectMake(208, 316, 61, 16)
        
        sponsorLabel.frame = CGRectMake(16, 368, UIScreen.mainScreen().bounds.width-16, 21);
        sponsorYesCB.frame = CGRectMake(45, 404, 26, 26)
        sponsorYesLabel.frame = CGRectMake(46.5, 432, 30, 16)
        sponsorNoCB.frame = CGRectMake(135, 404, 26, 26)
        sponsorNoLabel.frame = CGRectMake(140, 432, 30, 16)
        sponsorOccCB.frame = CGRectMake(220, 404, 26, 26)
        sponsorOccLabel.frame = CGRectMake(200, 432, 80, 16)
        
        majorPV.frame = CGRectMake(16, 480, UIScreen.mainScreen().bounds.width-32, 180);
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Create Filter";
        
        scrollView = UIScrollView();
        scrollView.delegate = self;
        
        scrollView.contentSize = CGSizeMake(UIScreen.mainScreen().bounds.width, 680);
        
        containerView = UIView();
        
        majorPV.delegate = self;
        majorPV.dataSource = self;
        buildControls();
        
        scrollView.addSubview(containerView);
        view.addSubview(scrollView)
    }
    
    func buildControls() {

        // Position Type
        jobTypeLabel = UILabel();
        jobTypeLabel.text = "Position Type";
        jobTypeLabel.font = UIFont.systemFontOfSize(17);
        containerView.addSubview(jobTypeLabel);
        
        internshipCB = UIButton();
        internshipCB.addTarget(self, action: #selector(checkInternship), forControlEvents: .TouchDown)
        internshipCB.setImage(UIImage(named: "uncheckedcb"), forState: UIControlState.Normal);
        internshipCB.setImage(UIImage(named: "checkedcb"), forState: UIControlState.Selected);
        internshipCB.selected = false;
        containerView.addSubview(internshipCB)

        internshipLabel = UILabel();
        internshipLabel.text = "Internship";
        internshipLabel.font = UIFont.systemFontOfSize(13);
        containerView.addSubview(internshipLabel);

        fulltimeCB = UIButton();
        fulltimeCB.addTarget(self, action: #selector(checkFulltime), forControlEvents: .TouchDown)
        fulltimeCB.setImage(UIImage(named: "uncheckedcb"), forState: UIControlState.Normal);
        fulltimeCB.setImage(UIImage(named: "checkedcb"), forState: UIControlState.Selected);
        fulltimeCB.selected = false;
        containerView.addSubview(fulltimeCB)

        
        fulltimeLabel = UILabel();
        fulltimeLabel.text = "Full Time";
        fulltimeLabel.font = UIFont.systemFontOfSize(13);
        containerView.addSubview(fulltimeLabel);
        
        coopCB = UIButton();
        coopCB.addTarget(self, action: #selector(checkCoop), forControlEvents: .TouchDown)
        coopCB.setImage(UIImage(named: "uncheckedcb"), forState: UIControlState.Normal);
        coopCB.setImage(UIImage(named: "checkedcb"), forState: UIControlState.Selected);
        coopCB.selected = false;
        containerView.addSubview(coopCB)
        
        coopLabel = UILabel();
        coopLabel.text = "Co-op";
        coopLabel.font = UIFont.systemFontOfSize(13);
        containerView.addSubview(coopLabel);
        
        
        // Day
        dayLabel = UILabel();
        dayLabel.text = "Date Attending";
        dayLabel.font = UIFont.systemFontOfSize(17);
        containerView.addSubview(dayLabel);
        
        dayOneCB = UIButton();
        dayOneCB.addTarget(self, action: #selector(checkDayOne), forControlEvents: .TouchDown)
        dayOneCB.setImage(UIImage(named: "uncheckedcb"), forState: UIControlState.Normal);
        dayOneCB.setImage(UIImage(named: "checkedcb"), forState: UIControlState.Selected);
        dayOneCB.selected = false;
        containerView.addSubview(dayOneCB)
        
        dayOneLabel = UILabel();
        dayOneLabel.text = "Day One";
        dayOneLabel.font = UIFont.systemFontOfSize(13);
        containerView.addSubview(dayOneLabel);

        dayTwoCB = UIButton();
        dayTwoCB.addTarget(self, action: #selector(checkDayTwo), forControlEvents: .TouchDown)
        dayTwoCB.setImage(UIImage(named: "uncheckedcb"), forState: UIControlState.Normal);
        dayTwoCB.setImage(UIImage(named: "checkedcb"), forState: UIControlState.Selected);
        dayTwoCB.selected = false;
        containerView.addSubview(dayTwoCB)
        
        dayTwoLabel = UILabel();
        dayTwoLabel.text = "Day Two";
        dayTwoLabel.font = UIFont.systemFontOfSize(13);
        containerView.addSubview(dayTwoLabel);
        
        // Degree
        degreeLabel = UILabel();
        degreeLabel.text = "Degree";
        degreeLabel.font = UIFont.systemFontOfSize(17);
        containerView.addSubview(degreeLabel);

        bachelorsCB = UIButton();
        bachelorsCB.addTarget(self, action: #selector(checkBachelors), forControlEvents: .TouchDown)
        bachelorsCB.setImage(UIImage(named: "uncheckedcb"), forState: UIControlState.Normal);
        bachelorsCB.setImage(UIImage(named: "checkedcb"), forState: UIControlState.Selected);
        bachelorsCB.selected = false;
        containerView.addSubview(bachelorsCB);
        
        bachelorsLabel = UILabel();
        bachelorsLabel.text = "Bachelors";
        bachelorsLabel.font = UIFont.systemFontOfSize(13);
        containerView.addSubview(bachelorsLabel);
        
        mastersCB = UIButton();
        mastersCB.addTarget(self, action: #selector(checkMasters), forControlEvents: .TouchDown)
        mastersCB.setImage(UIImage(named: "uncheckedcb"), forState: UIControlState.Normal);
        mastersCB.setImage(UIImage(named: "checkedcb"), forState: UIControlState.Selected);
        mastersCB.selected = false;
        containerView.addSubview(mastersCB);
        
        mastersLabel = UILabel();
        mastersLabel.text = "Masters";
        mastersLabel.font = UIFont.systemFontOfSize(13);
        containerView.addSubview(mastersLabel);
        
        doctoralCB = UIButton();
        doctoralCB.addTarget(self, action: #selector(checkDoctoral), forControlEvents: .TouchDown)
        doctoralCB.setImage(UIImage(named: "uncheckedcb"), forState: UIControlState.Normal);
        doctoralCB.setImage(UIImage(named: "checkedcb"), forState: UIControlState.Selected);
        doctoralCB.selected = false;
        containerView.addSubview(doctoralCB);
        
        doctoralLabel = UILabel();
        doctoralLabel.text = "Doctoral";
        doctoralLabel.font = UIFont.systemFontOfSize(13);
        containerView.addSubview(doctoralLabel);
        
        // Sponsor
        sponsorLabel = UILabel();
        sponsorLabel.text = "Sponsor";
        sponsorLabel.font = UIFont.systemFontOfSize(17);
        containerView.addSubview(sponsorLabel);
        
        sponsorYesCB = UIButton();
        sponsorYesCB.addTarget(self, action: #selector(checkYes), forControlEvents: .TouchDown)
        sponsorYesCB.setImage(UIImage(named: "uncheckedcb"), forState: UIControlState.Normal);
        sponsorYesCB.setImage(UIImage(named: "checkedcb"), forState: UIControlState.Selected);
        sponsorYesCB.selected = false;
        containerView.addSubview(sponsorYesCB);

        sponsorYesLabel = UILabel();
        sponsorYesLabel.text = "Yes";
        sponsorYesLabel.font = UIFont.systemFontOfSize(13);
        containerView.addSubview(sponsorYesLabel);

        sponsorNoCB = UIButton();
        sponsorNoCB.addTarget(self, action: #selector(checkNo), forControlEvents: .TouchDown)
        sponsorNoCB.setImage(UIImage(named: "uncheckedcb"), forState: UIControlState.Normal);
        sponsorNoCB.setImage(UIImage(named: "checkedcb"), forState: UIControlState.Selected);
        sponsorNoCB.selected = false;
        containerView.addSubview(sponsorNoCB);

        sponsorNoLabel = UILabel();
        sponsorNoLabel.text = "No";
        sponsorNoLabel.font = UIFont.systemFontOfSize(13);
        containerView.addSubview(sponsorNoLabel);

        sponsorOccCB = UIButton();
        sponsorOccCB.addTarget(self, action: #selector(checkOnOccasion), forControlEvents: .TouchDown)
        sponsorOccCB.setImage(UIImage(named: "uncheckedcb"), forState: UIControlState.Normal);
        sponsorOccCB.setImage(UIImage(named: "checkedcb"), forState: UIControlState.Selected);
        sponsorOccCB.selected = false;
        containerView.addSubview(sponsorOccCB);
       
        sponsorOccLabel = UILabel();
        sponsorOccLabel.text = "On Occasion";
        sponsorOccLabel.font = UIFont.systemFontOfSize(13);
        containerView.addSubview(sponsorOccLabel);
        
        containerView.addSubview(majorPV);
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
