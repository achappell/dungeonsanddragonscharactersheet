//
//  AbilityScoreCollectionViewCellTests.swift
//  DungeonsDragonsCC
//
//  Created by Amanda Chappell on 3/4/16.
//  Copyright © 2016 AmplifiedProjects. All rights reserved.
//

import XCTest
@testable import DungeonsDragonsCC
import MagicalRecord

class AbilityScoreCollectionViewCellTests: XCTestCase {
    
    var cell : AbilityScoreCollectionViewCell!

    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
        let characterSheet = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "CharacterSheet") as! CharacterSheetViewController
        cell = characterSheet.collectionView?.dequeueReusableCell(withReuseIdentifier: "AbilityHeader", for: IndexPath(item: 0, section: 0)) as! AbilityScoreCollectionViewCell
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
        cell = nil
    }

    func testConfigureForCharacter() {
        
        let character = CharacterHelper.testCharacter
        cell.character = character
        
        XCTAssertEqual(cell.strengthLabel.text, "10")
        XCTAssertEqual(cell.dexterityLabel.text, "10")
        XCTAssertEqual(cell.constitutionLabel.text, "10")
        XCTAssertEqual(cell.intelligenceLabel.text, "10")
        XCTAssertEqual(cell.wisdomLabel.text, "10")
        XCTAssertEqual(cell.charismaLabel.text, "10")
        
        XCTAssertTrue(cell.strengthModLabel.text == " 1")
        XCTAssertEqual(cell.dexterityModLabel.text, " 1")
        XCTAssertEqual(cell.constitutionModLabel.text, " 1")
        XCTAssertEqual(cell.intelligenceModLabel.text, " 1")
        XCTAssertEqual(cell.wisdomModLabel.text, " 1")
        XCTAssertEqual(cell.charismaModLabel.text, " 1")
        
        XCTAssertEqual(cell.strengthTempAdjLabel.text, " 2")
        XCTAssertEqual(cell.dexterityTempAdjLabel.text, " 2")
        XCTAssertEqual(cell.constitutionTempAdjLabel.text, " 2")
        XCTAssertEqual(cell.intelligenceTempAdjLabel.text, " 2")
        XCTAssertEqual(cell.wisdomTempAdjLabel.text, " 2")
        XCTAssertEqual(cell.charismaTempAdjLabel.text, " 2")
        
        XCTAssertEqual(cell.strengthTempModLabel.text, " 3")
        XCTAssertEqual(cell.dexterityTempModLabel.text, " 3")
        XCTAssertEqual(cell.constitutionTempModLabel.text, " 3")
        XCTAssertEqual(cell.intelligenceTempModLabel.text, " 3")
        XCTAssertEqual(cell.wisdomTempModLabel.text, " 3")
        XCTAssertEqual(cell.charismaTempModLabel.text, " 3")
    
    }

}
