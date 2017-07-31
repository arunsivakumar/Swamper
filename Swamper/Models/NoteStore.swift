//
//  NoteStore.swift
//  Swamper
//
//  Created by Lakshmi on 7/30/17.
//  Copyright © 2017 com.arunsivakumar. All rights reserved.
//


import Foundation
import RealmSwift

class NoteStore{

  var notes:Results<Note>!
    
    init(){
        fetchNotes()
    }
    
    func createNote(note: Note) {
        let realm = try! Realm()
        try! realm.write() {
            realm.add(note)
        }
        fetchNotes()
    }
    
    func removeNote(note: Note) {
        let realm = try! Realm()
        try! realm.write() {
            realm.delete(note)
        }
        fetchNotes()
    }
    
    func updateNote(for note: Note,using updatedNote:Note){
        let realm = try! Realm()
        try! realm.write() {
            note.title = updatedNote.title
            note.content = updatedNote.content
            note.updatedAt = updatedNote.updatedAt
        }
        fetchNotes()
        
    }
    
    func fetchNotes(){
        
        let realm = try! Realm()
        self.notes =  realm.objects(Note.self).sorted(byKeyPath: "updatedAt", ascending: false)
    }
    
    func getNotesCount()-> Int{
        let realm = try! Realm()
        return realm.objects(Note.self).count
    }



}
