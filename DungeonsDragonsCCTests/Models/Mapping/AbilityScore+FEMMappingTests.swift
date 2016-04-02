//
//  Races+FEMMappingTests.swift
//  DungeonsDragonsCC
//
//  Created by Amanda Chappell on 3/5/16.
//  Copyright © 2016 AmplifiedProjects. All rights reserved.
//

import XCTest
@testable import DungeonsDragonsCC

class AbilityScore_FEMMappingTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testFEMMapping() {
        
        let bundle = NSBundle(forClass: AbilityScore_FEMMappingTests.self)
        let path = bundle.pathForResource("testcorerulebook", ofType: "json")
        
        let data = NSData(contentsOfFile: path!)
        
        do {
            let JSONDict = try NSJSONSerialization.JSONObjectWithData(data!, options: NSJSONReadingOptions.AllowFragments) as! [String:AnyObject]
            
            
            let deserializer = JSONDeserializer()
            
            if let book = JSONDict["coreRulebook"] as? [String: AnyObject], races = book["races"] as? [[String: AnyObject]], modifiers = races[0]["modifiers"] as? [[String:Int]] {
                let modifier = deserializer.objectFromDictionary(modifiers[0], classType: AbilityScore.self)! as AbilityScore
                
               XCTAssertEqual(modifier.baseScore, 2)
               XCTAssertEqual(modifier.type, AbilityType.Constitution.rawValue)
            }
        } catch {
            
        }
    }
}
