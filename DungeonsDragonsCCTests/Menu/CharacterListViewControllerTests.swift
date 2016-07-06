//
//  CharacterListViewControllerTests.swift
//  DungeonsDragonsCC
//
//  Created by Amanda Chappell on 3/4/16.
//  Copyright © 2016 AmplifiedProjects. All rights reserved.
//

import XCTest
import MagicalRecord
@testable import DungeonsDragonsCC

class CharacterListViewControllerTests: XCTestCase {
    
    var viewController : CharacterListViewController!

    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
        viewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "CharacterListViewController") as! CharacterListViewController
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
        viewController = nil
    }
    
    func testDeleteObject() {
        Character.mr_truncateAll()
        let character = CharacterHelper.testCharacter
        viewController.tableView = UITableView()
        viewController.fetchedResultsControllerDataSource(deleteObject: character)
        
        XCTAssertNil(DungeonsDragonsCC.Character.mr_findFirst())
    }

}
