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

    var fetchedResultsControllerDataSource: FetchedResultsControllerDataSource!
    var tableview = UITableView(frame: CGRect(x: 0, y: 0, width: 300, height: 300))

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

    func testInsertObject() {

        class TestTableView: UITableView {
            override func insertRows(at indexPaths: [IndexPath], with animation: UITableViewRowAnimation) {
                XCTAssertTrue((indexPaths.first! as NSIndexPath).row == 1)
            }
            override func moveRow(at indexPath: IndexPath, to newIndexPath: IndexPath) {
                XCTAssertTrue(false)
            }
            override func deleteRows(at indexPaths: [IndexPath], with animation: UITableViewRowAnimation) {
                XCTAssertTrue(false)
            }
            override func reloadRows(at indexPaths: [IndexPath], with animation: UITableViewRowAnimation) {
                XCTAssertTrue(false)
            }
        }

        let tableView = TestTableView(frame:CGRect.zero, style: .grouped)

        fetchedResultsControllerDataSource = FetchedResultsControllerDataSource(tableView: tableView, fetchedResultsController: NSFetchedResultsController(), reuseIdentifier: "Cell")

        fetchedResultsControllerDataSource.controller(fetchedResultsControllerDataSource.fetchedResultsController, didChange: "nil", at: IndexPath(row: 0, section:0), for: .insert, newIndexPath: IndexPath(row: 1, section: 0))
    }

    func testMoveObject() {

        class TestTableView: UITableView {
            override func insertRows(at indexPaths: [IndexPath], with animation: UITableViewRowAnimation) {
                XCTAssertTrue(false)
            }
            override func moveRow(at indexPath: IndexPath, to newIndexPath: IndexPath) {
                XCTAssertTrue((indexPath as NSIndexPath).row == 0)
                XCTAssertTrue((newIndexPath as NSIndexPath).row == 1)
            }
            override func deleteRows(at indexPaths: [IndexPath], with animation: UITableViewRowAnimation) {
                XCTAssertTrue(false)
            }
            override func reloadRows(at indexPaths: [IndexPath], with animation: UITableViewRowAnimation) {
                XCTAssertTrue(false)
            }
        }

        let tableView = TestTableView(frame:CGRect.zero, style: .grouped)

        fetchedResultsControllerDataSource = FetchedResultsControllerDataSource(tableView: tableView, fetchedResultsController: NSFetchedResultsController(), reuseIdentifier: "Cell")

        fetchedResultsControllerDataSource.controller(fetchedResultsControllerDataSource.fetchedResultsController, didChange: "nil", at: IndexPath(row: 0, section:0), for: .move, newIndexPath: IndexPath(row: 1, section: 0))
    }

    func testDeleteObject() {

        class TestTableView: UITableView {
            override func insertRows(at indexPaths: [IndexPath], with animation: UITableViewRowAnimation) {
                XCTAssertTrue(false)
            }
            override func moveRow(at indexPath: IndexPath, to newIndexPath: IndexPath) {
                XCTAssertTrue(false)
            }
            override func deleteRows(at indexPaths: [IndexPath], with animation: UITableViewRowAnimation) {
                XCTAssertTrue((indexPaths.first! as NSIndexPath).row == 0)
            }
            override func reloadRows(at indexPaths: [IndexPath], with animation: UITableViewRowAnimation) {
                XCTAssertTrue(false)
            }
        }

        let tableView = TestTableView(frame:CGRect.zero, style: .grouped)

        fetchedResultsControllerDataSource = FetchedResultsControllerDataSource(tableView: tableView, fetchedResultsController: NSFetchedResultsController(), reuseIdentifier: "Cell")

        fetchedResultsControllerDataSource.controller(fetchedResultsControllerDataSource.fetchedResultsController, didChange: "nil", at: IndexPath(row: 0, section:0), for: .delete, newIndexPath: IndexPath(row: 1, section: 0))
    }

    func testUpdateObject() {

        class TestTableView: UITableView {
            override func insertRows(at indexPaths: [IndexPath], with animation: UITableViewRowAnimation) {
                XCTAssertTrue(false)
            }
            override func moveRow(at indexPath: IndexPath, to newIndexPath: IndexPath) {
                XCTAssertTrue(false)
            }
            override func deleteRows(at indexPaths: [IndexPath], with animation: UITableViewRowAnimation) {
                XCTAssertTrue(false)
            }
            override func reloadRows(at indexPaths: [IndexPath], with animation: UITableViewRowAnimation) {
                XCTAssertTrue((indexPaths.first! as NSIndexPath).row == 0)
            }
        }

        let tableView = TestTableView(frame:CGRect.zero, style: .grouped)

        fetchedResultsControllerDataSource = FetchedResultsControllerDataSource(tableView: tableView, fetchedResultsController: NSFetchedResultsController(), reuseIdentifier: "Cell")

        fetchedResultsControllerDataSource.controller(fetchedResultsControllerDataSource.fetchedResultsController, didChange: "nil", at: IndexPath(row: 0, section:0), for: .update, newIndexPath: IndexPath(row: 1, section: 0))
    }
}
