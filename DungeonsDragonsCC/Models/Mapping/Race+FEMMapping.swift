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
        
        let mapping = FEMMapping(entityName: Race.mr_entityName())
        mapping.addAttributes(from: ["name","physicalDescription","adventures","alignmentAndReligion","relations","society"])
        
            mapping.add(toManyRelationshipMapping: AbilityScore.mapping(), forProperty: "scoreModifiers", keyPath: "scoreModifiers")
            mapping.add(toManyRelationshipMapping: Modifier.mapping(), forProperty: "modifiers", keyPath: "modifiers")
        
        return mapping
    }
    
}

