//
//  CreateCharacterAbilityScoreViewController.swift
//  DungeonsDragonsCC
//
//  Created by Amanda Chappell on 3/3/16.
//  Copyright © 2016 AmplifiedProjects. All rights reserved.
//

import UIKit
import MagicalRecord

extension UITextField {
    func hasValidText() -> Bool {
        return self.text != "" && (self.text != nil)
    }
}

class CreateCharacterAbilityScoreViewController: UIViewController, UITextFieldDelegate, UIScrollViewDelegate {
    
    @IBOutlet var strengthTextField: UITextField!
    @IBOutlet var dexterityTextField: UITextField!
    @IBOutlet var constitutionTextField: UITextField!
    @IBOutlet var intelligenceTextField: UITextField!
    @IBOutlet var wisdomTextField: UITextField!
    @IBOutlet var charismaTextField: UITextField!
    @IBOutlet var scrollView: UIScrollView!
    @IBOutlet var nextBarButtonItem: UIBarButtonItem!
    
    weak var activeField: UITextField?

    override func viewDidLoad() {
        super.viewDidLoad()

        registerForKeyboardNotifications()
    }
    
    func registerForKeyboardNotifications() {
        NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(CreateCharacterAbilityScoreViewController.keyboardWasShown(_:)), name: UIKeyboardDidShowNotification, object: nil)
        NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(CreateCharacterAbilityScoreViewController.keyboardWillBeHidden(_:)), name: UIKeyboardWillHideNotification, object: nil)
    }
    
    deinit {
        NSNotificationCenter.defaultCenter().removeObserver(self)
    }
    
    func shouldAllowNextNavigation() -> Bool {
        var shouldAllowNextNavigation = false
        
        if strengthTextField.hasValidText() && dexterityTextField.hasValidText() &&  constitutionTextField.hasValidText() && intelligenceTextField.hasValidText() && wisdomTextField.hasValidText() && charismaTextField.hasValidText() {
            shouldAllowNextNavigation = true
        }
        
        return shouldAllowNextNavigation
    }
    
    func createCharacter() -> Character {
        let strengthScore = AbilityScore.insertItemWithBaseScore(Int16(self.strengthTextField.text!)!, type: .Strength)
        let dexterityScore = AbilityScore.insertItemWithBaseScore(Int16(self.dexterityTextField.text!)!, type: .Dexterity)
        let constitutionScore = AbilityScore.insertItemWithBaseScore(Int16(self.constitutionTextField.text!)!, type: .Constitution)
        let intelligenceScore = AbilityScore.insertItemWithBaseScore(Int16(self.intelligenceTextField.text!)!, type: .Intelligence)
        let wisdomScore = AbilityScore.insertItemWithBaseScore(Int16(self.wisdomTextField.text!)!, type: .Wisdom)
        let charismaScore = AbilityScore.insertItemWithBaseScore(Int16(self.charismaTextField.text!)!, type: .Charisma)
        
        let abilityScores = NSOrderedSet(array: [strengthScore,dexterityScore, constitutionScore, intelligenceScore, wisdomScore, charismaScore])
        let character = Character.insertItemWithAbilityScores(abilityScores)
        
        return character
    }
    
    func keyboardWasShown(aNotification: NSNotification) {
        if let info = aNotification.userInfo, kbSize = info[UIKeyboardFrameBeginUserInfoKey]?.CGRectValue.size {
        
            let contentInsets = UIEdgeInsetsMake(0, 0, kbSize.height, 0)
            scrollView.contentInset = contentInsets
            scrollView.scrollIndicatorInsets = contentInsets
        
            view.frame.size.height -= kbSize.height
            if !CGRectContainsPoint(view.frame, activeField!.frame.origin) {
                scrollView.scrollRectToVisible(activeField!.frame, animated: true)
            }
        }
    }
    
    func keyboardWillBeHidden(aNotification: NSNotification) {
        let contentInsets = UIEdgeInsetsZero
        scrollView.contentInset = contentInsets
        scrollView.scrollIndicatorInsets = contentInsets
    }
    
    func textFieldDidBeginEditing(textField: UITextField) {
        activeField = textField
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        if let textField = nextTextField(textField) {
            textField.becomeFirstResponder()
        } else {
            textField.resignFirstResponder()
        }
        
        nextBarButtonItem.enabled = shouldAllowNextNavigation()
        
        return true
    }
    
    func nextTextField(textField: UITextField) -> UITextField? {
        if textField == strengthTextField {
            return dexterityTextField
        } else if textField == dexterityTextField {
            return constitutionTextField
        } else if textField == constitutionTextField {
            return intelligenceTextField
        } else if textField == intelligenceTextField {
            return wisdomTextField
        } else if textField == wisdomTextField {
            return charismaTextField
        }

        return nil
    }

    @IBAction func cancel(sender: AnyObject) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        let viewController = segue.destinationViewController as! CreateCharacterNameViewController
        viewController.character = createCharacter()
    }

}
