//
//  CoreRulebook.swift
//  
//
//  Created by Amanda Chappell on 3/2/16.
//
//

import Foundation
import CoreData

@objc(CoreRulebook)
class CoreRulebook: NSManagedObject {

    class func coreRulebook() -> CoreRulebook? {
        return CoreRulebook.mr_findFirst()
    }

}
