//
//  Race+CoreDataProperties.swift
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
extension Race {

    @NSManaged var adventures: String
    @NSManaged var alignmentAndReligion: String
    @NSManaged var name: String
    @NSManaged var physicalDescription: String
    @NSManaged var relations: String
    @NSManaged var society: String
    @NSManaged var coreRulebook: CoreRulebook?
    @NSManaged var scoreModifiers: NSOrderedSet
    @NSManaged var traits: NSOrderedSet
    @NSManaged var modifiers: NSOrderedSet

}
// codebeat:enable[TOO_MANY_IVARS]
