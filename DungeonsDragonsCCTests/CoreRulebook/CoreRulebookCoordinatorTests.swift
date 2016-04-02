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
        let bundle = NSBundle(forClass: CoreRulebookCoordinatorTests.self)
        let path = bundle.pathForResource("testcorerulebook", ofType: "json")
        let coordinator : CoreRulebookCoordinator = CoreRulebookCoordinator(jsonURL: NSURL(fileURLWithPath: path!))
        
        XCTAssertNotNil(coordinator.coreRulebookJSONURL)
    }

    func testCoreRulebookJSONURLWithNilInput() {
        let coordinator : CoreRulebookCoordinator = CoreRulebookCoordinator(jsonURL: nil)
        
        XCTAssertNotNil(coordinator.coreRulebookJSONURL)
    }
}
