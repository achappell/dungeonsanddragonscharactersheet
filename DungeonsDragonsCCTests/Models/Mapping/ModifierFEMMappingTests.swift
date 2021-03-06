//
//  Modifier+FEMMappingTests.swift
//  DungeonsDragonsCC
//
//  Created by Amanda Chappell on 3/5/16.
//  Copyright © 2016 AmplifiedProjects. All rights reserved.
//

import XCTest
@testable import DungeonsDragonsCC

class ModifierFEMMappingTests: XCTestCase {

    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }

    func testFEMMapping() {
        let deserializer = JSONDeserializer()
        let modifiers = getModifiers()
        let modifier = deserializer.objectFromDictionary(modifiers![0], classType: Modifier.self)! as Modifier

        XCTAssertEqual(modifier.value, 0)
        XCTAssertEqual(modifier.type, "Size")
        XCTAssertEqual(modifier.originalText, "Dwarves are Medium creatures and have no bonuses or penalties due to their size.")
    }

    func testSkillMapping() {
        let deserializer = JSONDeserializer()
        let modifiers = getModifiers()
        let modifier = deserializer.objectFromDictionary(modifiers![2], classType: Modifier.self)! as Modifier

        XCTAssertEqual(modifier.value, 2)
        XCTAssertEqual(modifier.type, "Skill")
        XCTAssertEqual(modifier.originalText, "Dwarves receive a +2 racial bonus on Appraise skill checks made to determine the price of nonmagical goods that contain precious metals or gemstones.")
        XCTAssertEqual(modifier.circumstance, "Only for nonmagical goods that contain precious metals or gemstones.")
    }

    func getModifiers() -> [[String:AnyObject]]? {

        let bundle = Bundle(for: CoreRulebookFEMMappingTests.self)
        let path = bundle.path(forResource: "testcorerulebook", ofType: "json")

        let data = try? Data(contentsOf: URL(fileURLWithPath: path!))

        do {
            let JSONDict = try JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions.allowFragments) as! [String:AnyObject]

            if let book = JSONDict["coreRulebook"] as? [String: AnyObject], let races = book["races"] as? [[String: AnyObject]], let modifiers = races[0]["modifiers"] as? [[String:AnyObject]] {
                return modifiers
            }
        } catch {

        }

        return nil
    }

}
