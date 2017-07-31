//
//  ViewController.swift
//  Swamper
//
//  Created by Lakshmi on 7/29/17.
//  Copyright © 2017 com.arunsivakumar. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
    
    @IBOutlet weak var notesCountLabel: UILabel!
    @IBOutlet weak var websitesCountLabel: UILabel!
    @IBOutlet weak var cardsCountLabel: UILabel!
    @IBOutlet weak var photosCountLabel: UILabel!
    @IBOutlet weak var extraCountLabel: UILabel!
    @IBOutlet weak var freeCountLabel: UILabel!
    
    @IBAction func openNotes(_ sender: UITapGestureRecognizer) {
        performSegue(withIdentifier: "showNotes", sender: self)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        updateCounts()
    }
    
    func updateCounts(){
        
        notesCountLabel.text = String(RealmHelper.getNotesCount())
    }
}

