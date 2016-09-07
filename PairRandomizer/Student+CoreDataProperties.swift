//
//  Student+CoreDataProperties.swift
//  PairRandomizer
//
//  Created by Austin Hesterly on 9/6/16.
//  Copyright © 2016 Austin Hesterly. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

import Foundation
import CoreData

extension Student {

    @NSManaged var name: String?
    @NSManaged var identifier: String?
    @NSManaged var subject: NSManagedObject?

}
