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
    var date: String;
    var location: String;
    
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
    
    init(fromTitle title_in: String, desc_in: String, note_in: String, favorited_in: Bool, date_in: String, location_in: String, internshipC_in: Bool, fulltimeC_in: Bool, coopC_in: Bool, bachelorsC_in: Bool, mastersC_in:Bool, doctoralC_in: Bool, sponsorYesC_in: Bool, sponsorNoC_in: Bool, sponsorOnOccasionC_in: Bool, majorC_in: [Int]) {
        
        title = title_in;
        desc = desc_in;
        note = note_in;
        favorited = favorited_in;
        date = date_in;
        location = location_in;
        
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
    }
    
    init() {
        title = "";
        desc = "";
        note = "";
        favorited = false;
        date = "";
        location = "";
        
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
