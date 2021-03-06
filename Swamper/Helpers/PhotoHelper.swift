//
//  PhotoHelper.swift
//  Swamper
//
//  Created by Lakshmi on 7/30/17.
//  Copyright © 2017 com.arunsivakumar. All rights reserved.
//

import UIKit

typealias PhotoCallback = (UIImage?) -> Void

class PhotoHelper : NSObject {
    
    private struct Message{
        
        static let AlertTitle         = "Select your source..."
        static let AlertCancelTitle   = "Cancel"
        static let PhotosActionTitle  = "Photos"
        static let CameraActionTitle  = "Camera"
    }

    fileprivate weak var viewController:UIViewController!
    fileprivate var callback:PhotoCallback
    
    
    private var imagePickerController:UIImagePickerController?
    
    init(viewController: UIViewController, callback: @escaping PhotoCallback) {
       
        self.viewController = viewController
        self.callback = callback
        
        super.init()
        
        showPhotoSourceOptions()
    }
    
    private func showPhotoSourceOptions() {
        
//        let alertController = UIAlertController(title: nil, message: Message.AlertTitle, preferredStyle: .actionSheet)
//        let cancelAction = UIAlertAction(title: Message.AlertCancelTitle, style: .destructive, handler: nil)
//        alertController.addAction(cancelAction)
//        
//        // 1. Library
//        let photoLibraryAction = UIAlertAction(title:Message.PhotosActionTitle , style: .default) { (action) in
//            
//            self.showImagePickerController(sourceType: .photoLibrary)
//        }
//        
//        alertController.addAction(photoLibraryAction)
//        
//        // 2. Rear camera
//        if (UIImagePickerController.isCameraDeviceAvailable(.rear)) {
//            let cameraAction = UIAlertAction(title: Message.CameraActionTitle , style: .default) { (action) in
//                self.showImagePickerController(sourceType: .camera)
//            }
//        alertController.addAction(cameraAction)
//        }
        
   
        
        let alertController = UIAlertController(title: nil, message: Message.AlertTitle, preferredStyle: .actionSheet)
        
        let cancelAction = UIAlertAction(title: Message.AlertCancelTitle, style: .cancel) { action in
            
        }
        alertController.addAction(cancelAction)
        
        let photosAction = UIAlertAction(title: Message.PhotosActionTitle, style: .default) { action in
           self.showImagePickerController(sourceType: .photoLibrary)
        }
        alertController.addAction(photosAction)
        
        // Show ActionSheet
        viewController.present(alertController, animated: true, completion: nil)
    }
    
    private func showImagePickerController(sourceType: UIImagePickerControllerSourceType) {
        
        imagePickerController = UIImagePickerController()
        imagePickerController?.sourceType = sourceType
        
        imagePickerController?.delegate = self
        
        self.viewController.present(imagePickerController!, animated: true, completion: nil)
    }
    
    
}

extension PhotoHelper: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    // User picked an image
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        let image = info[UIImagePickerControllerOriginalImage] as! UIImage
        viewController.dismiss(animated: false, completion: nil)
        callback(image)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        viewController.dismiss(animated: true, completion: nil)
        callback(nil)
    }
}
