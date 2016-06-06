//
//  ErrorHandler.swift
//  careerfair
//
//  Created by Roberts, Alexander on 9/17/15.
//  Copyright (c) 2015 AlexRobertsKatePanter. All rights reserved.
//

import Foundation

func handleError(details:String, error:NSErrorPointer) {
    print("Error: " + error.debugDescription);
    print("Details: " + details);
    return;
}