//
//  NotedOrganizations.swift
//  careerfair
//
//  Created by Roberts, Alexander on 9/16/15.
//  Copyright (c) 2015 AlexRobertsKatePanter. All rights reserved.
//

import Foundation
import CoreData

@objc(NotedOrganizations)
class NotedOrganizations: NSManagedObject {

    @NSManaged var orgId: NSNumber
    @NSManaged var note: String

}
