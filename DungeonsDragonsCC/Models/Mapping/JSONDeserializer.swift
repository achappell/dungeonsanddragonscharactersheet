//
//  JSONDeserializer.swift
//  DungeonsDragonsCC
//
//  Created by Amanda Chappell on 3/4/16.
//  Copyright © 2016 AmplifiedProjects. All rights reserved.
//

import Foundation
import FastEasyMapping
import MagicalRecord

struct JSONDeserializer {
    func objectFromData<T: FEMMapped>(_ data: Data, classType: T.Type) -> T? {
        do {
            if let JSONDict = try JSONSerialization.jsonObject(with: data, options: JSONSerialization.ReadingOptions.allowFragments) as? [String:AnyObject] {
                return objectFromDictionary(JSONDict, classType: classType)
            }
            
            return objectFromDictionary([:], classType: classType)
        } catch {
            
        }
        
        return nil
    }
    
    func objectFromDictionary<T: FEMMapped>(_ dictionary: [String:AnyObject], classType: T.Type) -> T? {
        let object = FEMDeserializer.object(fromRepresentation: dictionary, mapping: classType.mapping(), context: NSManagedObjectContext.mr_default())
        
        return object as? T
    }
}
