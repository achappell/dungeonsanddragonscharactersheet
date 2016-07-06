//
//  MenuViewControllerTests.swift
//  DungeonsDragonsCC
//
//  Created by Amanda Chappell on 3/4/16.
//  Copyright © 2016 AmplifiedProjects. All rights reserved.
//

import XCTest
import UIKit
@testable import DungeonsDragonsCC

class MenuViewControllerTests: XCTestCase {
    
    var viewController : MenuViewController!

    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
        viewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "MenuViewController") as! MenuViewController
        viewController.performSelector(onMainThread: #selector(UIViewController.loadView), with: nil, waitUntilDone: true)
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
        viewController = nil
    }

    func testViewControllerHasOneSection() {
        viewController.viewDidLoad()
        
        XCTAssertTrue(viewController.tableView.numberOfSections == 1, "There should only be one seciton in the tableview")
    }
    
    func testViewControllerHasOneRow() {
        viewController.viewDidLoad()
        
        XCTAssertTrue(viewController.tableView.numberOfRows(inSection: 0) == 1, "There should only be one row in the first section")
    }
    
    func testViewControllerHasManageCharactersRow() {
        viewController.viewDidLoad()
        
        viewController.tableView.reloadData()
        
        let cell = viewController.tableView.cellForRow(at: IndexPath(row: 0, section: 0))
        XCTAssertEqual(cell?.textLabel?.text, "Manage Characters", "The first row should be to manage characters")
    }

/*

- (void)testViewControllerHasManageCharactersRow
{
[self.viewController viewDidLoad];
[self.viewController.tableView reloadData];

UITableViewCell *cell = [self.viewController.tableView cellForRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:0]];

XCTAssertTrue([cell.textLabel.text isEqualToString:@"Manage Characters"], @"The first row should be to manage characters");
} */
}
