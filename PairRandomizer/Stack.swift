//
//  Stack.swift
//  PairRandomizer
//
//  Created by Austin Hesterly on 9/6/16.
//  Copyright © 2016 Austin Hesterly. All rights reserved.
//
//  Stack Class comes from https://gist.github.com/calebhicks/404165bdb6bc77502026

import Foundation
import CoreData

class Stack {
    
    static let sharedStack = Stack()
    
    lazy var managedObjectContext: NSManagedObjectContext = Stack.setUpMainContext()
    
    static func setUpMainContext() -> NSManagedObjectContext {
        let bundle = NSBundle.mainBundle()
        guard let model = NSManagedObjectModel.mergedModelFromBundles([bundle])
            else { fatalError("model not found") }
        let psc = NSPersistentStoreCoordinator(managedObjectModel: model)
        try! psc.addPersistentStoreWithType(NSSQLiteStoreType, configuration: nil,
                                            URL: storeURL(), options: [NSMigratePersistentStoresAutomaticallyOption: true,
                                                NSInferMappingModelAutomaticallyOption: true])
        let context = NSManagedObjectContext(
            concurrencyType: .MainQueueConcurrencyType)
        context.persistentStoreCoordinator = psc
        return context
    }
    
    static func storeURL () -> NSURL? {
        let documentsDirectory: NSURL? = try? NSFileManager.defaultManager().URLForDirectory(NSSearchPathDirectory.DocumentDirectory, inDomain: NSSearchPathDomainMask.UserDomainMask, appropriateForURL: nil, create: true)
        
        return documentsDirectory?.URLByAppendingPathComponent("db.sqlite")
    }
    
    //Not necessary in every controller, not copied from Caleb's gist, rather is from class
    static func saveToPersistentStore() -> Bool {
        do {
            _ = try Stack.sharedStack.managedObjectContext.save()
            return true
        } catch {
            print(error)
            return false
        }
    }
}