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
    
    var character : Character?
    lazy var characterFetchedResultsController : NSFetchedResultsController<NSFetchRequestResult> = Character.selectedCharacterFetchedResultsController(self)

    override func viewDidLoad() {
        super.viewDidLoad()

        if let collectionView = self.collectionView {
            collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier:"NoCharacterHeader")
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.collectionView!.reloadData()
    }
    
    func createCharacter(_ sender: UIButton!) {
        self.performSegue(withIdentifier: "CreateCharacter", sender: self)
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if let character = character {
            let collectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "AbilityHeader", for: indexPath) as! AbilityScoreCollectionViewCell
            collectionViewCell.character = character
            return collectionViewCell
        }
        
        let collectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "NoCharacterHeader", for: indexPath)
        
        let createCharacterButton = UIButton(type: .custom)
        createCharacterButton.setTitle("Create Character", for: UIControlState())
        createCharacterButton.sizeToFit()
        createCharacterButton.center = CGPoint(x: collectionViewCell.bounds.width/2.0,y: collectionViewCell.bounds.height/2.0)
        createCharacterButton.setTitleColor(UIColor.black(), for: UIControlState())
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
    
    func controller(_ controller: NSFetchedResultsController<NSFetchRequestResult>, didChange anObject: AnyObject, at indexPath: IndexPath?, for type: NSFetchedResultsChangeType, newIndexPath: IndexPath?) {
        if let character = anObject as? Character {
            if type == .delete {
                self.character = nil
            } else {
                self.character = character
            }
            collectionView?.reloadData()
        }
    }

}
