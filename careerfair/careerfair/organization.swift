//
//  organization.swift
//  careerfair
//
//  Created by Alexander Roberts on 7/27/15.
//  Copyright (c) 2015 AlexRobertsKatePanter. All rights reserved.
//

import Foundation

class organization {
    var title: String;
    var desc: String;
    
    init() {
        title = "one";
        desc = "two";
    }
    
    init(fromTitle title_in: String, desc_in: String) {
        title = title_in;
        desc = desc_in;
    }
}
