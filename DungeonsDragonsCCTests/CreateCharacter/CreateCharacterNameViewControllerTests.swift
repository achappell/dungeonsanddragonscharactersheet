//
//  CreateCharacterNameViewControllerTests.swift
//  DungeonsDragonsCC
//
//  Created by Amanda Chappell on 3/4/16.
//  Copyright © 2016 AmplifiedProjects. All rights reserved.
//

import XCTest
@testable import DungeonsDragonsCC

class CreateCharacterNameViewControllerTests: XCTestCase {

    var viewController : CreateCharacterNameViewController!
    
    override func setUp() {
        super.setUp()
        viewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewControllerWithIdentifier("CreateCharacterNameViewController") as! CreateCharacterNameViewController
        viewController.performSelectorOnMainThread("loadView", withObject: nil, waitUntilDone: true)
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
        viewController = nil
    }

    func testSave() {
        let character = CharacterHelper.testCharacter
        viewController.character = character
        
        viewController.ageTextField.text = "18"
        viewController.genderSegmentedControl.selectedSegmentIndex = 1
        viewController.selectedAlignment = Constants.Alignment.ChaoticEvil
        viewController.nameTextField.text = "Amanda"
        
        viewController.save(1)
        
        XCTAssertEqual(character.name, "Amanda")
        XCTAssertEqual(character.age, 18)
        XCTAssertEqual(character.gender, Constants.Gender.Female)
        XCTAssertEqual(character.alignment, Constants.Alignment.ChaoticEvil)
        XCTAssertEqual(character.selected, true)
    }
}
