//
//  Modifier+FEMMapping.swift
//  DungeonsDragonsCC
//
//  Created by Amanda Chappell on 3/5/16.
//  Copyright © 2016 AmplifiedProjects. All rights reserved.
//

import Foundation
import MagicalRecord
import FastEasyMapping

extension Modifier: FEMMapped {
    
    class func mapping() -> FEMMapping {
        
        let mapping = FEMMapping(entityName: Modifier.MR_entityName())
        mapping.addAttributesFromArray(["value","originalText","type","circumstance"])
        
        let attribute = FEMAttribute(property: "skill", keyPath: "skill", map: { (object) -> AnyObject? in
            
            if let skillKey = object as? String {
                return Skill.MR_findFirstByAttribute("name", withValue: skillKey)
            }
            
            return nil
            
            }, reverseMap: nil)
        
        mapping.addAttribute(attribute)
        
        return mapping
    }
    
}
