//
//  Race.swift
//  
//
//  Created by Amanda Chappell on 3/5/16.
//
//

import Foundation
import CoreData
import MagicalRecord

@objc(Race)
class Race: NSManagedObject {

    class func allRacesFetchedResultsController() -> NSFetchedResultsController {
        return Race.MR_fetchAllSortedBy("name", ascending: true, withPredicate: nil, groupBy: nil, delegate: nil)
    }

}
