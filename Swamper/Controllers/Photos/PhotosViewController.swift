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
    
    var photoStore: PhotoStore!
    var imageStore: ImageStore!
    
    var photoHelper:PhotoHelper?
    
    let photosDataSource = PhotosDataSource()
    
    @IBOutlet weak var tableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        photosDataSource.photoStore = self.photoStore
        photosDataSource.imageStore = self.imageStore
        
        tableView.dataSource = photosDataSource
        tableView.delegate = self

        loadData()
    }
    
    func loadData(){
//        photos = RealmHelper.fetchPhotos()
        
//        self.photosDataSource.notes = RealmHelper.fetchPhotos()
        self.tableView.reloadData()
        
    }
    @IBAction func addPhoto(_ sender: UIBarButtonItem) {
        photoHelper = PhotoHelper(viewController: self, callback: { (image) in
            
            guard let image = image else{
             return
            }
            let photo = self.photoStore.createPhoto(image: image)
            self.imageStore.setImage(image, for: photo.photoKey)
            if let index = self.photoStore.photos.index(of: photo){
                let indexPath = IndexPath(row: index, section: 0)
                self.tableView.insertRows(at: [indexPath], with: .automatic)
            }
        })
    }
}

//MARK:- Table View Delegate

extension PhotosViewController: UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return self.view.frame.width
    }
    
}
