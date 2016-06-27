//
//  TrashItem.swift
//  TrashMe
//
//  Created by Jeremy Lin on 6/26/16.
//  Copyright © 2016 Jeremy Lin. All rights reserved.
//

import Foundation
import RealmSwift

class TrashItem: Object {
    dynamic var name = ""
    dynamic var type = 0
    dynamic var timeAdded = ""
}