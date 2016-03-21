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
    func objectFromData<T: FEMMapped>(data: NSData, classType: T.Type) -> T? {
        do {
            let JSONDict = try NSJSONSerialization.JSONObjectWithData(data, options: NSJSONReadingOptions.AllowFragments) as! [String:AnyObject]
            
            return objectFromDictionary(JSONDict, classType: classType)
        } catch {
            
        }
        
        return nil
    }
    
    func objectFromDictionary<T: FEMMapped>(dictionary: [String:AnyObject], classType: T.Type) -> T? {
        let object = FEMDeserializer.objectFromRepresentation(dictionary, mapping: classType.mapping(), context: NSManagedObjectContext.MR_defaultContext())
        
        return object as? T
    }
}
