//
//  CoreRulebookCoordinator.swift
//  DungeonsDragonsCC
//
//  Created by Amanda Chappell on 3/4/16.
//  Copyright © 2016 AmplifiedProjects. All rights reserved.
//

import Foundation

class CoreRulebookCoordinator {
    
    let jsonURL : NSURL?
    lazy var coreRulebookDictionary : [String:AnyObject]? = {
        
        if let jsonURL = self.coreRulebookJSONURL, jsonPath = jsonURL.path {
            do {
            let jsonData = try NSData(contentsOfFile: jsonPath, options: NSDataReadingOptions.DataReadingMappedIfSafe)
                if let jsonObject = try NSJSONSerialization.JSONObjectWithData(jsonData, options: NSJSONReadingOptions.AllowFragments) as? [String: AnyObject] {
                    return jsonObject
                }
            }
            catch {
                
            }
        }
        
        return nil
    }()
    lazy var coreRulebookJSONURL : NSURL? = {
        if let jsonURL = self.jsonURL {
            return jsonURL
        }
        if let jsonURL = NSBundle.mainBundle().URLForResource("corerulebook", withExtension: "json") {
            return jsonURL
        }
        return nil
    }()
    
    init(jsonURL: NSURL?) {
        self.jsonURL = jsonURL
    }

    func isCoreRulebookUpToDate() -> Bool {
        return currentVersion() >= latestVersion()
    }
    
    func currentVersion() -> Int {
        return NSUserDefaults.standardUserDefaults().integerForKey("CoreRulebookVersion")
    }
    
    func latestVersion() -> Int {
        if let coreRulebookDictionary = coreRulebookDictionary, version = coreRulebookDictionary["version"] {
            return version.integerValue
        }
        return 0
    }
    
    func migrateToLatestCoreRulebook() -> Bool {
        
        
        
        return false
    }
}