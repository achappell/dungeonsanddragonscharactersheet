//
//  Trait+FEMMappingTests.swift
//  DungeonsDragonsCC
//
//  Created by Amanda Chappell on 3/5/16.
//  Copyright © 2016 AmplifiedProjects. All rights reserved.
//

import XCTest
@testable import DungeonsDragonsCC

class Trait_FEMMappingTests: XCTestCase {

    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }

    func testFEMMapping() {
        
        let bundle = Bundle(for: CoreRulebook_FEMMappingTests.self)
        let path = bundle.pathForResource("testcorerulebook", ofType: "json")
        
        let data = try? Data(contentsOf: URL(fileURLWithPath: path!))
        
        do {
            let JSONDict = try JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions.allowFragments) as! [String:AnyObject]
            
            
            let deserializer = JSONDeserializer()
            
            if let book = JSONDict["coreRulebook"] as? [String: AnyObject], races = book["races"] as? [[String: AnyObject]], traits = races[0]["traits"] as? [[String:AnyObject]] {
                let trait = deserializer.objectFromDictionary(traits[0], classType: Trait.self)! as Trait
                
                XCTAssertEqual(trait.value, 20)
                XCTAssertEqual(trait.type, "Speed")
                XCTAssertEqual(trait.name, "Slow and Steady")
                XCTAssertEqual(trait.originalText, "Dwarves have a base speed of 20 feet, but their speed is never modified by armor or encumbrance.")
            }
        } catch {
            
        }
    }

}
