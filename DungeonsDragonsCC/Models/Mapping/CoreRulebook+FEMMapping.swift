//
//  CoreRulebook+FEMMapping.swift
//  DungeonsDragonsCC
//
//  Created by Amanda Chappell on 3/4/16.
//  Copyright © 2016 AmplifiedProjects. All rights reserved.
//

import Foundation
import FastEasyMapping
import MagicalRecord

extension CoreRulebook: FEMMapped {
    
    class func mapping() -> FEMMapping {
        
        let mapping = FEMMapping(entityName: CoreRulebook.mr_entityName())
        
        mapping.add(toManyRelationshipMapping: Skill.mapping(), forProperty: "skills", keyPath: "coreRulebook.skills")
        mapping.add(toManyRelationshipMapping: Race.mapping(), forProperty: "races", keyPath: "coreRulebook.races")
        
        return mapping
    }

}
