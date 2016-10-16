//
//  CharacterSheetViewController.swift
//  DungeonsDragonsCC
//
//  Created by Amanda Chappell on 3/3/16.
//  Copyright © 2016 AmplifiedProjects. All rights reserved.
//

import UIKit
import CoreData

class CharacterSheetViewController: UICollectionViewController, NSFetchedResultsControllerDelegate {

    var character: Character?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let collectionView = collectionView {
            collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier:"NoCharacterHeader")
        }
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        character = Character.selectedCharacter()

        collectionView?.reloadData()
    }

    func createCharacter(_ sender: UIButton!) {
        let storyboard = UIStoryboard(name: "CreateCharacter", bundle: nil)
        present(storyboard.instantiateInitialViewController()!, animated: true) {

        }
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

        if let character = character {
            let collectionViewCell: AbilityScoreCollectionViewCell = collectionView.dequeueReusableCell(withClass: AbilityScoreCollectionViewCell.self, forIndexPath: indexPath)
            collectionViewCell.character = character
            return collectionViewCell
        }

        let collectionViewCell: UICollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "NoCharacterHeader", for: indexPath)

        let createCharacterButton = UIButton(type: .custom)
        createCharacterButton.setTitle("Create Character", for: UIControlState())
        createCharacterButton.sizeToFit()
        createCharacterButton.center = CGPoint(x: collectionViewCell.bounds.width/2.0, y: collectionViewCell.bounds.height/2.0)
        createCharacterButton.setTitleColor(UIColor.black, for: UIControlState())
        createCharacterButton.addTarget(self, action: #selector(CharacterSheetViewController.createCharacter(_:)), for: .touchUpInside)
        collectionViewCell.contentView.addSubview(createCharacterButton)

        return collectionViewCell
    }

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }

}
