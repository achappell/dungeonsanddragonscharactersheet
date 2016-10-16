//
//  RaceTests.swift
//  DungeonsDragonsCC
//
//  Created by Amanda Chappell on 10/15/16.
//  Copyright © 2016 AmplifiedProjects. All rights reserved.
//

import XCTest
import MagicalRecord
@testable import DungeonsDragonsCC

class RaceTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testRaceFetch() {
        MagicalRecord.save(blockAndWait: { (context) in
            Race.mr_truncateAll()
            Race.mr_createEntity()
        })

        XCTAssertTrue(Race.allRacesFetchedResultsController().fetchedObjects?.count == 1)
    }
}
