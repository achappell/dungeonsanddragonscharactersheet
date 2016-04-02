//
//  CreateCharacterRaceViewController.swift
//  DungeonsDragonsCC
//
//  Created by Amanda Chappell on 4/2/16.
//  Copyright © 2016 AmplifiedProjects. All rights reserved.
//

import UIKit
import CoreData

class CreateCharacterRaceViewController: UITableViewController {
    
    var races : [Race]?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        races = Race.MR_findAll() as? [Race]
        tableView.reloadData()
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let races = races {
            return races.count
        }
        return 0
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath)
        
        cell.textLabel!.text = races?[indexPath.row].name
        
        return cell
    }
}
