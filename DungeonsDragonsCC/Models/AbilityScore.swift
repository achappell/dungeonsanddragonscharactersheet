//
//  AbilityScore.swift
//  
//
//  Created by Amanda Chappell on 3/2/16.
//
//

import Foundation
import CoreData

@objc enum AbilityType : Int16 {
    case strength
    case dexterity
    case constitution
    case intelligence
    case wisdom
    case charisma
}

@objc(AbilityScore)
class AbilityScore: NSManagedObject {

    class func insertItemWithBaseScore(_ baseScore: Int16, type: AbilityType) -> AbilityScore {
        
        let abilityScore = AbilityScore.mr_createEntity()!
        abilityScore.baseScore = baseScore
        abilityScore.type = type.rawValue
    
        return abilityScore
    }

}
