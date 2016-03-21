//
//  Skill+CoreDataProperties.swift
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

extension Skill {

    @NSManaged var name: String
    @NSManaged var originalText: String?
    @NSManaged var check: String?
    @NSManaged var action: String?
    @NSManaged var tryAgain: Bool
    @NSManaged var tryAgainOriginalText: String?
    @NSManaged var special: String?
    @NSManaged var restriction: String?
    @NSManaged var trainedOnly: Bool
    @NSManaged var untrained: String?
    @NSManaged var keyAbility: Int16
    @NSManaged var modifier: Modifier?
    @NSManaged var coreRulebook: CoreRulebook?

}
