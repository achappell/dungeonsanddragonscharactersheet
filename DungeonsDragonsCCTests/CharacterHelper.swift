//
//  CharacterHelper.swift
//  DungeonsDragonsCC
//
//  Created by Amanda Chappell on 3/4/16.
//  Copyright © 2016 AmplifiedProjects. All rights reserved.
//
@testable import DungeonsDragonsCC

struct CharacterHelper {
    static var testCharacter: DungeonsDragonsCC.Character {
        let strengthScore = AbilityScore.insertItem(baseScoreInt: 10, type: .strength)
        strengthScore.abilityModifier = 1
        strengthScore.tempAdjustment = 2
        strengthScore.tempModifier = 3

        let dexterityScore = AbilityScore.insertItem(baseScoreInt: 10, type: .dexterity)
        dexterityScore.abilityModifier = 1
        dexterityScore.tempAdjustment = 2
        dexterityScore.tempModifier = 3

        let constitutionScore = AbilityScore.insertItem(baseScoreInt: 10, type: .constitution)
        constitutionScore.abilityModifier = 1
        constitutionScore.tempAdjustment = 2
        constitutionScore.tempModifier = 3

        let intelligenceScore = AbilityScore.insertItem(baseScoreInt: 10, type: .intelligence)
        intelligenceScore.abilityModifier = 1
        intelligenceScore.tempAdjustment = 2
        intelligenceScore.tempModifier = 3

        let wisdomScore = AbilityScore.insertItem(baseScoreInt: 10, type: .wisdom)
        wisdomScore.abilityModifier = 1
        wisdomScore.tempAdjustment = 2
        wisdomScore.tempModifier = 3

        let charismaScore = AbilityScore.insertItem(baseScoreInt: 10, type: .charisma)
        charismaScore.abilityModifier = 1
        charismaScore.tempAdjustment = 2
        charismaScore.tempModifier = 3

        let character = Character.insertItemWithAbilityScores([strengthScore, dexterityScore, constitutionScore, intelligenceScore, wisdomScore, charismaScore])

        return character
    }
}
