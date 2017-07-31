//
//  PhotosDataSource.swift
//  Swamper
//
//  Created by Lakshmi on 7/30/17.
//  Copyright © 2017 com.arunsivakumar. All rights reserved.
//

import Foundation


import UIKit
import RealmSwift

protocol DataSource:class{
    func delete(indexPath:IndexPath)
}

class PhotosDataSource:NSObject,UITableViewDataSource{
    
    var photos:Results<Photo>!
    
    weak var delegate:DataSource?
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return photos.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PhotoTableViewCell", for: indexPath)  as! PhotoTableViewCell
        cell.photo = photos[indexPath.row]
        return cell
    }
}
