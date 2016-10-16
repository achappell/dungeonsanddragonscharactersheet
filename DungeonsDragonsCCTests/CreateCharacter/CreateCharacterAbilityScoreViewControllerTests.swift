//
//  CreateCharacterAbilityScoreViewControllerTests.swift
//  DungeonsDragonsCC
//
//  Created by Amanda Chappell on 3/4/16.
//  Copyright © 2016 AmplifiedProjects. All rights reserved.
//

import XCTest
import UIKit
import MagicalRecord
@testable import DungeonsDragonsCC

class CreateCharacterAbilityMock: CreateCharacterAbilityScoreViewController {

    var didCallRegisterForKeyboardNotifications = false
    var didCallKeyboardWasShown = false
    var didCallKeyboardWillBeHidden = false

    internal override func registerForKeyboardNotifications() {
        didCallRegisterForKeyboardNotifications = true
        super.registerForKeyboardNotifications()
    }

    internal override func keyboardWasShown(_ aNotification: Notification) {
        didCallKeyboardWasShown = true
        super.keyboardWasShown(aNotification)
    }

    internal override func keyboardWillBeHidden(_ aNotification: Notification) {
        didCallKeyboardWillBeHidden = true
        super.keyboardWillBeHidden(aNotification)
    }
}

class CreateCharacterAbilityScoreViewControllerTests: XCTestCase {

    var viewController: CreateCharacterAbilityScoreViewController!
    var viewControllerMock: CreateCharacterAbilityMock!
    var expectation: XCTestExpectation!

    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.

        viewController = UIStoryboard.storyboard(.CreateCharacter).instantiateViewController() as CreateCharacterAbilityScoreViewController
        viewController.performSelector(onMainThread: #selector(UIViewController.loadView), with: nil, waitUntilDone: true)

        viewControllerMock = CreateCharacterAbilityMock()
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
        viewController = nil
    }

    func testMakeViewController() {
        let viewController = CreateCharacterAbilityScoreViewController(nibName: nil, bundle: nil)
        XCTAssertNotNil(viewController, "View Controller failed initialization")
    }

    func testSholudRegisterForNotificationsOnViewDidLoad() {

        let createMock = CreateCharacterAbilityMock()
        createMock.viewDidLoad()

        XCTAssertTrue(createMock.didCallRegisterForKeyboardNotifications, "View Controller failed to register for notifications")

    }

    func testRegisterForNotificationsProperly() {
        viewControllerMock.scrollView = UIScrollView()
        viewControllerMock.registerForKeyboardNotifications()

        NotificationCenter.default.post(name: NSNotification.Name.UIKeyboardDidShow, object: nil)
        NotificationCenter.default.post(name: NSNotification.Name.UIKeyboardWillHide, object: nil)

        XCTAssertTrue(viewControllerMock.didCallKeyboardWasShown, "View Controller did not call keyBoardWasShown:")
        XCTAssertTrue(viewControllerMock.didCallKeyboardWillBeHidden, "View Controller did not call keyBroadWillBeHidden:")
    }

    func testShouldGoToNextInRightScenario() {
        viewController.strengthTextField.text = "12"
        viewController.dexterityTextField.text = "12"
        viewController.constitutionTextField.text = "12"
        viewController.wisdomTextField.text = "12"
        viewController.intelligenceTextField.text = "12"
        viewController.charismaTextField.text = "12"

        XCTAssertTrue(viewController.shouldAllowNextNavigation(), "View Controller did not allow next when it should have")
    }

    func testShouldNotGoToNextWithNoData() {
        XCTAssertFalse(viewController.shouldAllowNextNavigation(), "View Controller allowed next when it should not have")
    }

    func testShouldNotGotToNextWithoutDexterity() {
        viewController.strengthTextField.text = "12"
        viewController.constitutionTextField.text = "12"
        viewController.wisdomTextField.text = "12"
        viewController.intelligenceTextField.text = "12"
        viewController.charismaTextField.text = "12"

        XCTAssertFalse(viewController.shouldAllowNextNavigation(), "View Controller did not allow without Dexterity")
    }

    func testShouldNotGotToNextWithoutStrength() {
        viewController.dexterityTextField.text = "12"
        viewController.constitutionTextField.text = "12"
        viewController.wisdomTextField.text = "12"
        viewController.intelligenceTextField.text = "12"
        viewController.charismaTextField.text = "12"

        XCTAssertFalse(viewController.shouldAllowNextNavigation(), "View Controller did not allow without Strength")
    }

    func testShouldNotGotToNextWithoutConstitution() {
        viewController.strengthTextField.text = "12"
        viewController.dexterityTextField.text = "12"
        viewController.wisdomTextField.text = "12"
        viewController.intelligenceTextField.text = "12"
        viewController.charismaTextField.text = "12"

        XCTAssertFalse(viewController.shouldAllowNextNavigation(), "View Controller did not allow without Constitution")
    }

    func testShouldNotGotToNextWithoutWisdom() {
        viewController.strengthTextField.text = "12"
        viewController.constitutionTextField.text = "12"
        viewController.dexterityTextField.text = "12"
        viewController.intelligenceTextField.text = "12"
        viewController.charismaTextField.text = "12"

        XCTAssertFalse(viewController.shouldAllowNextNavigation(), "View Controller did not allow without Wisdom")
    }

    func testShouldNotGotToNextWithoutIntelligence() {
        viewController.strengthTextField.text = "12"
        viewController.constitutionTextField.text = "12"
        viewController.wisdomTextField.text = "12"
        viewController.dexterityTextField.text = "12"
        viewController.charismaTextField.text = "12"

        XCTAssertFalse(viewController.shouldAllowNextNavigation(), "View Controller did not allow without Intelligence")
    }

    func testShouldNotGotToNextWithoutCharisma() {
        viewController.strengthTextField.text = "12"
        viewController.constitutionTextField.text = "12"
        viewController.wisdomTextField.text = "12"
        viewController.intelligenceTextField.text = "12"
        viewController.dexterityTextField.text = "12"

        XCTAssertFalse(viewController.shouldAllowNextNavigation(), "View Controller did not allow without Charisma")
    }

    func testCreateCharacterWithValidInfo() {
        MagicalRecord.setupCoreDataStack()

        viewController.strengthTextField.text = "12"
        viewController.dexterityTextField.text = "12"
        viewController.constitutionTextField.text = "12"
        viewController.wisdomTextField.text = "12"
        viewController.intelligenceTextField.text = "12"
        viewController.charismaTextField.text = "12"

        let character = viewController.createCharacter()

        XCTAssertNotNil(character, "Character was not created correctly")
        XCTAssertEqual(character.baseAbilityScores.count, 6, "There should be 6 ability scores on the character now")
    }

    func testSetActiveFieldOnResponder() {
        viewController.textFieldDidBeginEditing(viewController.strengthTextField)

        XCTAssertEqual(viewController.activeField, viewController.strengthTextField)
    }

    func testDexAfterStr() {
        XCTAssertEqual(viewController.nextTextField(viewController.strengthTextField), viewController.dexterityTextField)
    }

    func testConAfterDex() {
        XCTAssertEqual(viewController.nextTextField(viewController.dexterityTextField), viewController.constitutionTextField)
    }

    func testIntAfterCon() {
        XCTAssertEqual(viewController.nextTextField(viewController.constitutionTextField), viewController.intelligenceTextField)
    }

    func testWisAfterInt() {
        XCTAssertEqual(viewController.nextTextField(viewController.intelligenceTextField), viewController.wisdomTextField)
    }

    func testChaAfterWis() {
        XCTAssertEqual(viewController.nextTextField(viewController.wisdomTextField), viewController.charismaTextField)
    }

    func testNothingAfterCha() {
        XCTAssertNil(viewController.nextTextField(viewController.charismaTextField))
    }

    func testNextBarButtonEnabled() {
        class TestViewController: CreateCharacterAbilityScoreViewController {
            override func shouldAllowNextNavigation() -> Bool {
                return true
            }
        }

        let testViewController = TestViewController()
        testViewController.charismaTextField = UITextField()
        testViewController.strengthTextField = UITextField()
        testViewController.dexterityTextField = UITextField()
        testViewController.constitutionTextField = UITextField()
        testViewController.intelligenceTextField = UITextField()
        testViewController.wisdomTextField = UITextField()
        testViewController.nextBarButtonItem = UIBarButtonItem()
        testViewController.nextBarButtonItem.isEnabled = false

        XCTAssertTrue(testViewController.textFieldShouldReturn(testViewController.charismaTextField))

        XCTAssertTrue(testViewController.nextBarButtonItem.isEnabled)
        XCTAssertFalse(testViewController.charismaTextField.isFirstResponder)

    }

    func testFirstResponderSwitch() {
        let expectation = self.expectation(description: "Should become responder")
        class TestTextField: UITextField {
            var viewController: CreateCharacterAbilityScoreViewController?
            var expectation: XCTestExpectation?

            override func becomeFirstResponder() -> Bool {
                expectation!.fulfill()
                XCTAssertTrue(viewController?.dexterityTextField == self)
                return true
            }
        }

        let testViewController = CreateCharacterAbilityScoreViewController()

        let dexterity = TestTextField()
        dexterity.viewController = testViewController
        dexterity.expectation = expectation

        testViewController.charismaTextField = UITextField()
        testViewController.strengthTextField = UITextField()
        testViewController.dexterityTextField = dexterity
        testViewController.constitutionTextField = UITextField()
        testViewController.intelligenceTextField = UITextField()
        testViewController.wisdomTextField = UITextField()
        testViewController.nextBarButtonItem = UIBarButtonItem()
        testViewController.nextBarButtonItem.isEnabled = false

        XCTAssertTrue(testViewController.textFieldShouldReturn(testViewController.strengthTextField))

        waitForExpectations(timeout: 1) { (error) in
            XCTAssertNil(error)
        }
    }

    func testFirstResponderRelease() {
        let expectation = self.expectation(description: "Should resign responder")

        class TestViewController: CreateCharacterAbilityScoreViewController {
            override func shouldAllowNextNavigation() -> Bool {
                return true
            }
        }

        class TestTextField: UITextField {
            var viewController: CreateCharacterAbilityScoreViewController?
            var expectation: XCTestExpectation?

            override func resignFirstResponder() -> Bool {
                XCTAssertTrue(viewController?.charismaTextField == self)
                expectation!.fulfill()
                return true
            }
        }

        let testViewController = TestViewController()

        let charisma = TestTextField()
        charisma.viewController = testViewController
        charisma.expectation = expectation

        testViewController.charismaTextField = charisma
        testViewController.strengthTextField = UITextField()
        testViewController.dexterityTextField = UITextField()
        testViewController.constitutionTextField = UITextField()
        testViewController.intelligenceTextField = UITextField()
        testViewController.wisdomTextField = UITextField()
        testViewController.nextBarButtonItem = UIBarButtonItem()
        testViewController.nextBarButtonItem.isEnabled = false

        XCTAssertTrue(testViewController.textFieldShouldReturn(testViewController.charismaTextField))

        waitForExpectations(timeout: 1) { (error) in
            XCTAssertNil(error)
        }

    }
}
