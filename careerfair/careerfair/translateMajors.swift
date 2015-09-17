//
//  translateMajors.swift
//  careerfair
//
//  Created by Roberts, Alexander on 9/16/15.
//  Copyright (c) 2015 AlexRobertsKatePanter. All rights reserved.
//

import Foundation

func convertMajorsArrayToBinaryArray(mArray:[Bool]) -> Int {
    var bArray:Int = 0;
    for majorB in mArray {
        if (majorB) {
            bArray = bArray & 1;
            bArray = bArray << 1;
        }
    }

    return bArray;
}

func convertBinaryArrayToMajorsArray(bArray: Int) -> [Bool] {
    var mArray = Array(count: 16, repeatedValue: false);
    
    for (var i = 0; i < 16; i++) {
        var res = bArray & 1;
        if (res > 0) {
            mArray[i] = true;
        }
        bArray >> 1;
    }
    
    return mArray;
}