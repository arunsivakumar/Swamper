//
//  ImageStore.swift
//  Swamper
//
//  Created by Lakshmi on 7/31/17.
//  Copyright © 2017 com.arunsivakumar. All rights reserved.
//

import Foundation
import UIKit

class ImageStore {
    
    let imageCache = NSCache<NSString, UIImage>()
    
    func imageArchiveURL(for key: String) -> URL {
        
        let directories =
            FileManager.default.urls(for: .documentDirectory,
                                     in: .userDomainMask)
        let directory = directories.first!
        
        return directory.appendingPathComponent(key)
    }
    
    func setImage(_ image: UIImage, for key: String) {
        imageCache.setObject(image, forKey: key as NSString)
        
        let url = imageArchiveURL(for: key)
        
        if let data = UIImageJPEGRepresentation(image, 0.5) {
            let _ = try? data.write(to: url, options: [.atomic])
        }
    }
    
    func image(for key: String) -> UIImage? {
        if let image = imageCache.object(forKey: key as NSString) {
            return image
        }
        else {
            let url = imageArchiveURL(for: key)
            
            guard let image = UIImage(contentsOfFile: url.path) else {
                return nil
            }
            
            imageCache.setObject(image, forKey: key as NSString)
            return image
        }
    }
    
    func deleteImage(for key: String) {
        imageCache.removeObject(forKey: key as NSString)
        
        let url = imageArchiveURL(for: key)
        do {
            try FileManager.default.removeItem(at: url)
        }
        catch let error {
            print("Error \(error)")
        }
    }
    
}
