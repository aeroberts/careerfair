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
    case "duderstadt center":
        return mapLocations.dude;
    case "duderstadt connector":
        return mapLocations.dudeConnector;
    case "fxb":
        return mapLocations.fxb;
    case "gg brown":
        return mapLocations.ggBrown;
    case "pierpont":
        return mapLocations.pierpont;
    case "chrysler lobby":
        return mapLocations.chryslerLobby
    default:
        return mapLocations.dude;
    }
}