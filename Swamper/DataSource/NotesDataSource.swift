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
    
    var notes:Results<Note>!
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return notes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "NoteTableViewCell", for: indexPath)  as! NoteTableViewCell
        cell.note = notes[indexPath.row]
        return cell
    }
}
