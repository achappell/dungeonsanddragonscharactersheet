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

    class func insertItem(baseScoreInt baseScore: Int16, type: AbilityType) -> AbilityScore {
        
        let abilityScore = AbilityScore.mr_createEntity()!
        abilityScore.baseScore = baseScore
        abilityScore.type = type.rawValue
    
        return abilityScore
    }
    
    class func insertItem(baseScoreString baseScore: String?, type: AbilityType) -> AbilityScore {
        if let baseScore = baseScore, let baseScoreInt = Int16(baseScore) {
            return self.insertItem(baseScoreInt: baseScoreInt, type: type)
        }
        return self.insertItem(baseScoreInt: Int16(0), type: type)
    }

}
