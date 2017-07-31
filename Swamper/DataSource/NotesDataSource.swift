//
//  NotesDataSource.swift
//  Swamper
//
//  Created by Lakshmi on 7/30/17.
//  Copyright © 2017 com.arunsivakumar. All rights reserved.
//

import UIKit
import RealmSwift

class NotesDataSource:NSObject,UITableViewDataSource{
    
    var noteStore: NoteStore!
        
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return noteStore.notes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "NoteTableViewCell", for: indexPath)  as! NoteTableViewCell
        cell.note = noteStore.notes[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        
        if editingStyle == .delete {
            let note = noteStore.notes[indexPath.row]
            self.noteStore.removeNote(note: note)
            tableView.deleteRows(at: [indexPath], with: .automatic)
        }
    }
}
