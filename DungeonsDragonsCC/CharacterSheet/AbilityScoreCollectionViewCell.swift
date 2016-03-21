//
//  AbilityScoreCollectionViewCell.swift
//  DungeonsDragonsCC
//
//  Created by Amanda Chappell on 3/3/16.
//  Copyright © 2016 AmplifiedProjects. All rights reserved.
//

import UIKit
import Foundation

class AbilityScoreCollectionViewCell: UICollectionViewCell {

    @IBOutlet var strengthLabel: ScoreLabel!
    @IBOutlet var dexterityLabel: ScoreLabel!
    @IBOutlet var constitutionLabel: ScoreLabel!
    @IBOutlet var intelligenceLabel: ScoreLabel!
    @IBOutlet var wisdomLabel: ScoreLabel!
    @IBOutlet var charismaLabel: ScoreLabel!
    
    @IBOutlet var strengthModLabel: ScoreLabel!
    @IBOutlet var dexterityModLabel: ScoreLabel!
    @IBOutlet var constitutionModLabel: ScoreLabel!
    @IBOutlet var intelligenceModLabel: ScoreLabel!
    @IBOutlet var wisdomModLabel: ScoreLabel!
    @IBOutlet var charismaModLabel: ScoreLabel!
    
    @IBOutlet var strengthTempAdjLabel: ScoreLabel!
    @IBOutlet var dexterityTempAdjLabel: ScoreLabel!
    @IBOutlet var constitutionTempAdjLabel: ScoreLabel!
    @IBOutlet var intelligenceTempAdjLabel: ScoreLabel!
    @IBOutlet var wisdomTempAdjLabel: ScoreLabel!
    @IBOutlet var charismaTempAdjLabel: ScoreLabel!
    
    @IBOutlet var strengthTempModLabel: ScoreLabel!
    @IBOutlet var dexterityTempModLabel: ScoreLabel!
    @IBOutlet var constitutionTempModLabel: ScoreLabel!
    @IBOutlet var intelligenceTempModLabel: ScoreLabel!
    @IBOutlet var wisdomTempModLabel: ScoreLabel!
    @IBOutlet var charismaTempModLabel: ScoreLabel!
    
    var character : Character? {
        didSet {
            
            if let character = self.character {
                strengthLabel.text = String(format: "%\(2)d", character.strength().baseScore)
                dexterityLabel.text = String(format: "%\(2)d", character.dexterity().baseScore)
                constitutionLabel.text = String(format: "%\(2)d", character.constitution().baseScore)
                intelligenceLabel.text = String(format: "%\(2)d", character.intelligence().baseScore)
                wisdomLabel.text = String(format: "%\(2)d", character.wisdom().baseScore)
                charismaLabel.text = String(format: "%\(2)d", character.charisma().baseScore)
                
                strengthModLabel.text = String(format: "%\(2)d", character.strength().abilityModifier)
                dexterityModLabel.text = String(format: "%\(2)d", character.dexterity().abilityModifier)
                constitutionModLabel.text = String(format: "%\(2)d", character.constitution().abilityModifier)
                intelligenceModLabel.text = String(format: "%\(2)d", character.intelligence().abilityModifier)
                wisdomModLabel.text = String(format: "%\(2)d", character.wisdom().abilityModifier)
                charismaModLabel.text = String(format: "%\(2)d", character.charisma().abilityModifier)
                
                strengthTempAdjLabel.text = String(format: "%\(2)d", character.strength().tempAdjustment)
                dexterityTempAdjLabel.text = String(format: "%\(2)d", character.dexterity().tempAdjustment)
                constitutionTempAdjLabel.text = String(format: "%\(2)d", character.constitution().tempAdjustment)
                intelligenceTempAdjLabel.text = String(format: "%\(2)d", character.intelligence().tempAdjustment)
                wisdomTempAdjLabel.text = String(format: "%\(2)d", character.wisdom().tempAdjustment)
                charismaTempAdjLabel.text = String(format: "%\(2)d", character.charisma().tempAdjustment)
                
                strengthTempModLabel.text = String(format: "%\(2)d", character.strength().tempModifier)
                dexterityTempModLabel.text = String(format: "%\(2)d", character.dexterity().tempModifier)
                constitutionTempModLabel.text = String(format: "%\(2)d", character.constitution().tempModifier)
                intelligenceTempModLabel.text = String(format: "%\(2)d", character.intelligence().tempModifier)
                wisdomTempModLabel.text = String(format: "%\(2)d", character.wisdom().tempModifier)
                charismaTempModLabel.text = String(format: "%\(2)d", character.charisma().tempModifier)
            }
        }
    }
    
}
