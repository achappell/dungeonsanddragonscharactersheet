//
//  Modifier+CoreDataProperties.swift
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

extension Modifier {

    @NSManaged var circumstance: String
    @NSManaged var originalText: String
    @NSManaged var type: String
    @NSManaged var value: Int16
    @NSManaged var name: String
    @NSManaged var skill: Skill?
    @NSManaged var race: Race?

}
