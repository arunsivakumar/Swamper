//
//  Photo.swift
//  Swamper
//
//  Created by Lakshmi on 7/30/17.
//  Copyright © 2017 com.arunsivakumar. All rights reserved.
//

import Foundation


import Foundation
import RealmSwift

class Photo: Object {

    dynamic var content = UIImage()
    dynamic var updatedAt = NSDate()
}
