//
//  ViewController.swift
//  SwiftCameraAndGalleryExample
//
//  Created by MacStudent on 2019-03-13.
//  Copyright © 2019 MacStudent. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIImagePickerControllerDelegate,UINavigationControllerDelegate
{

    @IBOutlet weak var lblSelect: UILabel!
    @IBOutlet weak var ImagePic: UIImageView!
    override func viewDidLoad() {
      
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func CameraButton(_ sender: UIBarButtonItem) {
        if UIImagePickerController.isSourceTypeAvailable(.camera){
            let myPickerController = UIImagePickerController()
            myPickerController.delegate = self;
            myPickerController.sourceType = .camera
            self.present(myPickerController, animated: true, completion: nil)
        }
    }
    @IBAction func GalleryButton(_ sender: UIBarButtonItem) {
        
        
        if UIImagePickerController.isSourceTypeAvailable(.photoLibrary){
            let myPickerController = UIImagePickerController()
            myPickerController.delegate = self;
            myPickerController.sourceType = .photoLibrary
            self.present(myPickerController, animated: true, completion: nil)
        }
    }
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        self.dismiss(animated: true, completion: nil)
    }
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            self.ImagePic.image = image
        }else{
            print("Something went wrong")
        }
        self.dismiss(animated: true, completion: nil)
    }
    }


