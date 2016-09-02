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
    func fetchedResultsControllerDataSource(_ configureCell: inout UITableViewCell, withObject: AnyObject) -> Void
    func fetchedResultsControllerDataSource(_ deleteObject: AnyObject) -> Void
}

class FetchedResultsControllerDataSource : NSObject, UITableViewDataSource, NSFetchedResultsControllerDelegate {
    
    var delegate : FetchedResultsControllerDataSourceDelegate?
    var fetchedResultsController : NSFetchedResultsController<NSFetchRequestResult> {
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
    
    init(tableView: UITableView, fetchedResultsController: NSFetchedResultsController<NSFetchRequestResult>, reuseIdentifier: String) {
        self.tableView = tableView
        self.fetchedResultsController = fetchedResultsController
        self.reuseIdentifier = reuseIdentifier
        self.paused = false
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        if let sections = fetchedResultsController.sections {
            return sections.count
        }
        return 0
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let sections = fetchedResultsController.sections {
            let sectionInfo = sections[section]
            return sectionInfo.numberOfObjects
        }
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let object = fetchedResultsController.object(at: indexPath)
        
        var cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath)
        
        if let delegate = delegate {
            delegate.fetchedResultsControllerDataSource(&cell, withObject: object)
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            if let delegate = delegate {
                delegate.fetchedResultsControllerDataSource(self.fetchedResultsController.object(at: indexPath))
            }
        }
    }
    
    func controllerWillChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>) {
        tableView?.beginUpdates()
    }
    
    func controllerDidChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>) {
        tableView?.endUpdates()
    }
    
    func controller(_ controller: NSFetchedResultsController<NSFetchRequestResult>, didChange anObject: Any, at indexPath: IndexPath?, for type: NSFetchedResultsChangeType, newIndexPath: IndexPath?) {
        
        if let indexPath = indexPath, let newIndexPath = newIndexPath, let tableView = tableView {
            if type == .insert {
                tableView.insertRows(at: [newIndexPath], with: .automatic)
            } else if type == .move {
                tableView.moveRow(at: indexPath, to: newIndexPath)
            } else if type == .delete {
                tableView.deleteRows(at: [indexPath], with: .automatic)
            } else if type == .update {
                tableView.reloadRows(at: [indexPath], with: .automatic)
            }
        }
    }
    
    func selectedItem() -> AnyObject? {
        if let tableView = tableView {
            if let path = tableView.indexPathForSelectedRow {
                return self.fetchedResultsController.object(at: path)
            }
        }
        return nil
    }

}
