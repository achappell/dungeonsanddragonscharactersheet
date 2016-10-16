//
//  CreateCharacterNameViewController.swift
//  DungeonsDragonsCC
//
//  Created by Amanda Chappell on 3/3/16.
//  Copyright © 2016 AmplifiedProjects. All rights reserved.
//

import UIKit
import MagicalRecord

class CreateCharacterNameViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource, UITextFieldDelegate {

    var character: Character?
    var selectedAlignment: String = Constants.Alignment.LawfulGood
    var alignments: [String] {
        return [Constants.Alignment.LawfulGood, Constants.Alignment.NeutralGood,
                Constants.Alignment.ChaoticGood, Constants.Alignment.LawfulNeutral,
            Constants.Alignment.Neutral, Constants.Alignment.ChaoticNeutral,
            Constants.Alignment.LawfulEvil, Constants.Alignment.NeutralEvil,
            Constants.Alignment.ChaoticEvil]
    }
    @IBOutlet var nameTextField: UITextField!
    @IBOutlet var genderSegmentedControl: UISegmentedControl!
    @IBOutlet var alignmentButton: UIButton!
    @IBOutlet var ageTextField: UITextField!
    @IBOutlet var alignmentPickerView: UIPickerView!

    @IBAction func save(_ sender: AnyObject) {
        if let character = character {

            if let name = self.nameTextField.text {
                character.name = name
            }

            if let age = ageTextField.text, let ageInt = Int16(age) {
                character.age = ageInt
            }

            if genderSegmentedControl.selectedSegmentIndex == 0 {
                character.gender = Constants.Gender.Male
            } else {
                character.gender = Constants.Gender.Female
            }

            character.alignment = selectedAlignment
            Character.setSelectedCharacter(character)

            character.managedObjectContext?.mr_saveToPersistentStore(completion: { (success, error) in
                self.dismiss(animated: true, completion: nil)
            })
        }
    }

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }

    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }

    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return alignments.count
    }

    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if alignments.count > row && row >= 0 {
            return alignments[row]
        }
        return Constants.Alignment.LawfulGood
    }

    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if alignments.count > row {
            selectedAlignment = alignments[row]

            alignmentButton.setTitle(selectedAlignment, for: UIControlState())
        }
    }
}
