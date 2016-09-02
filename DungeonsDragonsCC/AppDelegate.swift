//
//  AppDelegate.swift
//  DungeonsDragonsCC
//
//  Created by Amanda Chappell on 3/3/16.
//  Copyright © 2016 AmplifiedProjects. All rights reserved.
//

import UIKit
import CoreData
import MagicalRecord

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey : Any]? = nil) -> Bool {
        // Override point for customization after application launch.
        
        MagicalRecord.setupCoreDataStack()
        
        let coreRulebookCoordinator = CoreRulebookCoordinator(jsonURL: nil)
        let success = coreRulebookCoordinator.migrateToLatestCoreRulebook()
        
        return success
    }
}

