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
    lazy var characterFetchedResultsController : NSFetchedResultsController = Character.selectedCharacterFetchedResultsController(self)

    override func viewDidLoad() {
        super.viewDidLoad()

        if let collectionView = self.collectionView {
            collectionView.registerClass(UICollectionViewCell.self, forCellWithReuseIdentifier:"NoCharacterHeader")
        }
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        self.collectionView!.reloadData()
    }
    
    func createCharacter(sender: UIButton!) {
        self.performSegueWithIdentifier("CreateCharacter", sender: self)
    }
    
    override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        
        if let character = character {
            let collectionViewCell = collectionView.dequeueReusableCellWithReuseIdentifier("AbilityHeader", forIndexPath: indexPath) as! AbilityScoreCollectionViewCell
            collectionViewCell.character = character
            return collectionViewCell
        }
        
        let collectionViewCell = collectionView.dequeueReusableCellWithReuseIdentifier("NoCharacterHeader", forIndexPath: indexPath)
        
        let createCharacterButton = UIButton(type: .Custom)
        createCharacterButton.setTitle("Create Character", forState: .Normal)
        createCharacterButton.sizeToFit()
        createCharacterButton.center = CGPointMake(CGRectGetWidth(collectionViewCell.bounds)/2.0,CGRectGetHeight(collectionViewCell.bounds)/2.0)
        createCharacterButton.setTitleColor(UIColor.blackColor(), forState: .Normal)
        createCharacterButton.addTarget(self, action: #selector(CharacterSheetViewController.createCharacter(_:)), forControlEvents: .TouchUpInside)
        collectionViewCell.contentView.addSubview(createCharacterButton)
        
        return collectionViewCell
    }
    
    override func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
    }
    
    override func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    
    func controller(controller: NSFetchedResultsController, didChangeObject anObject: AnyObject, atIndexPath indexPath: NSIndexPath?, forChangeType type: NSFetchedResultsChangeType, newIndexPath: NSIndexPath?) {
        if let character = anObject as? Character {
            if type == .Delete {
                self.character = nil
            } else {
                self.character = character
            }
            collectionView?.reloadData()
        }
    }

}
