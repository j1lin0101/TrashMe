//
//  TrashTableViewController.swift
//  TrashMe
//
//  Created by Jeremy Lin on 6/26/16.
//  Copyright © 2016 Jeremy Lin. All rights reserved.
//

import UIKit

class TrashTableViewController: UITableViewController {
    
    var trashCan = [TrashItem]() {
        didSet {
            tableView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return trashCan.count
    }
    
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if let identifier = segue.identifier {
            if identifier == "backToMain" {
                print("BACKIN UP")
            }
            if identifier == "dumpButton" {
                let indexPath = tableView.indexPathForSelectedRow!
                let trash = trashCan[indexPath.row]
                let mainScreenViewController = segue.destinationViewController as! MainScreenViewController
                mainScreenViewController.trashItem = trash
            }
        }
    }
    
    @IBAction override func unwindForSegue(unwindSegue: UIStoryboardSegue, towardsViewController subsequentVC: UIViewController) {
        //stuff
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
    
}
   