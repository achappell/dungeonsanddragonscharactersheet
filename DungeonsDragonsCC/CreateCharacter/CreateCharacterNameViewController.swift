//
//  CreateCharacterNameViewController.swift
//  DungeonsDragonsCC
//
//  Created by Amanda Chappell on 3/3/16.
//  Copyright © 2016 AmplifiedProjects. All rights reserved.
//

import UIKit

class CreateCharacterNameViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource, UITextFieldDelegate {
    
    var character: Character?
    var selectedAlignment: String = Constants.Alignment.LawfulGood
    var alignments: [String] {
        return [Constants.Alignment.LawfulGood, Constants.Alignment.NeutralGood, Constants.Alignment.ChaoticGood, Constants.Alignment.LawfulNeutral, Constants.Alignment.Neutral, Constants.Alignment.ChaoticNeutral, Constants.Alignment.LawfulEvil, Constants.Alignment.NeutralEvil, Constants.Alignment.ChaoticEvil]
    }
    @IBOutlet var nameTextField: UITextField!
    @IBOutlet var genderSegmentedControl: UISegmentedControl!
    @IBOutlet var alignmentButton: UIButton!
    @IBOutlet var ageTextField: UITextField!
    @IBOutlet var alignmentPickerView: UIPickerView!

    @IBAction func save(sender: AnyObject) {
        if let character = character {
            
            if let name = self.nameTextField.text {
                character.name = name
            }
            
            if let age = ageTextField.text, ageInt = Int16(age) {
                character.age = ageInt
            }
        
            if genderSegmentedControl.selectedSegmentIndex == 0 {
                character.gender = Constants.Gender.Male
            } else {
                character.gender = Constants.Gender.Female
            }
        
            character.alignment = selectedAlignment
            Character.setSelectedCharacter(character)
        
            dismissViewControllerAnimated(true, completion: nil)
        }
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return alignments.count
    }
    
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if alignments.count > row && row >= 0 {
            return alignments[row]
        }
        return Constants.Alignment.LawfulGood
    }
    
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if alignments.count > row {
            selectedAlignment = alignments[row]
            
            alignmentButton.setTitle(selectedAlignment, forState: .Normal)
        }
    }
}
