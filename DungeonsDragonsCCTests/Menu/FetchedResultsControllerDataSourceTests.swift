//
//  FetchedResultsControllerDataSourceTests.swift
//  DungeonsDragonsCC
//
//  Created by Amanda Chappell on 3/4/16.
//  Copyright © 2016 AmplifiedProjects. All rights reserved.
//

import XCTest
import CoreData
@testable import DungeonsDragonsCC

class FetchedResultsControllerDataSourceTests: XCTestCase {
    
    var fetchedResultsControllerDataSource : FetchedResultsControllerDataSource!
    var tableview = UITableView(frame: CGRectMake(0, 0, 300, 300))

    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
        fetchedResultsControllerDataSource = FetchedResultsControllerDataSource(tableView: tableview, fetchedResultsController: Character.allCharactersFetchedResultsController(), reuseIdentifier: "Cell")
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
        fetchedResultsControllerDataSource = nil
    }
    
    func testSetPausedTrue() {
        fetchedResultsControllerDataSource.paused = true
        
        XCTAssertNil(fetchedResultsControllerDataSource.fetchedResultsController.delegate)
    }
    
    func testSetPausedFalse() {
        fetchedResultsControllerDataSource.paused = false
        
        XCTAssertNotNil(fetchedResultsControllerDataSource.fetchedResultsController.delegate!)
    }
    
    func testCanEditRows() {
        XCTAssertTrue(fetchedResultsControllerDataSource.tableView(fetchedResultsControllerDataSource.tableView!, canEditRowAtIndexPath: NSIndexPath(forRow: 0, inSection: 0)))
    }
}
