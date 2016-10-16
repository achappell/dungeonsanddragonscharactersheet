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

    class func insertItemWithAbilityScores(_ abilityScores: NSOrderedSet) -> Character {

        let character = Character.mr_createEntity()!

        character.baseAbilityScores = abilityScores

        return character
    }

    class func allCharactersFetchedResultsController() -> NSFetchedResultsController<NSFetchRequestResult> {
        return Character.mr_fetchAllSorted(by: "name", ascending: true, with: nil, groupBy: nil, delegate: nil)
    }

    class func selectedCharacter() -> Character? {
        return Character.mr_findFirst(with: NSPredicate(format: "selected=1"))
    }

    class func setSelectedCharacter(_ character: Character) {
        MagicalRecord.save(blockAndWait: { (context) -> Void in
            if let selectedCharacters = Character.mr_findAll(with: NSPredicate(format: "selected == 1")) as? [Character] {
                for selectedCharacter in selectedCharacters {
                    selectedCharacter.selected = false
                }
            }

            character.selected = true
        })
    }

    class func characterWithName(_ name: String) -> Character? {
        return Character.mr_findFirst(byAttribute: "name", withValue: name)
    }

    func abilityScoreOfType(_ abilityType: AbilityType) -> AbilityScore {
        if let abilityScores = baseAbilityScores.array as? [AbilityScore] {
            for abilityScore in abilityScores {
                if abilityScore.type == abilityType.rawValue {
                    return abilityScore
                }
            }
        }

        let defaultAbilityScore = AbilityScore.mr_createEntity()!
        defaultAbilityScore.baseScore = 10
        defaultAbilityScore.type = abilityType.rawValue
        return defaultAbilityScore
    }

    func strength() -> AbilityScore {
        return abilityScoreOfType(.strength)
    }

    func dexterity() -> AbilityScore {
        return abilityScoreOfType(.dexterity)
    }

    func constitution() -> AbilityScore {
        return abilityScoreOfType(.constitution)
    }

    func intelligence() -> AbilityScore {
        return abilityScoreOfType(.intelligence)
    }

    func wisdom() -> AbilityScore {
        return abilityScoreOfType(.wisdom)
    }

    func charisma() -> AbilityScore {
        return abilityScoreOfType(.charisma)
    }

}
