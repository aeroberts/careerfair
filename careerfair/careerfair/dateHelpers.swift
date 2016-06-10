//
//  dateHelpers.swift
//  careerfair
//
//  Created by Alexander Roberts on 6/10/16.
//  Copyright © 2016 AlexRobertsKatePanter. All rights reserved.
//

import Foundation

func makeDate(day_in:Int, month_in:Int, year_in:Int, hour_in:Int, minute_in:Int) -> NSDate {
    let calendar = NSCalendar.currentCalendar()
    let components = NSDateComponents()
    components.day = day_in
    components.month = month_in
    components.year = year_in
    components.hour = hour_in
    components.minute = minute_in
    return calendar.dateFromComponents(components)!
}

func dateToString(date_in:NSDate) -> String {
    let formatter = NSDateFormatter()
    formatter.dateFormat = "EEEE, MMMM d"
    return formatter.stringFromDate(date_in)
}

func dateToStringWithTime(date_in:NSDate) -> String {
    let formatter = NSDateFormatter()
    formatter.dateFormat = "EEEE, MMMM d, h:mm a"
    return formatter.stringFromDate(date_in)
}