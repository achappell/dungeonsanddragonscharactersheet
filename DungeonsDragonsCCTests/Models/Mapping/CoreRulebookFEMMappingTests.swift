//
//  CoreRulebook+FEMMappingTests.swift
//  DungeonsDragonsCC
//
//  Created by Amanda Chappell on 3/4/16.
//  Copyright © 2016 AmplifiedProjects. All rights reserved.
//

import XCTest
@testable import DungeonsDragonsCC

class CoreRulebookFEMMappingTests: XCTestCase {

    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }

    func testFEMMapping() {

        CoreRulebook.mr_truncateAll()
        Race.mr_truncateAll()


        let bundle = Bundle(for: CoreRulebookFEMMappingTests.self)
        let path = bundle.path(forResource: "testcorerulebook", ofType: "json")

        let data = try? Data(contentsOf: URL(fileURLWithPath: path!))

        let deserializer = JSONDeserializer()
        let coreRulebook = deserializer.objectFromData(data!, classType: CoreRulebook.self)! as CoreRulebook

        XCTAssertEqual(coreRulebook.races.count, 1)
        XCTAssertEqual(coreRulebook.skills.count, 1)
    }

}
