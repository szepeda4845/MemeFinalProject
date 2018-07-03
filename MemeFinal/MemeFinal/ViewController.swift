//
//  ViewController.swift
//  MemeFinal
//
//  Created by Samuel Zepeda on 6/20/18.
//  Copyright © 2018 Samuel Zepeda. All rights reserved.
//

import UIKit
import Foundation

class ViewController: UIViewController, UIImagePickerControllerDelegate,
UINavigationControllerDelegate, UITextFieldDelegate{

    @IBOutlet weak var Border: UILabel!
    @IBOutlet weak var preView: UIImageView!
    @IBOutlet weak var Begin: UIButton!
    @IBOutlet weak var Library: UIButton!
    @IBOutlet weak var Camera: UIButton!
    @IBOutlet weak var firstView: UIView!
    @IBOutlet weak var secondView: UIView!
    var Image: UIImage!
    let imagePicker = UIImagePickerController()
    
    ///////////
    
  
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        imagePicker.delegate = self
        Border.layer.borderWidth = 5.0
        Border.layer.borderColor = (Begin.backgroundColor?.cgColor as! CGColor)
        firstView.layer.cornerRadius = 40
        secondView.center.x = self.view.frame.width - 1000
        
        
        UIView.animate(withDuration: 2, delay: 0, usingSpringWithDamping: 5, initialSpringVelocity: 30, options: .curveEaseInOut, animations: ({
            
            self.secondView.center.x = self.view.frame.width / 2
            
        }), completion: nil)
        
      
        
        
        firstView.center.x = self.view.frame.width + 100
        
        
        UIView.animate(withDuration: 2, delay: 0, usingSpringWithDamping: 5, initialSpringVelocity: 30, options: .curveEaseInOut, animations: ({
            
            self.firstView.center.x = self.view.frame.width / 2
            
        }), completion: nil)
        
        
        
        if (Image) != nil{

            self.Begin.alpha = 1.0
            self.Border.alpha = 1.0
            self.preView.alpha = 1.0
        }
        else{
            self.Begin.alpha = 0.4
            self.Border.alpha = 0.4
            self.preView.alpha = 0.4
            
        }
        
        
        
    }

  
    
    override var prefersStatusBarHidden: Bool{
        get {return true}
    }
    
    
    
    @IBAction func unwindFromcurrent(_ sender : UIStoryboardSegue){
        
    }
    
    
    
    
    ////////////
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [ String : Any]){
        
         Image = info[UIImagePickerControllerOriginalImage] as! UIImage
        preView.image = Image
        
        if (Image) != nil{
            
            self.Begin.alpha = 1.0
            self.Border.alpha = 1.0
            self.preView.alpha = 1.0
        }
        else{
            self.Begin.alpha = 0.4
            self.Border.alpha = 0.4
            self.preView.alpha = 0.4
            
        }
        
        
        picker.dismiss(animated: true, completion: nil)
       
        
       
    }
    
//    func segue(_: Any){
//    performSegue(withIdentifier:"PhotoEditScreen", sender: self)
//    }
//    
//    
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let ViewTwoView = segue.destination as! ViewTwo
        ViewTwoView.imageforView = Image!
     
        
    }
    
    @IBAction func BeginEdit(_ sender: Any) {
        
        
        performSegue(withIdentifier:"PhotoEditScreen", sender: self)
        
    }
    
    @IBAction func Camera(_ sender: Any) {
        


        if UIImagePickerController.isSourceTypeAvailable(.camera){

            imagePicker.sourceType = .camera
            self.present(imagePicker, animated: true, completion: nil)

        }else{
            print ("Camera not availbale")
        }
        
        
    }
    

    @IBAction func Library(_ sender: Any) {
        
        
        imagePicker.sourceType = .photoLibrary
        self.present(imagePicker, animated: true, completion: nil)
       // performSegue(withIdentifier:"PhotoEditScreen", sender: self)
        
    }
    
    
    
    
    
    
    
    

}

