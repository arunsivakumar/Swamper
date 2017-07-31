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
    
    let notesDataSource = NotesDataSource()
    
    @IBOutlet weak var tableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = notesDataSource
        tableView.delegate = self
        
        
        loadData()
    }
    
    func loadData(){
        self.notesDataSource.notes = RealmHelper.fetchNotes()
        self.tableView.reloadData()
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
    
    
}
