//
//  TrashTableViewController.swift
//  TrashMe
//
//  Created by Jeremy Lin on 6/26/16.
//  Copyright © 2016 Jeremy Lin. All rights reserved.
//

import UIKit
import RealmSwift


class TrashTableViewController: UITableViewController {
    
    var trashCan: Results<TrashItem>! {
        didSet {
            tableView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        trashCan = RealmHelper.retrieveTrash()
    }

    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return trashCan.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("trashTableViewCell", forIndexPath: indexPath) as! TrashTableViewCell
        
        let row = indexPath.row
        
        let trashPiece = trashCan[row]
        
        cell.trashName.text = trashPiece.name
        cell.trashTimeAdded.text = trashPiece.timeAdded
        
        if(trashPiece.type == 0){
            cell.trashType.text = "Recycle"
        } else if(trashPiece.type == 1){
            cell.trashType.text = "Compost"
        } else {
            cell.trashType.text = "Landfill"
        }
        
        return cell
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if let identifier = segue.identifier {
            if identifier == "dumpButton" {
                let indexPath = tableView.indexPathForSelectedRow!
                let trash = trashCan[indexPath.row]
                let mainScreenViewController = segue.destinationViewController as! MainScreenViewController
                mainScreenViewController.trashItem = trash
            }
        }
    }
    
    @IBAction func unwindToListNotesViewController(segue: UIStoryboardSegue) {
        
        // for now, simply defining the method is sufficient.
        // we'll add code later
        
    }

    
    
}
   