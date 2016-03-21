//
//  Skill+FEMMapping.swift
//  DungeonsDragonsCC
//
//  Created by Amanda Chappell on 3/5/16.
//  Copyright © 2016 AmplifiedProjects. All rights reserved.
//

import Foundation
import MagicalRecord
import FastEasyMapping

extension Skill: FEMMapped {
    
    class func mapping() -> FEMMapping {
        
        let mapping = FEMMapping(entityName: Skill.MR_entityName())
        mapping.addAttributesFromArray(["action","originalText","check", "name", "keyAbility", "restriction", "special", "trainedOnly", "tryAgain", "tryAgainOriginalText","untrained"])
        
        return mapping
    }
    
}
