//
//  StudjectController.swift
//  PairRandomizer
//
//  Created by Austin Hesterly on 9/6/16.
//  Copyright © 2016 Austin Hesterly. All rights reserved.
//

import Foundation
import CoreData

class SubjectController {
    
    //Create
    static func createSubject() -> Subject {
        let newSubject = NSEntityDescription.insertNewObjectForEntityForName(Subject.className, inManagedObjectContext: Stack.sharedStack.managedObjectContext) as! Subject
        
        return newSubject
    }
    
    
    //Read
    static func allSubjects() -> [Subject] {
        let fetchRequest = NSFetchRequest(entityName: Subject.className)
        
        let sortDescriptor = NSSortDescriptor(key: "name", ascending: true, selector: #selector(NSString.localizedStandardCompare(_:)))
        
        fetchRequest.sortDescriptors = [sortDescriptor]
        
        
        do {
            let subjectArray = try Stack.sharedStack.managedObjectContext.executeFetchRequest(fetchRequest) as? [Subject]
            
            return subjectArray ?? [Subject]()
        } catch {
            print(error)
            return [Subject]()
        }
    }
    
    //Update
    //Save with Stack class
    
    //Delete
    static func deleteSubject(subjectToDelete: Subject) {
        subjectToDelete.managedObjectContext?.deleteObject(subjectToDelete)
    }
}