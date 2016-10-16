//
//  CoreRulebookCoordinatorTests.swift
//  DungeonsDragonsCC
//
//  Created by Amanda Chappell on 4/2/16.
//  Copyright © 2016 AmplifiedProjects. All rights reserved.
//

import XCTest
@testable import DungeonsDragonsCC

class CoreRulebookCoordinatorTests: XCTestCase {

    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }

    func testCoreRulebookJSONURL() {
        let bundle = Bundle(for: CoreRulebookCoordinatorTests.self)
        let path = bundle.path(forResource: "testcorerulebook", ofType: "json")
        let coordinator: CoreRulebookCoordinator = CoreRulebookCoordinator(jsonURL: NSURL(fileURLWithPath: path!) as URL)

        XCTAssertNotNil(coordinator.coreRulebookJSONURL)
    }

    func testCoreRulebookJSONURLWithNilInput() {
        let coordinator: CoreRulebookCoordinator = CoreRulebookCoordinator(jsonURL: nil)

        XCTAssertNotNil(coordinator.coreRulebookJSONURL)
    }
}
