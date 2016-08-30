//
//  mapMarker.swift
//  careerfair
//
//  Created by Alexander Roberts on 6/9/16.
//  Copyright © 2016 AlexRobertsKatePanter. All rights reserved.
//

import Foundation
import UIKit

class mapMarker {
    var location: mapLocations
    var position: CGPoint
    var size: Int
    
    init(mapLocation_in: mapLocations, position_in: CGPoint, size_in:Int) {
        location = mapLocation_in
        position = position_in
        size = size_in
    }
}

func getMapMarkerArray(location_in:mapLocations) -> [mapMarker] {
    switch(location_in) {
        case mapLocations.BBB:
            return mapMarkersBbb;
        case mapLocations.dow:
            return mapMarkersDow;
        case mapLocations.dude:
            return mapMarkersDude;
        case mapLocations.dudeConnector:
            return mapMarkersDudeConnector;
        case mapLocations.eecs:
            return mapMarkersEecs;
        case mapLocations.fxb:
            return mapMarkersFxb;
        case mapLocations.ggBrown:
            return mapMarkersGGbrown;
        case mapLocations.pierpont:
            return mapMarkersPierpont;
        default:
            return mapMarkersDude;
    }
}

var orgIdToMapMarker: [Int:mapMarker] = [:]

var mapMarkersDow: [mapMarker] = [
    mapMarker(mapLocation_in: mapLocations.dow, position_in: CGPointMake(33.5, 56), size_in: 10),
    mapMarker(mapLocation_in: mapLocations.dow, position_in: CGPointMake(86, 56.25), size_in: 10),
    mapMarker(mapLocation_in: mapLocations.dow, position_in: CGPointMake(110, 56.25), size_in: 10),
    mapMarker(mapLocation_in: mapLocations.dow, position_in: CGPointMake(294, 56.25), size_in: 10),
    mapMarker(mapLocation_in: mapLocations.dow, position_in: CGPointMake(317, 56), size_in: 10),
    mapMarker(mapLocation_in: mapLocations.dow, position_in: CGPointMake(163, 98.5), size_in: 10),
    mapMarker(mapLocation_in: mapLocations.dow, position_in: CGPointMake(188, 98.5), size_in: 10),
    mapMarker(mapLocation_in: mapLocations.dow, position_in: CGPointMake(211, 98.5), size_in: 10),
    mapMarker(mapLocation_in: mapLocations.dow, position_in: CGPointMake(231.5, 98.5), size_in: 10),
    mapMarker(mapLocation_in: mapLocations.dow, position_in: CGPointMake(48.5, 95), size_in: 10)
]

var mapMarkersDude = [mapMarker]()

var mapMarkersDudeConnector: [mapMarker] = [
    mapMarker(mapLocation_in: mapLocations.dudeConnector, position_in: CGPointMake(168, 51), size_in: 10),
    mapMarker(mapLocation_in: mapLocations.dudeConnector, position_in: CGPointMake(146.5, 51), size_in: 10),
    mapMarker(mapLocation_in: mapLocations.dudeConnector, position_in: CGPointMake(119.25, 59.25), size_in: 10),
    mapMarker(mapLocation_in: mapLocations.dudeConnector, position_in: CGPointMake(107.5, 82.75), size_in: 10),
    mapMarker(mapLocation_in: mapLocations.dudeConnector, position_in: CGPointMake(107.5, 104.75), size_in: 10),
    mapMarker(mapLocation_in: mapLocations.dudeConnector, position_in: CGPointMake(119, 130.25), size_in: 10),
    mapMarker(mapLocation_in: mapLocations.dudeConnector, position_in: CGPointMake(146.5, 135.75), size_in: 10),
    mapMarker(mapLocation_in: mapLocations.dudeConnector, position_in: CGPointMake(168, 135.75), size_in: 10),
    mapMarker(mapLocation_in: mapLocations.dudeConnector, position_in: CGPointMake(192.75, 104.25), size_in: 10),
    mapMarker(mapLocation_in: mapLocations.dudeConnector, position_in: CGPointMake(192.75, 80), size_in: 10),
    mapMarker(mapLocation_in: mapLocations.dudeConnector, position_in: CGPointMake(162.25, 86), size_in: 10),
    mapMarker(mapLocation_in: mapLocations.dudeConnector, position_in: CGPointMake(143.25, 87.25), size_in: 10),
    mapMarker(mapLocation_in: mapLocations.dudeConnector, position_in: CGPointMake(142.75, 104.75), size_in: 10),
    mapMarker(mapLocation_in: mapLocations.dudeConnector, position_in: CGPointMake(162, 104.75), size_in: 10),
    mapMarker(mapLocation_in: mapLocations.dudeConnector, position_in: CGPointMake(232, 70.25), size_in: 10),
    mapMarker(mapLocation_in: mapLocations.dudeConnector, position_in: CGPointMake(232, 92.25), size_in: 10),
    mapMarker(mapLocation_in: mapLocations.dudeConnector, position_in: CGPointMake(232, 114.25), size_in: 10),
    mapMarker(mapLocation_in: mapLocations.dudeConnector, position_in: CGPointMake(232, 167.75), size_in: 10),
    mapMarker(mapLocation_in: mapLocations.dudeConnector, position_in: CGPointMake(232, 189.5), size_in: 10),
    mapMarker(mapLocation_in: mapLocations.dudeConnector, position_in: CGPointMake(232, 212), size_in: 10),
    mapMarker(mapLocation_in: mapLocations.dudeConnector, position_in: CGPointMake(232, 234), size_in: 10),
    mapMarker(mapLocation_in: mapLocations.dudeConnector, position_in: CGPointMake(232, 256.25), size_in: 10),
    mapMarker(mapLocation_in: mapLocations.dudeConnector, position_in: CGPointMake(232, 278.5), size_in: 10),
    mapMarker(mapLocation_in: mapLocations.dudeConnector, position_in: CGPointMake(232, 300), size_in: 10),
    mapMarker(mapLocation_in: mapLocations.dudeConnector, position_in: CGPointMake(232, 322.5), size_in: 10),
    mapMarker(mapLocation_in: mapLocations.dudeConnector, position_in: CGPointMake(232, 344), size_in: 10),
    mapMarker(mapLocation_in: mapLocations.dudeConnector, position_in: CGPointMake(232, 365.75), size_in: 10)
]

var mapMarkersEecs: [mapMarker] = [
    mapMarker(mapLocation_in: mapLocations.eecs, position_in: CGPointMake(157.5, 581.5), size_in: 12),
    mapMarker(mapLocation_in: mapLocations.eecs, position_in: CGPointMake(157.5, 558.5), size_in: 12),
    mapMarker(mapLocation_in: mapLocations.eecs, position_in: CGPointMake(157.5, 468), size_in: 12),
    mapMarker(mapLocation_in: mapLocations.eecs, position_in: CGPointMake(157.5, 445), size_in: 12),
    mapMarker(mapLocation_in: mapLocations.eecs, position_in: CGPointMake(157.5, 422), size_in: 12),
    mapMarker(mapLocation_in: mapLocations.eecs, position_in: CGPointMake(157.5, 399), size_in: 12),
    mapMarker(mapLocation_in: mapLocations.eecs, position_in: CGPointMake(157.5, 376), size_in: 12),
    mapMarker(mapLocation_in: mapLocations.eecs, position_in: CGPointMake(157.5, 305), size_in: 12),
    mapMarker(mapLocation_in: mapLocations.eecs, position_in: CGPointMake(157.5, 282), size_in: 12),
    mapMarker(mapLocation_in: mapLocations.eecs, position_in: CGPointMake(157.5, 259), size_in: 12),
    mapMarker(mapLocation_in: mapLocations.eecs, position_in: CGPointMake(157.5, 236), size_in: 12),
    mapMarker(mapLocation_in: mapLocations.eecs, position_in: CGPointMake(157.5, 186), size_in: 12),
    mapMarker(mapLocation_in: mapLocations.eecs, position_in: CGPointMake(157.5, 163), size_in: 12),
    mapMarker(mapLocation_in: mapLocations.eecs, position_in: CGPointMake(157.5, 140), size_in: 12),
    mapMarker(mapLocation_in: mapLocations.eecs, position_in: CGPointMake(157.5, 118), size_in: 12),
    mapMarker(mapLocation_in: mapLocations.eecs, position_in: CGPointMake(157.5, 95), size_in: 12),
    mapMarker(mapLocation_in: mapLocations.eecs, position_in: CGPointMake(195.5, 118), size_in: 12),
    mapMarker(mapLocation_in: mapLocations.eecs, position_in: CGPointMake(195.5, 140), size_in: 12),
    mapMarker(mapLocation_in: mapLocations.eecs, position_in: CGPointMake(195.5, 163), size_in: 12),
    mapMarker(mapLocation_in: mapLocations.eecs, position_in: CGPointMake(195.5, 186), size_in: 12),
    mapMarker(mapLocation_in: mapLocations.eecs, position_in: CGPointMake(195.5, 236), size_in: 12),
    mapMarker(mapLocation_in: mapLocations.eecs, position_in: CGPointMake(195.5, 259), size_in: 12),
    mapMarker(mapLocation_in: mapLocations.eecs, position_in: CGPointMake(195.5, 282), size_in: 12),
    mapMarker(mapLocation_in: mapLocations.eecs, position_in: CGPointMake(191.75, 316), size_in: 12),
    mapMarker(mapLocation_in: mapLocations.eecs, position_in: CGPointMake(192.25, 338.5), size_in: 12),
    mapMarker(mapLocation_in: mapLocations.eecs, position_in: CGPointMake(195.5, 376), size_in: 12),
    mapMarker(mapLocation_in: mapLocations.eecs, position_in: CGPointMake(195.5, 399), size_in: 12),
    mapMarker(mapLocation_in: mapLocations.eecs, position_in: CGPointMake(195.5, 422), size_in: 12),
    mapMarker(mapLocation_in: mapLocations.eecs, position_in: CGPointMake(195.5, 460), size_in: 12),
    mapMarker(mapLocation_in: mapLocations.eecs, position_in: CGPointMake(195.5, 483), size_in: 12),
    mapMarker(mapLocation_in: mapLocations.eecs, position_in: CGPointMake(195.5, 539), size_in: 12),
    mapMarker(mapLocation_in: mapLocations.eecs, position_in: CGPointMake(195.5, 567), size_in: 12),
    mapMarker(mapLocation_in: mapLocations.eecs, position_in: CGPointMake(195.5, 592), size_in: 12)
]

var mapMarkersBbb = [mapMarker]()

var mapMarkersGGbrown = [mapMarker]()

var mapMarkersFxb = [mapMarker]()

var mapMarkersPierpont = [mapMarker]()
