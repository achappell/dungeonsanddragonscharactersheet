//
//  AbilityScore+FEMMapping.swift
//  DungeonsDragonsCC
//
//  Created by Amanda Chappell on 3/5/16.
//  Copyright © 2016 AmplifiedProjects. All rights reserved.
//

import Foundation
import MagicalRecord
import FastEasyMapping

extension AbilityScore: FEMMapped {
    
    class func mapping() -> FEMMapping {
        
        let mapping = FEMMapping(entityName: AbilityScore.MR_entityName())
        mapping.addAttributesFromArray(["abilityModifier","baseScore","tempAdjustment","tempModifier","type"])
        
        return mapping
    }
    
}
