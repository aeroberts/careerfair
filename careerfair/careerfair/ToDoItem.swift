//
//  ToDoItem.swift
//  careerfair
//
//  Created by Alex Roberts on 8/17/16.
//  Copyright © 2016 AlexRobertsKatePanter. All rights reserved.
//

import Foundation

var toDoItems = [ToDoItem]();

class ToDoItem {
    var startHours:Int;
    var startMinutes:Int;
    var endHours:Int;
    var endMinutes:Int;
    var startDate:NSDate;
    var title:String;
    var isOrg:Bool;
    var id:Int;
    
    init(fromOrg org:organization) {
        isOrg = true;
        title = org.title;
        id = org.orgId;
        
        // Determine date
        startDate = org.date;
        
        // Set times
        startHours = 10;
        startMinutes = 0;
        endHours = 4;
        endMinutes = 0;
    }
    
    init(fromEvent event:Event) {
        isOrg = false;
        title = event.title;
        id = event.eventId;
        
        startDate = event.startTime;
        
        let calendar = NSCalendar.currentCalendar()
        let startComponents = calendar.components([.Minute, .Hour], fromDate: event.startTime);
        let endComponents = calendar.components([.Minute, .Hour], fromDate: event.endTime);
        
        startHours = startComponents.hour;
        startMinutes = startComponents.minute;
        endHours = endComponents.hour;
        endMinutes = endComponents.minute;
        
    }
}