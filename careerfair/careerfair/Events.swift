//
//  Events.swift
//  careerfair
//
//  Created by Roberts, Alexander on 9/16/15.
//  Copyright (c) 2015 AlexRobertsKatePanter. All rights reserved.
//

import Foundation

class Event {
    var date:String;
    var location:String;
    var time:String;
    var title:String;
    var information:String;
    
    init(fromTitle title_in:String, date_in:String, location_in:String, time_in:String, information_in:String) {
        date = date_in;
        location = location_in;
        time = time_in;
        title = title_in;
        information = information_in;
    }
    
    init() {
        date = "";
        location = "";
        time = "";
        title = "";
        information = "";
    }
}