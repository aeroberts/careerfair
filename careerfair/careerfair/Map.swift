//
//  Map.swift
//  careerfair
//
//  Created by Alexander Roberts on 7/30/15.
//  Copyright (c) 2015 AlexRobertsKatePanter. All rights reserved.
//

import Foundation

public class orgAVLTree {
    var key: organization?
    var left: orgAVLTree?
    var right: orgAVLTree?
    
    init() { key = nil; left = nil; right = nil }
    
    //add item based on its value
    func addNode(key: organization) {
        
        //check for the head node
        if (self.key == nil) {
            self.key = key
            return
        }
        
        //check the left side of the tree
        if (key.title < self.key!.title) {
            if (self.left != nil) {
                left!.addNode(key)
            }
            else { //create a new left node
                var leftChild : orgAVLTree = orgAVLTree()
                leftChild.key = key
                self.left = leftChild
            }
        } //end if
        
        //check the right side of the tree
        if (key.title > self.key!.title) {
            if (self.right != nil) {
                right!.addNode(key)
            }
            else { //create a new right node
                var rightChild : orgAVLTree = orgAVLTree()
                rightChild.key = key
                self.right = rightChild
            }
        } //end if 
    } //end function 
}