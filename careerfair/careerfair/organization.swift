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
    
    init() {
        title = "";
        desc = "";
        note = "";
        favorited = false;
        date = "";
        location = "";
    }
    
    init(fromTitle title_in: String, desc_in: String, note_in: String, favorited_in: Bool, date_in: String, location_in: String) {
        title = title_in;
        desc = desc_in;
        note = note_in;
        favorited = favorited_in;
        date = date_in;
        location = location_in;
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
