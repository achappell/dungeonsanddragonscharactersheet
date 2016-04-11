//
//  CreateCharacterRaceViewControllerTests.swift
//  DungeonsDragonsCC
//
//  Created by Amanda Chappell on 4/2/16.
//  Copyright © 2016 AmplifiedProjects. All rights reserved.
//

import XCTest
@testable import DungeonsDragonsCC

class CreateCharacterRaceViewControllerTests: XCTestCase {

    var viewController : CreateCharacterRaceViewController!
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        viewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewControllerWithIdentifier("CreateCharacterRaceViewController") as! CreateCharacterRaceViewController
        viewController.performSelectorOnMainThread(#selector(UIViewController.loadView), withObject: nil, waitUntilDone: true)
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
        viewController = nil
    }
    
    func testMakeViewController() {
        let viewController = CreateCharacterRaceViewController(nibName: nil, bundle: nil)
        XCTAssertNotNil(viewController, "View Controller failed initialization")
    }
    
    func testViewDidLoad() {
        Race.MR_truncateAll()
        let _ = Race.MR_createEntity()
        
        
        viewController.viewDidLoad()
        
        XCTAssertNotNil(viewController.races, "Races failed to fetch on view did load")
        XCTAssertTrue(viewController.races?.count == 1)
    }
    
    func testCellLabel() {
        
        class TestTableview : UITableView {
            private override func dequeueReusableCellWithIdentifier(identifier: String, forIndexPath indexPath: NSIndexPath) -> UITableViewCell {
                return UITableViewCell(style: .Default, reuseIdentifier: "cell")
            }
        }
        
        viewController.tableView = TestTableview()
        
        Race.MR_truncateAll()
        let race = Race.MR_createEntity()
        race?.name = "Dwarf"
        
        viewController.viewDidLoad()
        
        let cell = viewController.tableView(viewController.tableView, cellForRowAtIndexPath: NSIndexPath(forRow: 0, inSection: 0))
        
        XCTAssertTrue(cell.textLabel?.text == "Dwarf")
    }
    
    func testNumberOfRows() {
        Race.MR_truncateAll()
        let _ = Race.MR_createEntity()
        
        
        viewController.viewDidLoad()
        
        XCTAssertTrue(viewController.tableView(viewController.tableView, numberOfRowsInSection: 0) == 1)
    }
}
