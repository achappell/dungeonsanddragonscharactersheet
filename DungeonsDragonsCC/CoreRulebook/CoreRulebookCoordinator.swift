//
//  CoreRulebookCoordinator.swift
//  DungeonsDragonsCC
//
//  Created by Amanda Chappell on 3/4/16.
//  Copyright © 2016 AmplifiedProjects. All rights reserved.
//

import Foundation

class CoreRulebookCoordinator {
    
    let jsonURL : URL?
    lazy var coreRulebookDictionary : [String:AnyObject]? = {
        
        if let jsonURL = self.coreRulebookJSONURL, jsonPath = jsonURL.path {
            do {
            let jsonData = try Data(contentsOf: URL(fileURLWithPath: jsonPath), options: NSData.ReadingOptions.dataReadingMappedIfSafe)
                if let jsonObject = try JSONSerialization.jsonObject(with: jsonData, options: JSONSerialization.ReadingOptions.allowFragments) as? [String: AnyObject] {
                    return jsonObject
                }
            }
            catch {
                
            }
        }
        
        return nil
    }()
    lazy var coreRulebookJSONURL : URL? = {
        if let jsonURL = self.jsonURL {
            return jsonURL
        }
        if let jsonURL = Bundle.main().urlForResource("corerulebook", withExtension: "json") {
            return jsonURL
        }
        return nil
    }()
    
    init(jsonURL: URL?) {
        self.jsonURL = jsonURL
    }

    func isCoreRulebookUpToDate() -> Bool {
        return currentVersion() >= latestVersion()
    }
    
    func currentVersion() -> Int {
        return UserDefaults.standard().integer(forKey: "CoreRulebookVersion")
    }
    
    func latestVersion() -> Int {
        if let coreRulebookDictionary = coreRulebookDictionary, version = coreRulebookDictionary["version"] {
            return version.intValue
        }
        return 0
    }
    
    func migrateToLatestCoreRulebook() -> Bool {
        
        let deserializer = JSONDeserializer()
        
        if let coreRulebookDictionary = coreRulebookDictionary {
            CoreRulebook.mr_truncateAll()
            
            let coreRulebook = deserializer.objectFromDictionary(coreRulebookDictionary, classType: CoreRulebook.self)
            coreRulebook?.managedObjectContext?.mr_save({ (context) in
                
            })
        }
        
        
        return false
    }
}
