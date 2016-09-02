//
//  Character+CoreDataProperties.swift
//  
//
//  Created by Amanda Chappell on 3/5/16.
//
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

import Foundation
import CoreData

// codebeat:disable[TOO_MANY_IVARS]
extension Character {

    @NSManaged var age: Int16
    @NSManaged var alignment: String
    @NSManaged var gender: String
    @NSManaged var name: String
    @NSManaged var selected: Bool
    @NSManaged var baseAbilityScores: NSOrderedSet

}
// codebeat:enable[TOO_MANY_IVARS]
