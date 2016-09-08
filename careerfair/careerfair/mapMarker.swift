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
    mapMarker(mapLocation_in: mapLocations.dow, position_in: CGPointMake(0.16, 0.132), size_in: 12),//1
    mapMarker(mapLocation_in: mapLocations.dow, position_in: CGPointMake(0.43, 0.132), size_in: 12),
    mapMarker(mapLocation_in: mapLocations.dow, position_in: CGPointMake(0.55, 0.132), size_in: 12),//3
    mapMarker(mapLocation_in: mapLocations.dow, position_in: CGPointMake(1.47, 0.132), size_in: 12),
    mapMarker(mapLocation_in: mapLocations.dow, position_in: CGPointMake(1.59, 0.132), size_in: 12),//5
    mapMarker(mapLocation_in: mapLocations.dow, position_in: CGPointMake(0.82, 0.237), size_in: 12),
    mapMarker(mapLocation_in: mapLocations.dow, position_in: CGPointMake(0.94, 0.237), size_in: 12),//7
    mapMarker(mapLocation_in: mapLocations.dow, position_in: CGPointMake(1.05, 0.237), size_in: 12),
    mapMarker(mapLocation_in: mapLocations.dow, position_in: CGPointMake(1.162, 0.237), size_in: 12),//9
    mapMarker(mapLocation_in: mapLocations.dow, position_in: CGPointMake(0.237, 0.228), size_in: 12)
]

var mapMarkersDude: [mapMarker] = [
    mapMarker(mapLocation_in: mapLocations.dow, position_in: CGPointMake(0.183, 0.82), size_in: 12),
    mapMarker(mapLocation_in: mapLocations.dow, position_in: CGPointMake(0.183, 0.771), size_in: 12),
    mapMarker(mapLocation_in: mapLocations.dow, position_in: CGPointMake(0.183, 0.721), size_in: 12),
    mapMarker(mapLocation_in: mapLocations.dow, position_in: CGPointMake(0.183, 0.671), size_in: 12),
    mapMarker(mapLocation_in: mapLocations.dow, position_in: CGPointMake(0.260, 0.267), size_in: 12),//5
    mapMarker(mapLocation_in: mapLocations.dow, position_in: CGPointMake(0.285, 0.235), size_in: 12),
    mapMarker(mapLocation_in: mapLocations.dow, position_in: CGPointMake(0.311, 0.205), size_in: 12),//7
    mapMarker(mapLocation_in: mapLocations.dow, position_in: CGPointMake(0.337, 0.175), size_in: 12),
    mapMarker(mapLocation_in: mapLocations.dow, position_in: CGPointMake(0.364, 0.144), size_in: 12),//9
    mapMarker(mapLocation_in: mapLocations.dow, position_in: CGPointMake(0.39, 0.114), size_in: 12),
    mapMarker(mapLocation_in: mapLocations.dow, position_in: CGPointMake(0.417, 0.083), size_in: 12),//11
    
    mapMarker(mapLocation_in: mapLocations.dow, position_in: CGPointMake(0.451, 1.054), size_in: 12),
    mapMarker(mapLocation_in: mapLocations.dow, position_in: CGPointMake(0.424, 1.02), size_in: 12),//13
    mapMarker(mapLocation_in: mapLocations.dow, position_in: CGPointMake(0.398, 0.99), size_in: 12),
    mapMarker(mapLocation_in: mapLocations.dow, position_in: CGPointMake(0.366, 0.954), size_in: 12),//15
    mapMarker(mapLocation_in: mapLocations.dow, position_in: CGPointMake(0.338, 0.918), size_in: 12),
    mapMarker(mapLocation_in: mapLocations.dow, position_in: CGPointMake(0.3054, 0.884), size_in: 12),//17
    
    mapMarker(mapLocation_in: mapLocations.dow, position_in: CGPointMake(0.295, 0.832), size_in: 12),
    mapMarker(mapLocation_in: mapLocations.dow, position_in: CGPointMake(0.295, 0.794), size_in: 12),//19
    mapMarker(mapLocation_in: mapLocations.dow, position_in: CGPointMake(0.295, 0.750), size_in: 12),
    mapMarker(mapLocation_in: mapLocations.dow, position_in: CGPointMake(0.295, 0.709), size_in: 12),//21
    mapMarker(mapLocation_in: mapLocations.dow, position_in: CGPointMake(0.295, 0.669), size_in: 12),
    
    mapMarker(mapLocation_in: mapLocations.dow, position_in: CGPointMake(0.526, 0.55), size_in: 12),//CC1
    mapMarker(mapLocation_in: mapLocations.dow, position_in: CGPointMake(0.556, 0.514), size_in: 12),
    mapMarker(mapLocation_in: mapLocations.dow, position_in: CGPointMake(0.588, 0.514), size_in: 12),
    mapMarker(mapLocation_in: mapLocations.dow, position_in: CGPointMake(0.617, 0.55), size_in: 12),
    mapMarker(mapLocation_in: mapLocations.dow, position_in: CGPointMake(0.617, 0.588), size_in: 12),
    mapMarker(mapLocation_in: mapLocations.dow, position_in: CGPointMake(0.588, 0.619), size_in: 12),
    mapMarker(mapLocation_in: mapLocations.dow, position_in: CGPointMake(0.556, 0.619), size_in: 12),
    mapMarker(mapLocation_in: mapLocations.dow, position_in: CGPointMake(0.526, 0.588), size_in: 12),
]

var mapMarkersDudeConnector: [mapMarker] = [
    mapMarker(mapLocation_in: mapLocations.dudeConnector, position_in: CGPointMake(0.349, 0.119), size_in: 12),//1
    mapMarker(mapLocation_in: mapLocations.dudeConnector, position_in: CGPointMake(0.303, 0.119), size_in: 12),
    mapMarker(mapLocation_in: mapLocations.dudeConnector, position_in: CGPointMake(0.244, 0.136), size_in: 12),//3
    mapMarker(mapLocation_in: mapLocations.dudeConnector, position_in: CGPointMake(0.221, 0.193), size_in: 12),
    mapMarker(mapLocation_in: mapLocations.dudeConnector, position_in: CGPointMake(0.221, 0.248), size_in: 12),//5
    mapMarker(mapLocation_in: mapLocations.dudeConnector, position_in: CGPointMake(0.244, 0.313), size_in: 12),
    mapMarker(mapLocation_in: mapLocations.dudeConnector, position_in: CGPointMake(0.303, 0.326), size_in: 12),//7
    mapMarker(mapLocation_in: mapLocations.dudeConnector, position_in: CGPointMake(0.349, 0.326), size_in: 12),
    mapMarker(mapLocation_in: mapLocations.dudeConnector, position_in: CGPointMake(0.4, 0.248), size_in: 12),//9
    mapMarker(mapLocation_in: mapLocations.dudeConnector, position_in: CGPointMake(0.4, 0.189), size_in: 12),
    mapMarker(mapLocation_in: mapLocations.dudeConnector, position_in: CGPointMake(0.338, 0.202), size_in: 12),//11
    mapMarker(mapLocation_in: mapLocations.dudeConnector, position_in: CGPointMake(0.294, 0.202), size_in: 12),
    mapMarker(mapLocation_in: mapLocations.dudeConnector, position_in: CGPointMake(0.294, 0.249), size_in: 12),//13
    mapMarker(mapLocation_in: mapLocations.dudeConnector, position_in: CGPointMake(0.338, 0.249), size_in: 12),
    
    mapMarker(mapLocation_in: mapLocations.dudeConnector, position_in: CGPointMake(0.483, 0.164), size_in: 12),//1
    mapMarker(mapLocation_in: mapLocations.dudeConnector, position_in: CGPointMake(0.483, 0.22), size_in: 12),
    mapMarker(mapLocation_in: mapLocations.dudeConnector, position_in: CGPointMake(0.483, 0.27), size_in: 12),
    mapMarker(mapLocation_in: mapLocations.dudeConnector, position_in: CGPointMake(0.483, 0.401), size_in: 12),//1
    mapMarker(mapLocation_in: mapLocations.dudeConnector, position_in: CGPointMake(0.483, 0.455), size_in: 12),
    mapMarker(mapLocation_in: mapLocations.dudeConnector, position_in: CGPointMake(0.483, 0.508), size_in: 12),//3
    mapMarker(mapLocation_in: mapLocations.dudeConnector, position_in: CGPointMake(0.483, 0.562), size_in: 12),
    mapMarker(mapLocation_in: mapLocations.dudeConnector, position_in: CGPointMake(0.483, 0.616), size_in: 12),//5
    mapMarker(mapLocation_in: mapLocations.dudeConnector, position_in: CGPointMake(0.483, 0.667), size_in: 12),
    mapMarker(mapLocation_in: mapLocations.dudeConnector, position_in: CGPointMake(0.483, 0.720), size_in: 12),//7
    mapMarker(mapLocation_in: mapLocations.dudeConnector, position_in: CGPointMake(0.483, 0.772), size_in: 12),
    mapMarker(mapLocation_in: mapLocations.dudeConnector, position_in: CGPointMake(0.483, 0.826), size_in: 12),//9
    mapMarker(mapLocation_in: mapLocations.dudeConnector, position_in: CGPointMake(0.483, 0.878), size_in: 12)
]

var mapMarkersEecs: [mapMarker] = [
    mapMarker(mapLocation_in: mapLocations.eecs, position_in: CGPointMake(0.216, 1.401), size_in: 12),//1
    mapMarker(mapLocation_in: mapLocations.eecs, position_in: CGPointMake(0.216, 1.344), size_in: 12),
    mapMarker(mapLocation_in: mapLocations.eecs, position_in: CGPointMake(0.216, 1.125), size_in: 12),//3
    mapMarker(mapLocation_in: mapLocations.eecs, position_in: CGPointMake(0.216, 1.070), size_in: 12),
    mapMarker(mapLocation_in: mapLocations.eecs, position_in: CGPointMake(0.216, 1.015), size_in: 12),//5
    mapMarker(mapLocation_in: mapLocations.eecs, position_in: CGPointMake(0.216, 0.96), size_in: 12),
    mapMarker(mapLocation_in: mapLocations.eecs, position_in: CGPointMake(0.216, 0.905), size_in: 12),//7
    mapMarker(mapLocation_in: mapLocations.eecs, position_in: CGPointMake(0.216, 0.732), size_in: 12),
    mapMarker(mapLocation_in: mapLocations.eecs, position_in: CGPointMake(0.216, 0.677), size_in: 12),//9
    mapMarker(mapLocation_in: mapLocations.eecs, position_in: CGPointMake(0.216, 0.622), size_in: 12),
    mapMarker(mapLocation_in: mapLocations.eecs, position_in: CGPointMake(0.216, 0.567), size_in: 12),//11
    mapMarker(mapLocation_in: mapLocations.eecs, position_in: CGPointMake(0.216, 0.446), size_in: 12),
    mapMarker(mapLocation_in: mapLocations.eecs, position_in: CGPointMake(0.216, 0.391), size_in: 12),//13
    mapMarker(mapLocation_in: mapLocations.eecs, position_in: CGPointMake(0.216, 0.336), size_in: 12),
    mapMarker(mapLocation_in: mapLocations.eecs, position_in: CGPointMake(0.216, 0.281), size_in: 12),//15
    mapMarker(mapLocation_in: mapLocations.eecs, position_in: CGPointMake(0.216, 0.226), size_in: 12),
    mapMarker(mapLocation_in: mapLocations.eecs, position_in: CGPointMake(0.268, 0.281), size_in: 12),//17
    mapMarker(mapLocation_in: mapLocations.eecs, position_in: CGPointMake(0.268, 0.336), size_in: 12),
    mapMarker(mapLocation_in: mapLocations.eecs, position_in: CGPointMake(0.268, 0.391), size_in: 12),//19
    mapMarker(mapLocation_in: mapLocations.eecs, position_in: CGPointMake(0.268, 0.446), size_in: 12),
    mapMarker(mapLocation_in: mapLocations.eecs, position_in: CGPointMake(0.268, 0.567), size_in: 12),//21
    mapMarker(mapLocation_in: mapLocations.eecs, position_in: CGPointMake(0.268, 0.622), size_in: 12),
    mapMarker(mapLocation_in: mapLocations.eecs, position_in: CGPointMake(0.268, 0.677), size_in: 12),//23
    mapMarker(mapLocation_in: mapLocations.eecs, position_in: CGPointMake(0.262, 0.760), size_in: 12),
    mapMarker(mapLocation_in: mapLocations.eecs, position_in: CGPointMake(0.263, 0.815), size_in: 12),//25
    mapMarker(mapLocation_in: mapLocations.eecs, position_in: CGPointMake(0.268, 0.905), size_in: 12),
    mapMarker(mapLocation_in: mapLocations.eecs, position_in: CGPointMake(0.268, 0.96), size_in: 12),//27
    mapMarker(mapLocation_in: mapLocations.eecs, position_in: CGPointMake(0.268, 1.015), size_in: 12),
    mapMarker(mapLocation_in: mapLocations.eecs, position_in: CGPointMake(0.268, 1.11), size_in: 12),//29
    mapMarker(mapLocation_in: mapLocations.eecs, position_in: CGPointMake(0.268, 1.165), size_in: 12),
    mapMarker(mapLocation_in: mapLocations.eecs, position_in: CGPointMake(0.268, 1.3), size_in: 12),//31
    mapMarker(mapLocation_in: mapLocations.eecs, position_in: CGPointMake(0.268, 1.365), size_in: 12),
    mapMarker(mapLocation_in: mapLocations.eecs, position_in: CGPointMake(0.268, 1.429), size_in: 12)//33
]

var mapMarkersBbb: [mapMarker] = [
    mapMarker(mapLocation_in: mapLocations.eecs, position_in: CGPointMake(0.13, 0.77), size_in: 12),//1
    mapMarker(mapLocation_in: mapLocations.eecs, position_in: CGPointMake(0.187, 0.62), size_in: 12),
    mapMarker(mapLocation_in: mapLocations.eecs, position_in: CGPointMake(0.187, 0.53), size_in: 12),//3
    mapMarker(mapLocation_in: mapLocations.eecs, position_in: CGPointMake(0.187, 0.432), size_in: 12),
    mapMarker(mapLocation_in: mapLocations.eecs, position_in: CGPointMake(0.187, 0.344), size_in: 12),//5
    
    mapMarker(mapLocation_in: mapLocations.eecs, position_in: CGPointMake(0.229, 0.229), size_in: 12),
    mapMarker(mapLocation_in: mapLocations.eecs, position_in: CGPointMake(0.345, 0.229), size_in: 12),//7
    mapMarker(mapLocation_in: mapLocations.eecs, position_in: CGPointMake(0.355, 0.342), size_in: 12),
    mapMarker(mapLocation_in: mapLocations.eecs, position_in: CGPointMake(0.355, 0.433), size_in: 12),//9
    mapMarker(mapLocation_in: mapLocations.eecs, position_in: CGPointMake(0.355, 0.516), size_in: 12),
    
    mapMarker(mapLocation_in: mapLocations.eecs, position_in: CGPointMake(0.372, 0.572), size_in: 12),//11
    mapMarker(mapLocation_in: mapLocations.eecs, position_in: CGPointMake(0.465, 0.572), size_in: 12),
    mapMarker(mapLocation_in: mapLocations.eecs, position_in: CGPointMake(0.489, 0.505), size_in: 12),//13
    mapMarker(mapLocation_in: mapLocations.eecs, position_in: CGPointMake(0.489, 0.430), size_in: 12),
    mapMarker(mapLocation_in: mapLocations.eecs, position_in: CGPointMake(0.534, 0.229), size_in: 12),//15
    mapMarker(mapLocation_in: mapLocations.eecs, position_in: CGPointMake(0.686, 0.229), size_in: 12),
    
    mapMarker(mapLocation_in: mapLocations.eecs, position_in: CGPointMake(0.76, 0.276), size_in: 12),//17
    mapMarker(mapLocation_in: mapLocations.eecs, position_in: CGPointMake(0.82, 0.276), size_in: 12),
    mapMarker(mapLocation_in: mapLocations.eecs, position_in: CGPointMake(0.895, 0.276), size_in: 12),//19
    mapMarker(mapLocation_in: mapLocations.eecs, position_in: CGPointMake(0.955, 0.276), size_in: 12),
    
    mapMarker(mapLocation_in: mapLocations.eecs, position_in: CGPointMake(0.609, 0.645), size_in: 12),//21
    mapMarker(mapLocation_in: mapLocations.eecs, position_in: CGPointMake(0.609, 0.718), size_in: 12),
    mapMarker(mapLocation_in: mapLocations.eecs, position_in: CGPointMake(0.58, 0.77), size_in: 12),//23
    mapMarker(mapLocation_in: mapLocations.eecs, position_in: CGPointMake(0.492, 0.77), size_in: 12),
    mapMarker(mapLocation_in: mapLocations.eecs, position_in: CGPointMake(0.395, 0.77), size_in: 12), // 53
]

var mapMarkersGGbrown: [mapMarker] = [
    mapMarker(mapLocation_in: mapLocations.eecs, position_in: CGPointMake(0.412, 0.263), size_in: 12),//1
    mapMarker(mapLocation_in: mapLocations.eecs, position_in: CGPointMake(0.56, 0.263), size_in: 12),
    mapMarker(mapLocation_in: mapLocations.eecs, position_in: CGPointMake(0.71, 0.263), size_in: 12),//3
    mapMarker(mapLocation_in: mapLocations.eecs, position_in: CGPointMake(0.855, 0.263), size_in: 12),
    mapMarker(mapLocation_in: mapLocations.eecs, position_in: CGPointMake(1.005, 0.263), size_in: 12),//5
    mapMarker(mapLocation_in: mapLocations.eecs, position_in: CGPointMake(1.155, 0.263), size_in: 12),
    mapMarker(mapLocation_in: mapLocations.eecs, position_in: CGPointMake(1.30, 0.263), size_in: 12),//7
    mapMarker(mapLocation_in: mapLocations.eecs, position_in: CGPointMake(1.446, 0.263), size_in: 12),
    mapMarker(mapLocation_in: mapLocations.eecs, position_in: CGPointMake(1.598, 0.263), size_in: 12),//9
    mapMarker(mapLocation_in: mapLocations.eecs, position_in: CGPointMake(1.74, 0.263), size_in: 12)
]

var mapMarkersFxb: [mapMarker] = [
    mapMarker(mapLocation_in: mapLocations.eecs, position_in: CGPointMake(0.418, 0.2), size_in: 12),//1
    mapMarker(mapLocation_in: mapLocations.eecs, position_in: CGPointMake(0.610, 0.197), size_in: 12),
    mapMarker(mapLocation_in: mapLocations.eecs, position_in: CGPointMake(0.730, 0.195), size_in: 12),//3
    mapMarker(mapLocation_in: mapLocations.eecs, position_in: CGPointMake(0.938, 0.192), size_in: 12),
    mapMarker(mapLocation_in: mapLocations.eecs, position_in: CGPointMake(1.047, 0.192), size_in: 12),//5
    mapMarker(mapLocation_in: mapLocations.eecs, position_in: CGPointMake(1.29, 0.2), size_in: 12),
    
    mapMarker(mapLocation_in: mapLocations.eecs, position_in: CGPointMake(0.457, 0.401), size_in: 12),//7
    mapMarker(mapLocation_in: mapLocations.eecs, position_in: CGPointMake(0.577, 0.401), size_in: 12),
    mapMarker(mapLocation_in: mapLocations.eecs, position_in: CGPointMake(0.701, 0.401), size_in: 12),//9
    mapMarker(mapLocation_in: mapLocations.eecs, position_in: CGPointMake(0.968, 0.401), size_in: 12),
    mapMarker(mapLocation_in: mapLocations.eecs, position_in: CGPointMake(1.1, 0.401), size_in: 12),//11
    mapMarker(mapLocation_in: mapLocations.eecs, position_in: CGPointMake(1.22, 0.399), size_in: 12),
    mapMarker(mapLocation_in: mapLocations.eecs, position_in: CGPointMake(1.376, 0.398), size_in: 12),//13
    mapMarker(mapLocation_in: mapLocations.eecs, position_in: CGPointMake(1.566, 0.402), size_in: 12),
]

var mapMarkersPierpont: [mapMarker] = [
    mapMarker(mapLocation_in: mapLocations.eecs, position_in: CGPointMake(0.1, 0.128), size_in: 12),//1
    mapMarker(mapLocation_in: mapLocations.eecs, position_in: CGPointMake(0.153, 0.128), size_in: 12),
    mapMarker(mapLocation_in: mapLocations.eecs, position_in: CGPointMake(0.267, 0.192), size_in: 12),//3
    mapMarker(mapLocation_in: mapLocations.eecs, position_in: CGPointMake(0.267, 0.254), size_in: 12),
    mapMarker(mapLocation_in: mapLocations.eecs, position_in: CGPointMake(0.267, 0.311), size_in: 12),//5
    mapMarker(mapLocation_in: mapLocations.eecs, position_in: CGPointMake(0.267, 0.456), size_in: 12),
    mapMarker(mapLocation_in: mapLocations.eecs, position_in: CGPointMake(0.267, 0.516), size_in: 12),//7
    mapMarker(mapLocation_in: mapLocations.eecs, position_in: CGPointMake(0.267, 0.578), size_in: 12),
    mapMarker(mapLocation_in: mapLocations.eecs, position_in: CGPointMake(0.267, 0.64), size_in: 12),//9
    mapMarker(mapLocation_in: mapLocations.eecs, position_in: CGPointMake(0.267, 0.70), size_in: 12),
    
    mapMarker(mapLocation_in: mapLocations.eecs, position_in: CGPointMake(0.205, 0.885), size_in: 12),//11
    mapMarker(mapLocation_in: mapLocations.eecs, position_in: CGPointMake(0.205, 0.945), size_in: 12),
    mapMarker(mapLocation_in: mapLocations.eecs, position_in: CGPointMake(0.205, 1.005), size_in: 12),//13
    mapMarker(mapLocation_in: mapLocations.eecs, position_in: CGPointMake(0.205, 1.065), size_in: 12),
    
    mapMarker(mapLocation_in: mapLocations.eecs, position_in: CGPointMake(0.323, 1.02), size_in: 12),//15
    mapMarker(mapLocation_in: mapLocations.eecs, position_in: CGPointMake(0.375, 1.02), size_in: 12),
    mapMarker(mapLocation_in: mapLocations.eecs, position_in: CGPointMake(0.437, 1.02), size_in: 12),//17
    mapMarker(mapLocation_in: mapLocations.eecs, position_in: CGPointMake(0.494, 1.02), size_in: 12),
    mapMarker(mapLocation_in: mapLocations.eecs, position_in: CGPointMake(0.551, 1.02), size_in: 12),//19
    
    mapMarker(mapLocation_in: mapLocations.eecs, position_in: CGPointMake(0.267, 0.76), size_in: 12),
    mapMarker(mapLocation_in: mapLocations.eecs, position_in: CGPointMake(0.267, 0.82), size_in: 12),//21
]

var mapMarkersChryslerBasement: [mapMarker] = [
    mapMarker(mapLocation_in: mapLocations.eecs, position_in: CGPointMake(0.1, 0.128), size_in: 12),//1
]

