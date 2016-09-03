//
//  CharacterListViewController.swift
//  DungeonsDragonsCC
//
//  Created by Amanda Chappell on 3/3/16.
//  Copyright © 2016 AmplifiedProjects. All rights reserved.
//

import UIKit
import MagicalRecord

class CharacterListViewController: UIViewController, FetchedResultsControllerDataSourceDelegate {
    
    @IBOutlet var tableView: UITableView!
    var fetchedResultsControllerDataSource : FetchedResultsControllerDataSource {
        return FetchedResultsControllerDataSource(tableView: tableView, fetchedResultsController: Character.allCharactersFetchedResultsController(), reuseIdentifier: "Cell")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.fetchedResultsControllerDataSource.paused = false
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        fetchedResultsControllerDataSource.paused = true
    }
    
    func fetchedResultsControllerDataSource(_ deleteObject: AnyObject) {
        if let character = deleteObject as? Character {
            let actionName = String(format: NSLocalizedString("Delete \(character.name)", comment: "Delete undo action name"))
            undoManager?.setActionName(actionName)
            let success = character.mr_deleteEntity()
            if success {
                tableView.reloadData()
            }
        }
    }
    
    func fetchedResultsControllerDataSource(_ configureCell: inout UITableViewCell, withObject: AnyObject) {
        if let character = withObject as? Character {
            configureCell.textLabel?.text = character.name
        }
    }
    
    /*


- (void)deleteObject:(id)object
{
Character* character = object;
NSString* actionName = [NSString stringWithFormat:NSLocalizedString(@"Delete \"%@\"", @"Delete undo action name"), character.name];
[self.undoManager setActionName:actionName];
[character.managedObjectContext deleteObject:character];
}

- (void)didReceiveMemoryWarning
{
[super didReceiveMemoryWarning];
// Dispose of any resources that can be recreated.
}
 */

}