//
//  ViewController.swift
//  SwiftCameraAndGalleryExample
//
//  Created by MacStudent on 2019-03-13.
//  Copyright © 2019 MacStudent. All rights reserved.
//

import UIKit
import MobileCoreServices
class ViewController: UIViewController
{

    @IBOutlet weak var lblSelect: UILabel!
    @IBOutlet weak var ImagePic: UIImageView!
    var newMedia: Bool?
    
    override func viewDidLoad() {
      
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func CameraButton(_ sender: UIBarButtonItem) {
        if UIImagePickerController.isSourceTypeAvailable(.camera){
            let myPickerController = UIImagePickerController()
            myPickerController.delegate = self;
            myPickerController.sourceType = .camera
            myPickerController.mediaTypes = [kUTTypeImage as String]
            myPickerController.allowsEditing = false
            self.present(myPickerController, animated: true, completion: nil)
            newMedia = true
        }
    }
    @IBAction func GalleryButton(_ sender: UIBarButtonItem) {
        
        
        if UIImagePickerController.isSourceTypeAvailable(.photoLibrary){
            let myPickerController = UIImagePickerController()
            myPickerController.delegate = self;
            myPickerController.sourceType = .photoLibrary
            myPickerController.mediaTypes = [kUTTypeImage as String]
            myPickerController.allowsEditing = false
            self.present(myPickerController, animated: true, completion: nil)
            newMedia = false
        }
    }
}
extension ViewController:  UIImagePickerControllerDelegate, UINavigationControllerDelegate
{
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        self.dismiss(animated: true, completion: nil)
    }
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        let mediaType = info[UIImagePickerController.InfoKey.mediaType] as! NSString
        if let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            self.ImagePic.image = image
            if (newMedia == true) {
                UIImageWriteToSavedPhotosAlbum(image, self, #selector(self.image(image:didFinishSavingWithError:contextInfo:)), nil)
            } else if mediaType.isEqual(to: kUTTypeMovie as String) {
                
            }
        }else{
            print("Something went wrong")
        }
        for (k, _) in info {
            print("TEST - \(k)")
        }
        self.dismiss(animated: true, completion: nil)
    }
    

    
    @objc func image(image: UIImage, didFinishSavingWithError error: NSErrorPointer, contextInfo:UnsafeRawPointer) {
        
        if error != nil {
            let alert = UIAlertController(title: "Save Failed",
                                          message: "Failed to save image",
                                          preferredStyle: UIAlertController.Style.alert)
            
            let cancelAction = UIAlertAction(title: "OK",
                                             style: .cancel, handler: nil)
            
            alert.addAction(cancelAction)
            self.present(alert, animated: true,
                         completion: nil)
}
}
}


