//
//  announcements.swift
//  careerfair
//
//  Created by Alexander Roberts on 6/10/16.
//  Copyright © 2016 AlexRobertsKatePanter. All rights reserved.
//

import Foundation

var announcements = [Announcement]()

class Announcement {
    var information:String;
    var title:String;
    
    init(information_in:String, title_in:String) {
        information = information_in;
        title = title_in;
    }
    
    init() {
        information = ""
        title = ""
    }
}