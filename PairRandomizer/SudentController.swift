//
//  SudentController.swift
//  PairRandomizer
//
//  Created by Austin Hesterly on 9/6/16.
//  Copyright © 2016 Austin Hesterly. All rights reserved.
//

import Foundation
import CoreData

class StudentController {
    
    //Create
    static func createStudent(subject: Subject) -> Student {
        let newStudent = NSEntityDescription.insertNewObjectForEntityForName(Student.className, inManagedObjectContext: Stack.sharedStack.managedObjectContext) as! Student
        
        newStudent.subject = subject
        
        return newStudent
    }
    
    //Read
    //We are accessing student through our subject instances and its core data relationship.
    
    //Update
    //Save from Stack class
    
    //Delete
    static func deleteStudent(studentToDelete: Student) {
        studentToDelete.managedObjectContext?.deleteObject(studentToDelete)
    }
}