//
//  CharacterHelper.swift
//  DungeonsDragonsCC
//
//  Created by Amanda Chappell on 3/4/16.
//  Copyright © 2016 AmplifiedProjects. All rights reserved.
//
@testable import DungeonsDragonsCC

struct CharacterHelper {
    static var testCharacter : DungeonsDragonsCC.Character {
        let strengthScore = AbilityScore.insertItemWithBaseScore(10, type: .Strength)
        strengthScore.abilityModifier = 1
        strengthScore.tempAdjustment = 2
        strengthScore.tempModifier = 3
        
        let dexterityScore = AbilityScore.insertItemWithBaseScore(10, type: .Dexterity)
        dexterityScore.abilityModifier = 1
        dexterityScore.tempAdjustment = 2
        dexterityScore.tempModifier = 3
        
        let constitutionScore = AbilityScore.insertItemWithBaseScore(10, type: .Constitution)
        constitutionScore.abilityModifier = 1
        constitutionScore.tempAdjustment = 2
        constitutionScore.tempModifier = 3
        
        let intelligenceScore = AbilityScore.insertItemWithBaseScore(10, type: .Intelligence)
        intelligenceScore.abilityModifier = 1
        intelligenceScore.tempAdjustment = 2
        intelligenceScore.tempModifier = 3
        
        let wisdomScore = AbilityScore.insertItemWithBaseScore(10, type: .Wisdom)
        wisdomScore.abilityModifier = 1
        wisdomScore.tempAdjustment = 2
        wisdomScore.tempModifier = 3
        
        let charismaScore = AbilityScore.insertItemWithBaseScore(10, type: .Charisma)
        charismaScore.abilityModifier = 1
        charismaScore.tempAdjustment = 2
        charismaScore.tempModifier = 3
        
        let character = Character.insertItemWithAbilityScores([strengthScore, dexterityScore, constitutionScore, intelligenceScore, wisdomScore, charismaScore])
        
        return character
    }
}
