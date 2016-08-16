//
//  Events.swift
//  careerfair
//
//  Created by Roberts, Alexander on 9/16/15.
//  Copyright (c) 2015 AlexRobertsKatePanter. All rights reserved.
//

import Foundation

var eventIdsToPosition = [Int:Int]()
var events = [Event]()
var toDoEvents = Set<Int>();


class Event {
    var date:NSDate;
    var location:String;
    var title:String;
    var information:String;
    var interested:Bool;
    var eventId:Int;
    
    init(fromTitle title_in:String, date_in:NSDate, location_in:String, information_in:String, interested_in:Bool, eventId_in:Int) {
        date = date_in;
        location = location_in;
        title = title_in;
        information = information_in;
        interested = interested_in;
        eventId = eventId_in;
    }
    
    init() {
        date = NSDate();
        location = "";
        title = "";
        information = "";
        interested = false
        eventId = -1;
    }
}