//
//  PhotoCell.swift
//  Swamper
//
//  Created by Lakshmi on 7/30/17.
//  Copyright © 2017 com.arunsivakumar. All rights reserved.
//

import Foundation


import UIKit

class PhotoTableViewCell: UITableViewCell {
    
    @IBOutlet weak var photoImageView: UIImageView!

    var photo:Photo?{
        didSet{
            if let photo = photo{
//                photoImageView.image = photo.image
            }
        }
    }
    
    override func prepareForReuse() {
        photoImageView.image = nil
        
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}
