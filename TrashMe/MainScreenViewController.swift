//
//  MainScreenViewController.swift
//  TrashMe
//
//  Created by Jeremy Lin on 6/26/16.
//  Copyright © 2016 Jeremy Lin. All rights reserved.
//

import UIKit
import RealmSwift

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
        if segue.identifier == "dumpButton"{
                if let trashItem = trashItem{
                    trashItem.name = TrashNameField.text ?? ""
                    trashItem.type = TrashTypeSelector.selectedSegmentIndex
                    RealmHelper.addTrash(trashItem)
                }
                else {
                    let newTrashItem = TrashItem()
                    newTrashItem.name = TrashNameField.text ?? ""
                    newTrashItem.type = TrashTypeSelector.selectedSegmentIndex
                    newTrashItem.timeAdded = String(NSDate())
                    RealmHelper.addTrash(newTrashItem)
                }
            trashTableViewController.trashCan = RealmHelper.retrieveTrash()
            }
        }

    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
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


