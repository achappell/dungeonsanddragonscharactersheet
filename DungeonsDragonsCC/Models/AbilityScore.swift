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
    case Strength
    case Dexterity
    case Constitution
    case Intelligence
    case Wisdom
    case Charisma
}

@objc(AbilityScore)
class AbilityScore: NSManagedObject {

    class func insertItemWithBaseScore(baseScore: Int16, type: AbilityType) -> AbilityScore {
        
        let abilityScore = AbilityScore.MR_createEntity()!
        abilityScore.baseScore = baseScore
        abilityScore.type = type.rawValue
    
        return abilityScore
    }

}
