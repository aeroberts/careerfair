//
//  location.swift
//  careerfair
//
//  Created by Kathryn Panter on 9/15/15.
//  Copyright (c) 2015 AlexRobertsKatePanter. All rights reserved.
//

import Foundation

// Given an organization's location, return the enum for the Map Location
func parseLocation(location:String) -> mapLocations {
    switch(location.lowercaseString) {
    case "bbb":
        return mapLocations.BBB;
    case "eecs":
        return mapLocations.eecs;
    case "dow":
        return mapLocations.dow;
    case "dude":
        return mapLocations.dude;
    case "dudeconnector":
        return mapLocations.dudeConnector;
    case "fxb":
        return mapLocations.fxb;
    case "ggbrown":
        return mapLocations.ggBrown;
    default:
        return mapLocations.dude;
    }
}