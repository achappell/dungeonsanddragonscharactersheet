//
//  Skill+FEMMappingTests.swift
//  DungeonsDragonsCC
//
//  Created by Amanda Chappell on 3/5/16.
//  Copyright © 2016 AmplifiedProjects. All rights reserved.
//

import XCTest
@testable import DungeonsDragonsCC

class Skill_FEMMappingTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testFEMMapping() {
        
        let bundle = NSBundle(forClass: CoreRulebook_FEMMappingTests.self)
        let path = bundle.pathForResource("testcorerulebook", ofType: "json")
        
        let data = NSData(contentsOfFile: path!)
        
        do {
            let JSONDict = try NSJSONSerialization.JSONObjectWithData(data!, options: NSJSONReadingOptions.AllowFragments) as! [String:AnyObject]
            
            
            let deserializer = JSONDeserializer()
            
            if let book = JSONDict["coreRulebook"] as? [String: AnyObject], skills = book["skills"] as? [[String: AnyObject]] {
                let skill = deserializer.objectFromDictionary(skills[0], classType: Skill.self)! as Skill
                
                XCTAssertEqual(skill.name, "Appraise")
                XCTAssertEqual(skill.originalText, "You can evaluate the monetary value of an object.")
                XCTAssertEqual(skill.check, "A DC 20 Appraise check determines the value of a common item. If you succeed by 5 or more, you also determine if the item has magic properties, although this success does not grant knowledge of the magic item's abilities. If your fail the check by less than 5, you determine the price of that item to within 20% of its actual value. If you fail this check by 5 or more, the price is wildly inaccurate, subject to GM discretion. Particularly rare or exotic items might increase the DC of this check by 5 or more. You can also use this check to determine the most valuable item visible in a treasure hoard. The DC of this check is generally 20 but can increase to as high as 30 for a particularly large hoard.")
                XCTAssertEqual(skill.action, "Appraising an item takes 1 standard action. Determining the most valuable object in a treasure hoard takes 1 full-round action.")
                XCTAssertTrue(skill.tryAgain)
                XCTAssertEqual(skill.tryAgainOriginalText, "Additional attempts to Appraise an item reveal the same result.")
                XCTAssertEqual(skill.special, "A spellcaster with a raven familiar gains a +3 bonus on Appraise checks.")
                XCTAssertFalse(skill.trainedOnly)
                XCTAssertEqual(skill.keyAbility, 3)
            }
        } catch {
            
        }
    }
    
}

