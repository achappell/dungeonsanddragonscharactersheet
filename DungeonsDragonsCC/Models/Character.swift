//
//  Character.swift
//  
//
//  Created by Amanda Chappell on 3/2/16.
//
//

import Foundation
import CoreData
import MagicalRecord

@objc(Character)
class Character: NSManagedObject {

    class func insertItemWithAbilityScores(abilityScores: NSOrderedSet) -> Character {
        
        let character = Character.MR_createEntity()!
        
        character.baseAbilityScores = abilityScores
        
        return character
    }
    
    class func allCharactersFetchedResultsController() -> NSFetchedResultsController {
        return Character.MR_fetchAllSortedBy("name", ascending: true, withPredicate: nil, groupBy: nil, delegate: nil)
    }
    
    class func selectedCharacterFetchedResultsController(delegate: NSFetchedResultsControllerDelegate) -> NSFetchedResultsController {
        return Character.MR_fetchAllGroupedBy(nil, withPredicate: NSPredicate(format: "selected=1"), sortedBy: nil, ascending: true, delegate: delegate)
    }
    
    class func setSelectedCharacter(character: Character) {
        MagicalRecord.saveWithBlockAndWait { (context) -> Void in
            if let selectedCharacters = Character.MR_findAllWithPredicate(NSPredicate(format: "selected ==1")) as! [Character]? {
                for selectedCharacter in selectedCharacters {
                    selectedCharacter.selected = false
                }
            }
            
            character.selected = true
        }
    }
    
    class func characterWithName(name: String) -> Character? {
        return Character.MR_findFirstByAttribute("name", withValue: name)
    }
    
    func abilityScoreOfType(abilityType: AbilityType) -> AbilityScore {
        for abilityScore in baseAbilityScores.array as! [AbilityScore] {
            if abilityScore.type == abilityType.rawValue {
                return abilityScore
            }
        }
        
        let defaultAbilityScore = AbilityScore.MR_createEntity()!
        defaultAbilityScore.baseScore = 10
        defaultAbilityScore.type = abilityType.rawValue
        return defaultAbilityScore
    }
    
    func strength() -> AbilityScore {
        return abilityScoreOfType(.Strength)
    }
    
    func dexterity() -> AbilityScore {
        return abilityScoreOfType(.Dexterity)
    }
    
    func constitution() -> AbilityScore {
        return abilityScoreOfType(.Constitution)
    }
    
    func intelligence() -> AbilityScore {
        return abilityScoreOfType(.Intelligence)
    }
    
    func wisdom() -> AbilityScore {
        return abilityScoreOfType(.Wisdom)
    }
    
    func charisma() -> AbilityScore {
        return abilityScoreOfType(.Charisma)
    }

}
