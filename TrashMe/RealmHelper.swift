//
//  RealmHelper.swift
//  TrashMe
//
//  Created by Jeremy Lin on 6/26/16.
//  Copyright © 2016 Jeremy Lin. All rights reserved.
//

import Foundation
import RealmSwift

class RealmHelper {
    //static methods will go here
    static func addTrash(trash: TrashItem){
        let realm = try! Realm()
        try! realm.write() {
            // save, modify, or delete some object(s) here
            realm.add(trash)
        }
    }
    
    
    static func retrieveTrash() -> Results<TrashItem>{
        let realm = try! Realm()
        return realm.objects(TrashItem).sorted("trashType", ascending: true)
    }
}

