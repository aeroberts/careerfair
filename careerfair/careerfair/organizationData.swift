//
//  organizationData.swift
//  careerfair
//
//  Created by Alexander Roberts on 7/30/15.
//  Copyright (c) 2015 AlexRobertsKatePanter. All rights reserved.
//

import Foundation

var orgGlobal = organizationData;

// organizationData holds all global data structures
class organizationData {
    var orgData = [Int: organization](); // Maps orgId to organization struct
    var favoritedOrgs = [Int: UnsafeMutablePointer<organization?>](); // Maps orgId to org*
    var notedOrgs = [Int: UnsafeMutablePointer<organization?>](); // Maps orgId to org*
    
    func pushFavoritedOrgs(orgId: Int) -> Bool {
        if (orgData[orgId] === nil) {
            return false;
        }
        
        withUnsafeMutablePointer(&orgData[orgId], {(orgPtr) -> Void in
            var currentOrgPtr : UnsafeMutablePointer<organization?> = orgPtr;
            favoritedOrgs[orgId] = currentOrgPtr;
        })
        
        return true;
    }
    
    func removeFavoritedOrgs(orgId: Int) -> Bool {
        favoritedOrgs[orgId] = nil;
        return true;
    }
    
    func pushNotedOrgs(orgId: Int) -> Bool {
        if (orgData[orgId] === nil) {
            return false;
        }
        
        withUnsafeMutablePointer(&orgData[orgId], {(orgPtr) -> Void in
            var currentOrgPtr : UnsafeMutablePointer<organization?> = orgPtr;
            notedOrgs[orgId] = currentOrgPtr;
        })
        
        return true;
    }
    
    func removeNotedOrgs(orgId: Int) -> Bool {
        notedOrgs[orgId] = nil;
        return true;
    }
}