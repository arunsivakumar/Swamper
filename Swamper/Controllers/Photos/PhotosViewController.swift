//
//  PhotosViewController.swift
//  Swamper
//
//  Created by Lakshmi on 7/30/17.
//  Copyright © 2017 com.arunsivakumar. All rights reserved.
//

import Foundation


import UIKit
import RealmSwift

class PhotosViewController: UIViewController{
    
    var photos:Results<Photo>!
    
    @IBOutlet weak var tableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadData()
    }
    
    func loadData(){
//        photos = RealmHelper.fetchPhotos()
    }
}

//MARK:- Table View Delegate

extension PhotosViewController: UITableViewDelegate{
    
    
    
}

//MARK:- Navigation
extension PhotosViewController{
    
    
}
