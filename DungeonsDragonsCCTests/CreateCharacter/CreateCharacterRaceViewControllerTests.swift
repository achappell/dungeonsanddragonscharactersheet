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
        
        viewController = UIStoryboard(name: "CreateCharacter", bundle: nil).instantiateViewController(withIdentifier: "CreateCharacterRaceViewController") as! CreateCharacterRaceViewController
        viewController.performSelector(onMainThread: #selector(UIViewController.loadView), with: nil, waitUntilDone: true)
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
        Race.mr_truncateAll()
        let _ = Race.mr_createEntity()
        
        
        viewController.viewDidLoad()
        
        XCTAssertNotNil(viewController.races, "Races failed to fetch on view did load")
        XCTAssertTrue(viewController.races?.count == 1)
    }
    
    func testCellLabel() {
        
        class TestTableview : UITableView {
            private override func dequeueReusableCell(withIdentifier identifier: String, for indexPath: IndexPath) -> UITableViewCell {
                return UITableViewCell(style: .default, reuseIdentifier: "cell")
            }
        }
        
        viewController.tableView = TestTableview()
        
        Race.mr_truncateAll()
        let race = Race.mr_createEntity()
        race?.name = "Dwarf"
        
        viewController.viewDidLoad()
        
        let cell = viewController.tableView(viewController.tableView, cellForRowAt: IndexPath(row: 0, section: 0))
        
        XCTAssertTrue(cell.textLabel?.text == "Dwarf")
    }
    
    func testNumberOfRows() {
        Race.mr_truncateAll()
        let _ = Race.mr_createEntity()
        
        
        viewController.viewDidLoad()
        
        XCTAssertTrue(viewController.tableView(viewController.tableView, numberOfRowsInSection: 0) == 1)
    }
}
