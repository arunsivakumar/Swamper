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


class PhotosDataSource:NSObject,UITableViewDataSource{
    
    var photoStore: PhotoStore!
    var imageStore:ImageStore!
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return photoStore.photos.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PhotoTableViewCell", for: indexPath)  as! PhotoTableViewCell
        cell.photo = photoStore.photos[indexPath.row]
        cell.imageStore = self.imageStore
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            
            let photo = photoStore.photos[indexPath.row]
            self.photoStore.removePhoto(photo)
            self.imageStore.deleteImage(for: photo.photoKey)
            tableView.deleteRows(at: [indexPath], with: .automatic)
        }
    }
    
    
}
