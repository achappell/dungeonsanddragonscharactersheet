//
//  FetchedResultsControllerDataSource.swift
//  DungeonsDragonsCC
//
//  Created by Amanda Chappell on 3/4/16.
//  Copyright © 2016 AmplifiedProjects. All rights reserved.
//

import UIKit
import CoreData

protocol FetchedResultsControllerDataSourceDelegate {
    func fetchedResultsControllerDataSource(inout configureCell: UITableViewCell, withObject: AnyObject) -> Void
    func fetchedResultsControllerDataSource(deleteObject deleteObject: AnyObject) -> Void
}

class FetchedResultsControllerDataSource : NSObject, UITableViewDataSource, NSFetchedResultsControllerDelegate {
    
    var delegate : FetchedResultsControllerDataSourceDelegate?
    var fetchedResultsController : NSFetchedResultsController {
        didSet {
            fetchedResultsController.delegate = self
            
        }
    }
    var reuseIdentifier : String
    var paused : Bool {
        didSet {
            if paused {
                fetchedResultsController.delegate = nil
            } else {
                fetchedResultsController.delegate = self
                
                do {
                 try fetchedResultsController.performFetch()
                } catch {
                    let fetchError = error as NSError
                    print("\(fetchError), \(fetchError.userInfo)")
                }
                self.tableView?.reloadData()
            }
        }
    }
    weak var tableView : UITableView? {
        didSet {
            tableView?.dataSource = self
        }
    }
    
    init(tableView: UITableView, fetchedResultsController: NSFetchedResultsController, reuseIdentifier: String) {
        self.tableView = tableView
        self.fetchedResultsController = fetchedResultsController
        self.reuseIdentifier = reuseIdentifier
        self.paused = false
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        if let sections = fetchedResultsController.sections {
            return sections.count
        }
        return 0
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let sections = fetchedResultsController.sections {
            let sectionInfo = sections[section]
            return sectionInfo.numberOfObjects
        }
        return 0
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let object = fetchedResultsController.objectAtIndexPath(indexPath)
        
        var cell = tableView.dequeueReusableCellWithIdentifier(reuseIdentifier, forIndexPath: indexPath)
        
        if let delegate = delegate {
            delegate.fetchedResultsControllerDataSource(&cell, withObject: object)
        }
        
        return cell
    }
    
    func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        return true
    }
    
    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            if let delegate = delegate {
                delegate.fetchedResultsControllerDataSource(deleteObject: self.fetchedResultsController.objectAtIndexPath(indexPath))
            }
        }
    }
    
    func controllerWillChangeContent(controller: NSFetchedResultsController) {
        tableView?.beginUpdates()
    }
    
    func controllerDidChangeContent(controller: NSFetchedResultsController) {
        tableView?.endUpdates()
    }
    
    func controller(controller: NSFetchedResultsController, didChangeObject anObject: AnyObject, atIndexPath indexPath: NSIndexPath?, forChangeType type: NSFetchedResultsChangeType, newIndexPath: NSIndexPath?) {
        
        if let indexPath = indexPath, newIndexPath = newIndexPath, tableView = tableView {
            if type == .Insert {
                tableView.insertRowsAtIndexPaths([newIndexPath], withRowAnimation: .Automatic)
            } else if type == .Move {
                tableView.moveRowAtIndexPath(indexPath, toIndexPath: newIndexPath)
            } else if type == .Delete {
                tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Automatic)
            } else if type == .Update {
                tableView.reloadRowsAtIndexPaths([indexPath], withRowAnimation: .Automatic)
            }
        }
    }
    
    func selectedItem() -> AnyObject? {
        if let tableView = tableView {
            if let path = tableView.indexPathForSelectedRow {
                return self.fetchedResultsController.objectAtIndexPath(path)
            }
        }
        return nil
    }

}
