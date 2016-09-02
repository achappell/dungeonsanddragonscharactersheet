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
        viewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "CreateCharacterNameViewController") as! CreateCharacterNameViewController
        viewController.performSelector(onMainThread: #selector(UIViewController.loadView), with: nil, waitUntilDone: true)
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
        
        viewController.save(1 as AnyObject)
        
        XCTAssertEqual(character.name, "Amanda")
        XCTAssertEqual(character.age, 18)
        XCTAssertEqual(character.gender, Constants.Gender.Female)
        XCTAssertEqual(character.alignment, Constants.Alignment.ChaoticEvil)
        XCTAssertEqual(character.selected, true)
    }
    
    func testPickerNumberOfRows() {
        
        XCTAssert(viewController.pickerView(UIPickerView(), numberOfRowsInComponent: 0) == 9)
    }
    
    func testPickerTitleForRow() {
        XCTAssertTrue(viewController.pickerView(viewController.alignmentPickerView, titleForRow: 2, forComponent: 0) == Constants.Alignment.ChaoticGood)
    }
    
    func testPickerTitleOutsideOfRange() {
        XCTAssertTrue(viewController.pickerView(viewController.alignmentPickerView, titleForRow: -1, forComponent: 0) == Constants.Alignment.LawfulGood)
    }
    
    func testPickerTitleAboveRange() {
        XCTAssertTrue(viewController.pickerView(viewController.alignmentPickerView, titleForRow: 10, forComponent: 0) == Constants.Alignment.LawfulGood)
    }
    
    func testPickerSelectRow() {
        viewController.pickerView(viewController.alignmentPickerView, didSelectRow: 3, inComponent: 0)
        XCTAssertTrue(viewController.alignmentButton.titleLabel?.text == Constants.Alignment.LawfulNeutral)
    }
}
