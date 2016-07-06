//
//  Trait+FEMMapping.swift
//  DungeonsDragonsCC
//
//  Created by Amanda Chappell on 3/5/16.
//  Copyright © 2016 AmplifiedProjects. All rights reserved.
//

import Foundation
import MagicalRecord
import FastEasyMapping

extension Trait: FEMMapped {
    
    class func mapping() -> FEMMapping {
        
        let mapping = FEMMapping(entityName: Trait.mr_entityName())
        mapping.addAttributes(from: ["value","originalText","type", "name"])
        
        return mapping
    }
    
}
