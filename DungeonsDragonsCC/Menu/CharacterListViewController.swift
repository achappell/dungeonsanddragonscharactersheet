//
//  CharacterListViewController.swift
//  DungeonsDragonsCC
//
//  Created by Amanda Chappell on 3/3/16.
//  Copyright © 2016 AmplifiedProjects. All rights reserved.
//

import UIKit
import MagicalRecord

class CharacterListViewController: UIViewController, FetchedResultsControllerDataSourceDelegate, UITableViewDelegate {
    
    @IBOutlet var tableView: UITableView!
    var fetchedResultsControllerDataSource : FetchedResultsControllerDataSource {
        let controller = FetchedResultsControllerDataSource(tableView: tableView, fetchedResultsController: Character.allCharactersFetchedResultsController(), reuseIdentifier: "Cell")
        controller.delegate = self
        return controller
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        fetchedResultsControllerDataSource.paused = false
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        fetchedResultsControllerDataSource.paused = true
    }
    
    internal func fetchedResultsControllerDataSource(_ configureCell: inout UITableViewCell, withObject: AnyObject) {
        if let character = withObject as? Character {
            configureCell.textLabel?.text = character.name
        }
    }
    
    internal func fetchedResultsControllerDataSource(_ deleteObject: AnyObject) {
        if let character = deleteObject as? Character {
            let actionName = String(format: NSLocalizedString("Delete \(character.name)", comment: "Delete undo action name"))
            undoManager?.setActionName(actionName)
            let success = character.mr_deleteEntity()
            if success {
                tableView.reloadData()
            }
        }
    }
    
}
