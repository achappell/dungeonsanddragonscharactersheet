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
        NotificationCenter.default().addObserver(self, selector: #selector(CreateCharacterAbilityScoreViewController.keyboardWasShown(_:)), name: NSNotification.Name.UIKeyboardDidShow, object: nil)
        NotificationCenter.default().addObserver(self, selector: #selector(CreateCharacterAbilityScoreViewController.keyboardWillBeHidden(_:)), name: NSNotification.Name.UIKeyboardWillHide, object: nil)
    }
    
    deinit {
        NotificationCenter.default().removeObserver(self)
    }
    
    func shouldAllowNextNavigation() -> Bool {
        var shouldAllowNextNavigation = false
        
        if strengthTextField.hasValidText() && dexterityTextField.hasValidText() &&  constitutionTextField.hasValidText() && intelligenceTextField.hasValidText() && wisdomTextField.hasValidText() && charismaTextField.hasValidText() {
            shouldAllowNextNavigation = true
        }
        
        return shouldAllowNextNavigation
    }
    
    func createCharacter() -> Character {
        let strengthScore = AbilityScore.insertItemWithBaseScore(Int16(self.strengthTextField.text!)!, type: .strength)
        let dexterityScore = AbilityScore.insertItemWithBaseScore(Int16(self.dexterityTextField.text!)!, type: .dexterity)
        let constitutionScore = AbilityScore.insertItemWithBaseScore(Int16(self.constitutionTextField.text!)!, type: .constitution)
        let intelligenceScore = AbilityScore.insertItemWithBaseScore(Int16(self.intelligenceTextField.text!)!, type: .intelligence)
        let wisdomScore = AbilityScore.insertItemWithBaseScore(Int16(self.wisdomTextField.text!)!, type: .wisdom)
        let charismaScore = AbilityScore.insertItemWithBaseScore(Int16(self.charismaTextField.text!)!, type: .charisma)
        
        let abilityScores = OrderedSet(array: [strengthScore,dexterityScore, constitutionScore, intelligenceScore, wisdomScore, charismaScore])
        let character = Character.insertItemWithAbilityScores(abilityScores)
        
        return character
    }
    
    func keyboardWasShown(_ aNotification: Notification) {
        if let info = (aNotification as NSNotification).userInfo, kbSize = info[UIKeyboardFrameBeginUserInfoKey]?.cgRectValue.size {
        
            let contentInsets = UIEdgeInsetsMake(0, 0, kbSize.height, 0)
            scrollView.contentInset = contentInsets
            scrollView.scrollIndicatorInsets = contentInsets
        
            view.frame.size.height -= kbSize.height
            if !view.frame.contains(activeField!.frame.origin) {
                scrollView.scrollRectToVisible(activeField!.frame, animated: true)
            }
        }
    }
    
    func keyboardWillBeHidden(_ aNotification: Notification) {
        let contentInsets = UIEdgeInsetsZero
        scrollView.contentInset = contentInsets
        scrollView.scrollIndicatorInsets = contentInsets
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        activeField = textField
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if let textField = nextTextField(textField) {
            textField.becomeFirstResponder()
        } else {
            textField.resignFirstResponder()
        }
        
        nextBarButtonItem.isEnabled = shouldAllowNextNavigation()
        
        return true
    }
    
    func nextTextField(_ textField: UITextField) -> UITextField? {
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

    @IBAction func cancel(_ sender: AnyObject) {
        self.dismiss(animated: true, completion: nil)
    }
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: AnyObject?) {
        
        let viewController = segue.destinationViewController as! CreateCharacterNameViewController
        viewController.character = createCharacter()
    }

}
