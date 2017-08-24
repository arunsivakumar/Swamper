//
//  NotesViewController.swift
//  Swamper
//
//  Created by Lakshmi on 7/30/17.
//  Copyright © 2017 com.arunsivakumar. All rights reserved.
//

import UIKit
import RealmSwift

class NotesViewController: UIViewController{
    
    var noteStore:NoteStore!
    
    fileprivate let notesDataSource = NotesDataSource()
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = notesDataSource
        tableView.delegate = self
        
        loadData()
    }
    
    func loadData(){
        self.tableView.reloadData()
    }
    
    @IBAction func addNote(_ sender: Any) {
        
        performSegue(withIdentifier: "addNote", sender: self)
    }
}


//MARK:- Table View Delegate

extension NotesViewController: UITableViewDelegate{
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 85.0
    }
}


//MARK:- Navigation
extension NotesViewController{
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        switch segue.identifier {
        case "showNote"?:
            
            guard let indexPath = tableView.indexPathForSelectedRow else{ return }
            let vc =
                segue.destination as! AddNoteViewController
            vc.note = noteStore.notes[indexPath.row]
        case "addNote"?: break
        default:
            preconditionFailure("Unexpected segue identifier.")
        }
    }
    
    @IBAction func unwindToNotes(segue: UIStoryboardSegue) {
        switch segue.identifier {
        case "save"?:
            
            guard let indexPath = tableView.indexPathForSelectedRow else{ return }
            let vc =
                segue.destination as! AddNoteViewController
            vc.note = noteStore.notes[indexPath.row]
       
        default:
            preconditionFailure("Unexpected segue identifier.")
        }

    }
    
    
}
