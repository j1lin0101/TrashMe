//
//  MainScreenViewController.swift
//  TrashMe
//
//  Created by Jeremy Lin on 6/26/16.
//  Copyright © 2016 Jeremy Lin. All rights reserved.
//

import UIKit

class MainScreenViewController: UIViewController {
    @IBOutlet weak var TrashNameField: UITextField!
    @IBOutlet weak var TrashTypeSelector: UISegmentedControl!

    var trashItem: TrashItem?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let trashTableViewController = segue.destinationViewController as! TrashTableViewController
        if let identifier = segue.identifier {
            if identifier == "displayTrash" {
                print("Trash Displayed")
            }
            else if identifier == "dumpButton" {
                if let trashItem = trashItem{
                    trashItem.name = TrashNameField.text ?? ""
                    trashItem.type = TrashTypeSelector.selectedSegmentIndex
                    trashTableViewController.tableView.reloadData()
                }
                else {
                    let newTrashItem = TrashItem()
                    newTrashItem.name = TrashNameField.text ?? ""
                    newTrashItem.type = TrashTypeSelector.selectedSegmentIndex
                    newTrashItem.timeAdded = String(NSDate())
                    trashTableViewController.trashCan.append(newTrashItem)
                }
            }
        }
    }

    @IBAction func dumpTrash(sender: UIButton) {
        print("Dumped")
    }

    override func viewWillAppear(animated: Bool) {
        super.viewDidLoad()
        if let trashItem = trashItem {
            TrashNameField.text = trashItem.name
            TrashTypeSelector.selectedSegmentIndex = trashItem.type
        }
        else{
            TrashNameField.text = ""
            TrashTypeSelector.selectedSegmentIndex = 0
        }
    }
}


