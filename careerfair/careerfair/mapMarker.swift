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

var mapMarkersDude: [mapMarker] = [
    mapMarker(mapLocation_in: mapLocations.dow, position_in: CGPointMake(89.75, 340), size_in: 10),
    mapMarker(mapLocation_in: mapLocations.dow, position_in: CGPointMake(89.75, 320), size_in: 10),
    mapMarker(mapLocation_in: mapLocations.dow, position_in: CGPointMake(89.75, 300), size_in: 10),
    mapMarker(mapLocation_in: mapLocations.dow, position_in: CGPointMake(89.75, 279), size_in: 10),
    mapMarker(mapLocation_in: mapLocations.dow, position_in: CGPointMake(127, 112), size_in: 10),
    mapMarker(mapLocation_in: mapLocations.dow, position_in: CGPointMake(139.75, 98.75), size_in: 10),
    mapMarker(mapLocation_in: mapLocations.dow, position_in: CGPointMake(152, 86), size_in: 10),
    mapMarker(mapLocation_in: mapLocations.dow, position_in: CGPointMake(165, 73), size_in: 10),
    mapMarker(mapLocation_in: mapLocations.dow, position_in: CGPointMake(177.75, 60.25), size_in: 10),
    mapMarker(mapLocation_in: mapLocations.dow, position_in: CGPointMake(190.25, 47.75), size_in: 10),
    mapMarker(mapLocation_in: mapLocations.dow, position_in: CGPointMake(203, 35), size_in: 10),
    mapMarker(mapLocation_in: mapLocations.dow, position_in: CGPointMake(219, 437), size_in: 10),
    mapMarker(mapLocation_in: mapLocations.dow, position_in: CGPointMake(206, 424.25), size_in: 10),
    mapMarker(mapLocation_in: mapLocations.dow, position_in: CGPointMake(193.5, 411), size_in: 10),
    mapMarker(mapLocation_in: mapLocations.dow, position_in: CGPointMake(178, 397), size_in: 10),
    mapMarker(mapLocation_in: mapLocations.dow, position_in: CGPointMake(164, 382.5), size_in: 10),
    mapMarker(mapLocation_in: mapLocations.dow, position_in: CGPointMake(149, 368), size_in: 10),
    mapMarker(mapLocation_in: mapLocations.dow, position_in: CGPointMake(144, 346), size_in: 10),
    mapMarker(mapLocation_in: mapLocations.dow, position_in: CGPointMake(144, 330.5), size_in: 10),
    mapMarker(mapLocation_in: mapLocations.dow, position_in: CGPointMake(144, 311.5), size_in: 10),
    mapMarker(mapLocation_in: mapLocations.dow, position_in: CGPointMake(144, 294.5), size_in: 10),
    mapMarker(mapLocation_in: mapLocations.dow, position_in: CGPointMake(144, 277.5), size_in: 10),
    mapMarker(mapLocation_in: mapLocations.dow, position_in: CGPointMake(256, 229.5), size_in: 10),//CC1
    mapMarker(mapLocation_in: mapLocations.dow, position_in: CGPointMake(270, 215), size_in: 10),
    mapMarker(mapLocation_in: mapLocations.dow, position_in: CGPointMake(285.5, 215), size_in: 10),
    mapMarker(mapLocation_in: mapLocations.dow, position_in: CGPointMake(300, 229.5), size_in: 10),
    mapMarker(mapLocation_in: mapLocations.dow, position_in: CGPointMake(300, 245), size_in: 10),
    mapMarker(mapLocation_in: mapLocations.dow, position_in: CGPointMake(285.5, 259), size_in: 10),
    mapMarker(mapLocation_in: mapLocations.dow, position_in: CGPointMake(270, 259), size_in: 10),
    mapMarker(mapLocation_in: mapLocations.dow, position_in: CGPointMake(256, 245), size_in: 10),
]

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
    mapMarker(mapLocation_in: mapLocations.eecs, position_in: CGPointMake(146.5, 543.75), size_in: 12),
    mapMarker(mapLocation_in: mapLocations.eecs, position_in: CGPointMake(146.5, 522.5), size_in: 12),
    mapMarker(mapLocation_in: mapLocations.eecs, position_in: CGPointMake(146.5, 437), size_in: 12),
    mapMarker(mapLocation_in: mapLocations.eecs, position_in: CGPointMake(146.5, 415), size_in: 12),
    mapMarker(mapLocation_in: mapLocations.eecs, position_in: CGPointMake(146.5, 394), size_in: 12),
    mapMarker(mapLocation_in: mapLocations.eecs, position_in: CGPointMake(146.5, 372.25), size_in: 12),
    mapMarker(mapLocation_in: mapLocations.eecs, position_in: CGPointMake(146.5, 351), size_in: 12),
    mapMarker(mapLocation_in: mapLocations.eecs, position_in: CGPointMake(146.5, 284), size_in: 12),
    mapMarker(mapLocation_in: mapLocations.eecs, position_in: CGPointMake(146.5, 263), size_in: 12),
    mapMarker(mapLocation_in: mapLocations.eecs, position_in: CGPointMake(146.5, 241), size_in: 12),
    mapMarker(mapLocation_in: mapLocations.eecs, position_in: CGPointMake(146.5, 220), size_in: 12),
    mapMarker(mapLocation_in: mapLocations.eecs, position_in: CGPointMake(146.5, 174), size_in: 12),
    mapMarker(mapLocation_in: mapLocations.eecs, position_in: CGPointMake(146.5, 152.75), size_in: 12),
    mapMarker(mapLocation_in: mapLocations.eecs, position_in: CGPointMake(146.5, 131), size_in: 12),
    mapMarker(mapLocation_in: mapLocations.eecs, position_in: CGPointMake(146.5, 109.25), size_in: 12),
    mapMarker(mapLocation_in: mapLocations.eecs, position_in: CGPointMake(146.5, 88), size_in: 12),
    mapMarker(mapLocation_in: mapLocations.eecs, position_in: CGPointMake(182.25, 110), size_in: 12),
    mapMarker(mapLocation_in: mapLocations.eecs, position_in: CGPointMake(182.25, 131), size_in: 12),
    mapMarker(mapLocation_in: mapLocations.eecs, position_in: CGPointMake(182.25, 153), size_in: 12),
    mapMarker(mapLocation_in: mapLocations.eecs, position_in: CGPointMake(182.25, 174), size_in: 12),
    mapMarker(mapLocation_in: mapLocations.eecs, position_in: CGPointMake(182, 220.5), size_in: 12),
    mapMarker(mapLocation_in: mapLocations.eecs, position_in: CGPointMake(182, 241.5), size_in: 12),
    mapMarker(mapLocation_in: mapLocations.eecs, position_in: CGPointMake(182, 263.25), size_in: 12),//
    mapMarker(mapLocation_in: mapLocations.eecs, position_in: CGPointMake(178.75, 294.5), size_in: 12),//
    mapMarker(mapLocation_in: mapLocations.eecs, position_in: CGPointMake(179.25, 316.5), size_in: 12),
    mapMarker(mapLocation_in: mapLocations.eecs, position_in: CGPointMake(182, 352), size_in: 12),
    mapMarker(mapLocation_in: mapLocations.eecs, position_in: CGPointMake(182, 373), size_in: 12),///////////
    mapMarker(mapLocation_in: mapLocations.eecs, position_in: CGPointMake(182, 393.75), size_in: 12),//6
    mapMarker(mapLocation_in: mapLocations.eecs, position_in: CGPointMake(182, 429.75), size_in: 12),//5
    mapMarker(mapLocation_in: mapLocations.eecs, position_in: CGPointMake(182, 451), size_in: 12),
    mapMarker(mapLocation_in: mapLocations.eecs, position_in: CGPointMake(182.25, 502.75), size_in: 12),
    mapMarker(mapLocation_in: mapLocations.eecs, position_in: CGPointMake(182.25, 528.25), size_in: 12),
    mapMarker(mapLocation_in: mapLocations.eecs, position_in: CGPointMake(182.25, 553), size_in: 12)
]

var mapMarkersBbb: [mapMarker] = [
    mapMarker(mapLocation_in: mapLocations.eecs, position_in: CGPointMake(53, 321), size_in: 12),//1
    mapMarker(mapLocation_in: mapLocations.eecs, position_in: CGPointMake(77, 260), size_in: 12),
    mapMarker(mapLocation_in: mapLocations.eecs, position_in: CGPointMake(77, 221), size_in: 12),//3
    mapMarker(mapLocation_in: mapLocations.eecs, position_in: CGPointMake(77.25, 182), size_in: 12),
    mapMarker(mapLocation_in: mapLocations.eecs, position_in: CGPointMake(77.25, 143), size_in: 12),//5
    mapMarker(mapLocation_in: mapLocations.eecs, position_in: CGPointMake(93.5, 95.5), size_in: 12),
    mapMarker(mapLocation_in: mapLocations.eecs, position_in: CGPointMake(141, 95.5), size_in: 12),//7
    mapMarker(mapLocation_in: mapLocations.eecs, position_in: CGPointMake(145, 142), size_in: 12),
    mapMarker(mapLocation_in: mapLocations.eecs, position_in: CGPointMake(145, 182), size_in: 12),//9
    mapMarker(mapLocation_in: mapLocations.eecs, position_in: CGPointMake(145, 217.5), size_in: 12),
    mapMarker(mapLocation_in: mapLocations.eecs, position_in: CGPointMake(152, 238.25), size_in: 12),//11
    mapMarker(mapLocation_in: mapLocations.eecs, position_in: CGPointMake(190, 239.25), size_in: 12),
    mapMarker(mapLocation_in: mapLocations.eecs, position_in: CGPointMake(199, 210.5), size_in: 12),//13
    mapMarker(mapLocation_in: mapLocations.eecs, position_in: CGPointMake(199.5, 180), size_in: 12),
    mapMarker(mapLocation_in: mapLocations.eecs, position_in: CGPointMake(217.5, 96), size_in: 12),//15
    mapMarker(mapLocation_in: mapLocations.eecs, position_in: CGPointMake(279, 96), size_in: 12),
    mapMarker(mapLocation_in: mapLocations.eecs, position_in: CGPointMake(308.5, 115.5), size_in: 12),//17
    mapMarker(mapLocation_in: mapLocations.eecs, position_in: CGPointMake(334, 115.5), size_in: 12),
    mapMarker(mapLocation_in: mapLocations.eecs, position_in: CGPointMake(363, 115.5), size_in: 12),//19
    mapMarker(mapLocation_in: mapLocations.eecs, position_in: CGPointMake(387, 115.5), size_in: 12),
    mapMarker(mapLocation_in: mapLocations.eecs, position_in: CGPointMake(247.5, 271), size_in: 12),//21
    mapMarker(mapLocation_in: mapLocations.eecs, position_in: CGPointMake(247.5, 300), size_in: 12),
    mapMarker(mapLocation_in: mapLocations.eecs, position_in: CGPointMake(235, 321), size_in: 12),//23
    mapMarker(mapLocation_in: mapLocations.eecs, position_in: CGPointMake(202, 321), size_in: 12),
    mapMarker(mapLocation_in: mapLocations.eecs, position_in: CGPointMake(163, 321), size_in: 12), // 53
]

var mapMarkersGGbrown: [mapMarker] = [
    mapMarker(mapLocation_in: mapLocations.eecs, position_in: CGPointMake(86.5, 110), size_in: 12),//1
    mapMarker(mapLocation_in: mapLocations.eecs, position_in: CGPointMake(117.5, 110), size_in: 12),
    mapMarker(mapLocation_in: mapLocations.eecs, position_in: CGPointMake(148.5, 110), size_in: 12),//3
    mapMarker(mapLocation_in: mapLocations.eecs, position_in: CGPointMake(179.5, 110), size_in: 12),
    mapMarker(mapLocation_in: mapLocations.eecs, position_in: CGPointMake(210.5, 110), size_in: 12),//5
    mapMarker(mapLocation_in: mapLocations.eecs, position_in: CGPointMake(240.75, 110), size_in: 12),
    mapMarker(mapLocation_in: mapLocations.eecs, position_in: CGPointMake(271.5, 110), size_in: 12),//7
    mapMarker(mapLocation_in: mapLocations.eecs, position_in: CGPointMake(302.5, 110), size_in: 12),
    mapMarker(mapLocation_in: mapLocations.eecs, position_in: CGPointMake(333, 110), size_in: 12),//9
    mapMarker(mapLocation_in: mapLocations.eecs, position_in: CGPointMake(364.5, 110), size_in: 12)
]

var mapMarkersFxb: [mapMarker] = [
    mapMarker(mapLocation_in: mapLocations.eecs, position_in: CGPointMake(96, 83), size_in: 12),//1
    mapMarker(mapLocation_in: mapLocations.eecs, position_in: CGPointMake(140, 82), size_in: 12),
    mapMarker(mapLocation_in: mapLocations.eecs, position_in: CGPointMake(166.75, 81.5), size_in: 12),//3
    mapMarker(mapLocation_in: mapLocations.eecs, position_in: CGPointMake(214, 80.25), size_in: 12),
    mapMarker(mapLocation_in: mapLocations.eecs, position_in: CGPointMake(239, 80.25), size_in: 12),//5
    mapMarker(mapLocation_in: mapLocations.eecs, position_in: CGPointMake(296.25, 83), size_in: 12),
    mapMarker(mapLocation_in: mapLocations.eecs, position_in: CGPointMake(105, 166), size_in: 12),//7
    mapMarker(mapLocation_in: mapLocations.eecs, position_in: CGPointMake(133, 166), size_in: 12),
    mapMarker(mapLocation_in: mapLocations.eecs, position_in: CGPointMake(161.5, 166), size_in: 12),//9
    mapMarker(mapLocation_in: mapLocations.eecs, position_in: CGPointMake(222, 166), size_in: 12),
    mapMarker(mapLocation_in: mapLocations.eecs, position_in: CGPointMake(250.5, 166), size_in: 12),//11
    mapMarker(mapLocation_in: mapLocations.eecs, position_in: CGPointMake(279.75, 166), size_in: 12),
    mapMarker(mapLocation_in: mapLocations.eecs, position_in: CGPointMake(315.75, 165), size_in: 12),//13
    mapMarker(mapLocation_in: mapLocations.eecs, position_in: CGPointMake(357.25, 166.5), size_in: 12),
]

var mapMarkersPierpont: [mapMarker] = [
    mapMarker(mapLocation_in: mapLocations.eecs, position_in: CGPointMake(49.5, 53), size_in: 12),//1
    mapMarker(mapLocation_in: mapLocations.eecs, position_in: CGPointMake(74.5, 53), size_in: 12),
    mapMarker(mapLocation_in: mapLocations.eecs, position_in: CGPointMake(130.25, 81), size_in: 12),//3
    mapMarker(mapLocation_in: mapLocations.eecs, position_in: CGPointMake(130.25, 106), size_in: 12),
    mapMarker(mapLocation_in: mapLocations.eecs, position_in: CGPointMake(130.25, 129), size_in: 12),//5
    mapMarker(mapLocation_in: mapLocations.eecs, position_in: CGPointMake(130.25, 190), size_in: 12),
    mapMarker(mapLocation_in: mapLocations.eecs, position_in: CGPointMake(130.25, 214.5), size_in: 12),//7
    mapMarker(mapLocation_in: mapLocations.eecs, position_in: CGPointMake(130.25, 240), size_in: 12),
    mapMarker(mapLocation_in: mapLocations.eecs, position_in: CGPointMake(130.25, 265), size_in: 12),//9
    mapMarker(mapLocation_in: mapLocations.eecs, position_in: CGPointMake(130.25, 290.25), size_in: 12),
    
    mapMarker(mapLocation_in: mapLocations.eecs, position_in: CGPointMake(100, 367.5), size_in: 12),//11
    mapMarker(mapLocation_in: mapLocations.eecs, position_in: CGPointMake(100, 392.5), size_in: 12),
    mapMarker(mapLocation_in: mapLocations.eecs, position_in: CGPointMake(100, 417.25), size_in: 12),//13
    mapMarker(mapLocation_in: mapLocations.eecs, position_in: CGPointMake(100, 442), size_in: 12),
    
    mapMarker(mapLocation_in: mapLocations.eecs, position_in: CGPointMake(157.25, 423), size_in: 12),//15
    mapMarker(mapLocation_in: mapLocations.eecs, position_in: CGPointMake(182.5, 423), size_in: 12),
    mapMarker(mapLocation_in: mapLocations.eecs, position_in: CGPointMake(213, 423), size_in: 12),//17
    mapMarker(mapLocation_in: mapLocations.eecs, position_in: CGPointMake(240.5, 423), size_in: 12),
    mapMarker(mapLocation_in: mapLocations.eecs, position_in: CGPointMake(267.75, 423), size_in: 12),//19
    
    mapMarker(mapLocation_in: mapLocations.eecs, position_in: CGPointMake(130.25, 315.75), size_in: 12),
    mapMarker(mapLocation_in: mapLocations.eecs, position_in: CGPointMake(130.25, 340.75), size_in: 12),//21
]

