//
//  Race+FEMMapping.swift
//  DungeonsDragonsCC
//
//  Created by Amanda Chappell on 3/4/16.
//  Copyright © 2016 AmplifiedProjects. All rights reserved.
//

import Foundation
import FastEasyMapping
import MagicalRecord

extension Race: FEMMapped {
    
    class func mapping() -> FEMMapping {
        
        let mapping = FEMMapping(entityName: Race.MR_entityName())
        mapping.addAttributesFromArray(["name","physicalDescription","adventures","alignmentAndReligion","relations","society"])
        
            mapping.addToManyRelationshipMapping(AbilityScore.mapping(), forProperty: "scoreModifiers", keyPath: "scoreModifiers")
            mapping.addToManyRelationshipMapping(Modifier.mapping(), forProperty: "modifiers", keyPath: "modifiers")
        
        return mapping
    }
    
}

