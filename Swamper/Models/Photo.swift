//
//  Photo.swift
//  Swamper
//
//  Created by Lakshmi on 7/30/17.
//  Copyright © 2017 com.arunsivakumar. All rights reserved.
//
import Foundation
import UIKit

class Photo: NSObject, NSCoding  {


//    let image:UIImage
    let updatedAt:Date
    let photoKey: String
    
    
    override init(){
        
        self.photoKey = UUID().uuidString
        self.updatedAt = Date()
//        self.image = nil
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        updatedAt = aDecoder.decodeObject(forKey: "updatedAt") as! Date
        photoKey = aDecoder.decodeObject(forKey: "photoKey") as! String
    }
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(updatedAt, forKey: "updatedAt")
        aCoder.encode(photoKey, forKey: "photoKey")
    }

    
}
