//
//  PhotoStore.swift
//  Swamper
//
//  Created by Lakshmi on 7/31/17.
//  Copyright © 2017 com.arunsivakumar. All rights reserved.
//

import Foundation
import UIKit

class PhotoStore{
    
    private static let photosArchive = "photos.archive"
    
    var photos:[Photo] = []
    
    private let photoArchiveURL: URL = {
        let directorys =
            FileManager.default.urls(for: .documentDirectory,
                                     in: .userDomainMask)
        let directory = directorys.first!
        return directory.appendingPathComponent(photosArchive)
    }()
    
    init() {
        if let savedPhotos = NSKeyedUnarchiver.unarchiveObject(withFile: photoArchiveURL.path) as? [Photo] {
            photos += savedPhotos
        }
    }
    
    func createPhoto(image:UIImage) -> Photo{
      let photo = Photo()
        photos.append(photo)
        return photo
    }
    
    func removePhoto(_ photo:Photo){
        if let index = photos.index(of: photo){
            photos.remove(at: index)
        }
    }
    
    func save() -> Bool {
        return NSKeyedArchiver.archiveRootObject(photos, toFile: photoArchiveURL.path)
    }
    
}
