//
//  organization.swift
//  careerfair
//
//  Created by Alexander Roberts on 7/27/15.
//  Copyright (c) 2015 AlexRobertsKatePanter. All rights reserved.
//

import Foundation

// Define global data structures here
var orgData = [Int: organization](); // Maps orgId to organization struct
var favoritedOrgs = Set<Int>();
var notedOrgs = Set<Int>();

class organization {
    var title: String;
    var desc: String;
    var note: String;
    var favorited: Bool;
    var date: NSDate;
    var location: String;
    var booth: Int;
    var jobLocation: String;
    var attendingReceptions: Bool;
    
    var internshipC: Bool;
    var fulltimeC: Bool;
    var coopC: Bool;
    var bachelorsC: Bool;
    var mastersC: Bool;
    var doctoralC: Bool;
    var sponsorYesC: Bool;
    var sponsorNoC: Bool;
    var sponsorOnOccasionC: Bool;
    var majorC = [Bool]();
    
    var orgId:Int;
    
    init(fromTitle title_in: String, desc_in: String, note_in: String, favorited_in: Bool, date_in: NSDate, location_in: String, booth_in: Int, jobLoc_in: String, attendingRec_in: Bool, internshipC_in: Bool, fulltimeC_in: Bool, coopC_in: Bool, bachelorsC_in: Bool, mastersC_in:Bool, doctoralC_in: Bool, sponsorYesC_in: Bool, sponsorNoC_in: Bool, sponsorOnOccasionC_in: Bool, majorC_in: [Int], id_in:Int) {
        
        title = title_in;
        desc = desc_in;
        note = note_in;
        favorited = favorited_in;
        date = date_in;
        location = location_in;
        booth = booth_in;
        jobLocation = jobLoc_in;
        attendingReceptions = attendingRec_in;
        
        
        internshipC = internshipC_in;
        fulltimeC = fulltimeC_in;
        coopC = coopC_in;
        bachelorsC = bachelorsC_in;
        mastersC = mastersC_in;
        doctoralC = doctoralC_in;
        sponsorYesC = sponsorYesC_in;
        sponsorNoC = sponsorNoC_in;
        sponsorOnOccasionC = sponsorOnOccasionC_in;
        
        majorC = Array(count: 16, repeatedValue: false);
        for majorId in majorC_in {
            majorC[majorId] = true;
        }
        
        orgId = id_in;
    }
    
    init() {
        title = "";
        desc = "";
        note = "";
        favorited = false;
        date = NSDate();
        location = "";
        booth = -1;
        jobLocation = "Midwest";
        attendingReceptions = false;
        
        internshipC = false;
        fulltimeC = false;
        coopC = false;
        bachelorsC = false;
        mastersC = false;
        doctoralC = false;
        sponsorYesC = false;
        sponsorNoC = false;
        sponsorOnOccasionC = false;
        
        majorC = Array(count: 16, repeatedValue: false);
        orgId = orgData.count;
    }
    
    func listDegree() -> String {
        var degrees: String = ""
        if (self.bachelorsC) {
            degrees += "Bachelors, "
        }
        if (self.mastersC) {
            degrees += "Masters, "
        }
        if (self.doctoralC) {
            degrees += "Doctoral, "
        }
    
        if (degrees.isEmpty) { return "" }
        return degrees.substringToIndex(degrees.endIndex.advancedBy(-2))
    }
    
    func listJobType() -> String {
        var jobTypes: String = ""
        if (self.internshipC) {
            jobTypes += "Internship, "
        }
        if (self.fulltimeC) {
            jobTypes += "Full Time, "
        }
        if (self.coopC) {
            jobTypes += "Co-op, "
        }
        
        if (jobTypes.isEmpty) { return ""; }
        return jobTypes.substringToIndex(jobTypes.endIndex.advancedBy(-2))
    }
    
    func listMajors() -> String {
        var majors = ""
        if (self.majorC[0]) {
            majors += "AERO, "
        }
        if (self.majorC[1]) {
            majors += "AOSS, "
        }
        if (self.majorC[2]) {
            majors += "Biomedical, "
        }
        if (self.majorC[3]) {
            majors += "CHEM, "
        }
        if (self.majorC[4]) {
            majors += "Civil, "
        }
        if (self.majorC[5]) {
            majors += "CE, "
        }
        if (self.majorC[6]) {
            majors += "CS, "
        }
        if (self.majorC[7]) {
            majors += "Data Science, "
        }
        if (self.majorC[8]) {
            majors += "EE, "
        }
        if (self.majorC[9]) {
            majors += "Engin. Physics, "
        }
        if (self.majorC[10]) {
            majors += "Environmental, "
        }
        if (self.majorC[11]) {
            majors += "IoE, "
        }
        if (self.majorC[12]) {
            majors += "MSE, "
        }
        if (self.majorC[13]) {
            majors += "ME, "
        }
        if (self.majorC[14]) {
            majors += "Naval, "
        }
        if (self.majorC[15]) {
            majors += "NERS, "
        }
        if (majors.isEmpty) { return "" }
        return majors.substringToIndex(majors.endIndex.advancedBy(-2))

    }
}

func pushFavoritedOrgs(orgId: Int) -> Bool {
    if (orgData[orgId] === nil) {
        return false;
    }
    
    favoritedOrgs.insert(orgId);

    return true;
}

func removeFavoritedOrgs(orgId: Int) -> Bool {
    favoritedOrgs.remove(orgId);
    return true;
}

func pushNotedOrgs(orgId: Int) -> Bool {
    if (orgData[orgId] === nil) {
        return false;
    }
    
    notedOrgs.insert(orgId);
        
    return true;
}

func removeNotedOrgs(orgId: Int) -> Bool {
    notedOrgs.remove(orgId);
    return true;
}



struct orgNameToId {
        var orgName:String;
        var orgId:Int;
        var filtered:Bool;
    
        init(orgName_in:String, orgId_in:Int) {
                orgName = orgName_in;
                orgId = orgId_in;
                filtered = true;
            }
    }

var orgNameToIdList = [orgNameToId]();
