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

    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
        fetchedResultsControllerDataSource = FetchedResultsControllerDataSource(tableView: UITableView(), fetchedResultsController: NSFetchedResultsController(), reuseIdentifier: "Cell")
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
    
    func testInsertObject() {
        
        class TestTableView : UITableView {
            override func insertRowsAtIndexPaths(indexPaths: [NSIndexPath], withRowAnimation animation: UITableViewRowAnimation) {
                XCTAssertTrue(indexPaths.first!.row == 1)
            }
            override func moveRowAtIndexPath(indexPath: NSIndexPath, toIndexPath newIndexPath: NSIndexPath) {
                XCTAssertTrue(false)
            }
            override func deleteRowsAtIndexPaths(indexPaths: [NSIndexPath], withRowAnimation animation: UITableViewRowAnimation) {
                XCTAssertTrue(false)
            }
            override func reloadRowsAtIndexPaths(indexPaths: [NSIndexPath], withRowAnimation animation: UITableViewRowAnimation) {
                XCTAssertTrue(false)
            }
        }
        
        let tableView = TestTableView(frame:CGRectZero, style: .Grouped)
        
        fetchedResultsControllerDataSource = FetchedResultsControllerDataSource(tableView: tableView, fetchedResultsController: NSFetchedResultsController(), reuseIdentifier: "Cell")
        
        fetchedResultsControllerDataSource.controller(fetchedResultsControllerDataSource.fetchedResultsController, didChangeObject: "nil", atIndexPath: NSIndexPath(forRow: 0, inSection:0), forChangeType: .Insert, newIndexPath: NSIndexPath(forRow: 1, inSection: 0))
    }
    
    func testMoveObject() {
        
        class TestTableView : UITableView {
            override func insertRowsAtIndexPaths(indexPaths: [NSIndexPath], withRowAnimation animation: UITableViewRowAnimation) {
                XCTAssertTrue(false)
            }
            override func moveRowAtIndexPath(indexPath: NSIndexPath, toIndexPath newIndexPath: NSIndexPath) {
                XCTAssertTrue(indexPath.row == 0)
                XCTAssertTrue(newIndexPath.row == 1)
            }
            override func deleteRowsAtIndexPaths(indexPaths: [NSIndexPath], withRowAnimation animation: UITableViewRowAnimation) {
                XCTAssertTrue(false)
            }
            override func reloadRowsAtIndexPaths(indexPaths: [NSIndexPath], withRowAnimation animation: UITableViewRowAnimation) {
                XCTAssertTrue(false)
            }
        }
        
        let tableView = TestTableView(frame:CGRectZero, style: .Grouped)
        
        fetchedResultsControllerDataSource = FetchedResultsControllerDataSource(tableView: tableView, fetchedResultsController: NSFetchedResultsController(), reuseIdentifier: "Cell")
        
        fetchedResultsControllerDataSource.controller(fetchedResultsControllerDataSource.fetchedResultsController, didChangeObject: "nil", atIndexPath: NSIndexPath(forRow: 0, inSection:0), forChangeType: .Move, newIndexPath: NSIndexPath(forRow: 1, inSection: 0))
    }

    func testDeleteObject() {
        
        class TestTableView : UITableView {
            override func insertRowsAtIndexPaths(indexPaths: [NSIndexPath], withRowAnimation animation: UITableViewRowAnimation) {
                XCTAssertTrue(false)
            }
            override func moveRowAtIndexPath(indexPath: NSIndexPath, toIndexPath newIndexPath: NSIndexPath) {
                XCTAssertTrue(false)
            }
            override func deleteRowsAtIndexPaths(indexPaths: [NSIndexPath], withRowAnimation animation: UITableViewRowAnimation) {
                XCTAssertTrue(indexPaths.first!.row == 0)
            }
            override func reloadRowsAtIndexPaths(indexPaths: [NSIndexPath], withRowAnimation animation: UITableViewRowAnimation) {
                XCTAssertTrue(false)
            }
        }
        
        let tableView = TestTableView(frame:CGRectZero, style: .Grouped)
        
        fetchedResultsControllerDataSource = FetchedResultsControllerDataSource(tableView: tableView, fetchedResultsController: NSFetchedResultsController(), reuseIdentifier: "Cell")
        
        fetchedResultsControllerDataSource.controller(fetchedResultsControllerDataSource.fetchedResultsController, didChangeObject: "nil", atIndexPath: NSIndexPath(forRow: 0, inSection:0), forChangeType: .Delete, newIndexPath: NSIndexPath(forRow: 1, inSection: 0))
    }
    
    func testUpdateObject() {
        
        class TestTableView : UITableView {
            override func insertRowsAtIndexPaths(indexPaths: [NSIndexPath], withRowAnimation animation: UITableViewRowAnimation) {
                XCTAssertTrue(false)
            }
            override func moveRowAtIndexPath(indexPath: NSIndexPath, toIndexPath newIndexPath: NSIndexPath) {
                XCTAssertTrue(false)
            }
            override func deleteRowsAtIndexPaths(indexPaths: [NSIndexPath], withRowAnimation animation: UITableViewRowAnimation) {
                XCTAssertTrue(false)
            }
            override func reloadRowsAtIndexPaths(indexPaths: [NSIndexPath], withRowAnimation animation: UITableViewRowAnimation) {
                XCTAssertTrue(indexPaths.first!.row == 0)
            }
        }
        
        let tableView = TestTableView(frame:CGRectZero, style: .Grouped)
        
        fetchedResultsControllerDataSource = FetchedResultsControllerDataSource(tableView: tableView, fetchedResultsController: NSFetchedResultsController(), reuseIdentifier: "Cell")
        
        fetchedResultsControllerDataSource.controller(fetchedResultsControllerDataSource.fetchedResultsController, didChangeObject: "nil", atIndexPath: NSIndexPath(forRow: 0, inSection:0), forChangeType: .Update, newIndexPath: NSIndexPath(forRow: 1, inSection: 0))
    }
}
