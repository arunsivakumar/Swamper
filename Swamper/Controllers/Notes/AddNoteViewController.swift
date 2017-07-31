//
//  AddNotesViewController.swift
//  Swamper
//
//  Created by Lakshmi on 7/30/17.
//  Copyright © 2017 com.arunsivakumar. All rights reserved.
//

import Foundation


import UIKit
import RealmSwift

class AddNoteViewController: UIViewController{

    
    var note:Note?

    @IBOutlet weak var contentTextView: UITextView!
    @IBOutlet weak var titleTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadData()
        
    }
    
    func loadData(){
        if let note = note{
            titleTextField.text = note.title
            contentTextView.text = note.content
        }
    }
    
    func saveChanges(){
        
        
        if let note = note{  // 1.Update
            
        }else{  // 2. Create Note
            let note = Note()
            note.title = titleTextField.text ?? ""
            note.content = contentTextView.text ?? ""
            note.updatedAt = Date()
            
            RealmHelper.addNote(note: note)
        }
        
    }
}

//MARK:- Navigation
extension AddNoteViewController{
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        switch segue.identifier {
        case "save"?:
            saveChanges()
         
            let vc =
                segue.destination as! NotesViewController
            vc.loadData()
            
        case "addNote"?: break
        default:
            preconditionFailure("Unexpected segue identifier.")
        }
    }
}
