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

    class func allRacesFetchedResultsController() -> NSFetchedResultsController<NSFetchRequestResult> {
        return Race.mr_fetchAllSorted(by: "name", ascending: true, with: nil, groupBy: nil, delegate: nil)
    }

}
