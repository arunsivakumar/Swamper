//
//  RealmHelper.swift
//  Swamper
//
//  Created by Lakshmi on 7/30/17.
//  Copyright © 2017 com.arunsivakumar. All rights reserved.
//

import Foundation
import RealmSwift

class RealmHelper{
    
    static func addNote(note: Note) {
        let realm = try! Realm()
        try! realm.write() {
            realm.add(note)
        }
    }
    
    static func deleteNote(note: Note) {
        let realm = try! Realm()
        try! realm.write() {
            realm.delete(note)
        }
    }
    
    static func fetchNotes()-> Results<Note>{
        
        let realm = try! Realm()
        return realm.objects(Note.self).sorted(byKeyPath: "updatedAt", ascending: false)
    }
    
    static func getNotesCount()-> Int{
        let realm = try! Realm()
        return realm.objects(Note.self).count
    }
}
