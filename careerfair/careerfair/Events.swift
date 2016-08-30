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
    var startTime:NSDate;
    var endTime:NSDate;
    var location:String;
    var title:String;
    var information:String;
    var interested:Bool;
    var eventId:Int;
    
    init(fromTitle title_in:String, date_in:NSDate, end_in:NSDate, location_in:String, information_in:String, interested_in:Bool, eventId_in:Int) {
        startTime = date_in;
        endTime = end_in;
        location = location_in;
        title = title_in;
        information = information_in;
        interested = interested_in;
        eventId = eventId_in;
    }
    
    init() {
        startTime = NSDate();
        endTime = NSDate();
        location = "";
        title = "";
        information = "";
        interested = false
        eventId = -1;
    }
}