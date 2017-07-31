//
//  ViewController.swift
//  Swamper
//
//  Created by Lakshmi on 7/29/17.
//  Copyright © 2017 com.arunsivakumar. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
    
    var photoStore = PhotoStore()
    var imageStore = ImageStore()
    
    @IBOutlet weak var notesCountLabel: UILabel!
    @IBOutlet weak var websitesCountLabel: UILabel!
    @IBOutlet weak var cardsCountLabel: UILabel!
    @IBOutlet weak var photosCountLabel: UILabel!
    @IBOutlet weak var extraCountLabel: UILabel!
    @IBOutlet weak var freeCountLabel: UILabel!
    
    @IBAction func openNotes(_ sender: UITapGestureRecognizer) {
        performSegue(withIdentifier: "showNotes", sender: self)
    }
    @IBAction func openPhotos(_ sender: UITapGestureRecognizer) {
        performSegue(withIdentifier: "showPhotos", sender: self)
    }
    @IBAction func showSketches(_ sender: UITapGestureRecognizer) {
        performSegue(withIdentifier: "showSketches", sender: self)
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


//MARK:- Navigation
extension HomeViewController{
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        switch segue.identifier {
        case "showNotes"?:
           break
        case "showPhotos"?:
            let vc =
                segue.destination as! PhotosViewController
            vc.photoStore = photoStore
             vc.imageStore = imageStore
        case "showSketches"?: break
        default:
            preconditionFailure("Unexpected segue identifier.")
        }
    }
    
    @IBAction func unwindToNotes(segue: UIStoryboardSegue) {
        
    }
}
