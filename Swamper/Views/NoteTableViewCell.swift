//
//  NotesTableViewCell.swift
//  Swamper
//
//  Created by Lakshmi on 7/30/17.
//  Copyright © 2017 com.arunsivakumar. All rights reserved.
//

import UIKit

class NoteTableViewCell: UITableViewCell {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var contentLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    
    
    var note:Note?{
        didSet{
            if let note = note{
                titleLabel.text = note.title
                contentLabel.text = note.content
                dateLabel.text = nil
            }
        }
    }
    
    override func prepareForReuse() {
        titleLabel.text = nil
        contentLabel.text = nil
        dateLabel.text = nil
        
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
