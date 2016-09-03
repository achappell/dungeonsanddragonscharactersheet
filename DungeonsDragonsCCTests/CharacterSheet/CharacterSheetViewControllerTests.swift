//
//  CharacterSheetViewControllerTests.swift
//  DungeonsDragonsCC
//
//  Created by Amanda Chappell on 4/2/16.
//  Copyright © 2016 AmplifiedProjects. All rights reserved.
//

import XCTest
@testable import DungeonsDragonsCC

class CharacterSheetViewControllerTests: XCTestCase {
    
    var viewController : CharacterSheetViewController!
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        viewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "CharacterSheet") as! CharacterSheetViewController
        viewController.performSelector(onMainThread: #selector(UIViewController.loadView), with: nil, waitUntilDone: true)
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
        viewController = nil
    }
    
    func testMakeViewController() {
        let viewController = CharacterSheetViewController(nibName: nil, bundle: nil)
        XCTAssertNotNil(viewController, "View Controller failed initialization")
    }

}
