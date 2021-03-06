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

    var character: Character? {
        didSet {

            if let character = self.character {

                configure([strengthLabel, strengthModLabel, strengthTempAdjLabel, strengthTempModLabel], with: character.strength())
                configure([dexterityLabel, dexterityModLabel, dexterityTempAdjLabel, dexterityTempModLabel], with: character.dexterity())
                configure([constitutionLabel, constitutionModLabel, constitutionTempAdjLabel, constitutionTempModLabel], with: character.constitution())
                configure([intelligenceLabel, intelligenceModLabel, intelligenceTempAdjLabel, intelligenceTempModLabel], with: character.intelligence())
                configure([wisdomLabel, wisdomModLabel, wisdomTempAdjLabel, wisdomTempModLabel], with: character.wisdom())
                configure([charismaLabel, charismaModLabel, charismaTempAdjLabel, charismaTempModLabel], with: character.charisma())
            }
        }
    }
    
    public override class func defaultIdentifier() -> String {
        return "AbilityScoreCollectionViewCell"
    }

    // labels should be [baseLabel, modLabel, temporaryAdjustmentLabel, temporaryModLabel]
    func configure(_ labels: [UILabel], with abilityScore: AbilityScore) {
        if labels.count > 3 {
            labels[0].text = String(format: "%\(2)d", abilityScore.baseScore)
            labels[1].text = String(format: "%\(2)d", abilityScore.abilityModifier)
            labels[2].text = String(format: "%\(2)d", abilityScore.tempAdjustment)
            labels[3].text = String(format: "%\(2)d", abilityScore.tempModifier)
        }
    }
}
