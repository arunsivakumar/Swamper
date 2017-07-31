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

//MARK:- Table View Data Source

extension PhotosViewController: UITableViewDataSource{
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return photos.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PhotoCell", for: indexPath)  as! PhotoCell
        cell.photo = photos[indexPath.row]
        return cell
    }
    
}

//MARK:- Table View Delegate

extension PhotosViewController: UITableViewDelegate{
    
    
    
}

//MARK:- Navigation
extension PhotosViewController{
    
    
}
