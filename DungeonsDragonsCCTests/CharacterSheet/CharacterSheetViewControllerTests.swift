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

    var viewController: CharacterSheetViewController!

    override func setUp() {
        super.setUp()
        viewController = UIStoryboard.storyboard(.Main).instantiateViewController() as CharacterSheetViewController
        viewController.performSelector(onMainThread: #selector(UIViewController.loadView), with: nil, waitUntilDone: true)
    }

    override func tearDown() {
        super.tearDown()
        viewController = nil
    }

    func testMakeViewController() {
        let viewController = CharacterSheetViewController(nibName: nil, bundle: nil)
        XCTAssertNotNil(viewController, "View Controller failed initialization")
    }

}
