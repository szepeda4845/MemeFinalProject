//
//  ViewTwo.swift
//  MemeFinal
//
//  Created by Samuel Zepeda on 6/21/18.
//  Copyright © 2018 Samuel Zepeda. All rights reserved.
//

import UIKit
import Foundation

class ViewTwo: UIViewController, UIImagePickerControllerDelegate,
UINavigationControllerDelegate, UITextFieldDelegate, UIScrollViewDelegate{
    
    
    @IBOutlet weak var exitButton: UIButton!
    @IBOutlet weak var genButton: UIButton!
    
 
    @IBOutlet var scrollView: UIScrollView!
    @IBOutlet var imageView: UIImageView!
    
    
    @IBOutlet weak var textView: UIView!
    @IBOutlet weak var topText: UITextField!
    @IBOutlet weak var bottomText: UITextField!
    var memedImage: UIImage!
    
    //  @IBOutlet weak var imageview: UIImageView!
    var imageforView: UIImage!
    
    let textDetailDelegate = Textdetail()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        
        
////////      scrollView Items
        
        self.topText.delegate = textDetailDelegate
        self.bottomText.delegate = textDetailDelegate
        
       self.scrollView.minimumZoomScale = 1.0
       self.scrollView.maximumZoomScale = 6.0
        
/////// imageView Items
        
       imageView.image = imageforView
        
/////// Text Field items
        self.topText.delegate = textDetailDelegate
        
        
        let gesture = UIPanGestureRecognizer(target: self, action: #selector(draggingView))
        let gesture2 = UIPanGestureRecognizer(target: self, action: #selector(draggingView))
        
        topText.addGestureRecognizer(gesture)
        bottomText.addGestureRecognizer(gesture2)
        
    
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        subscribetoKeyBoardNotifications()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated )
        unsubscribeFromKeyboardNotification()
    }
    
    
    
    override var prefersStatusBarHidden: Bool{
        get {return true}
    }
    
    
    
    // Create a UIImage that combines the Image View and the Textfields
   @IBAction func generateMemedImage(){

     //   configureBars(hidden: true)

        // render view to an image
         exitButton.isHidden = true
         genButton.isHidden = true
         topText.endFloatingCursor()
         bottomText.endFloatingCursor()
    
        UIGraphicsBeginImageContext(self.view.frame.size)
        self.view.drawHierarchy(in: self.view.frame, afterScreenUpdates: true)
        memedImage = UIGraphicsGetImageFromCurrentImageContext()!
        UIGraphicsEndImageContext()

      performSegue(withIdentifier:"finalPass", sender: self)
    
      
    }

    override func prepare(for segue: UIStoryboardSegue , sender: Any?) {
        
       
        let editToFinal = segue.destination as? FinishShare 
        editToFinal?.finalImage = memedImage
       

   }
    
 
    @IBAction func unwindtoSecondView(_ sender : UIStoryboardSegue){
        
        
        exitButton.isHidden = false
        genButton.isHidden = false
    }
    
    
////////////////    scroll View Items

    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return self.imageView
    }


    
    
    @objc func draggingView( _ sender: UIPanGestureRecognizer){
        var point = sender.location(in: view)
        
        if(topText.frame.intersects(bottomText.frame)) {
            
            topText.frame.origin.y = point.y - 78
            bottomText.frame.origin.y = point.y + 26
        }
        
        
        point.x = view.center.x
        if point.y < textView.frame.minY{
            
            point.y = textView.frame.minY + 5
            
        }
        if point.y > textView.frame.maxY{
            
            point.y = textView.frame.maxY - 26
        }
        

        let draggingView = sender.view!
        draggingView.center = point
        
        print(point)
        
        
        if topText.frame.origin.y  <  textView.frame.minY{
            topText.frame.origin.y = textView.frame.minY
            
           
            let draggingView = sender.view!
            draggingView.center = point
            
        }
        
        
        if bottomText.frame.origin.y  >  textView.frame.maxY{
            bottomText.frame.origin.y = textView.frame.maxY
            
            
            let draggingView = sender.view!
            draggingView.center = point
            
        }
        
        
        
        
        
    }
    
    
    
    // KeyBoard Movements
    
    @objc func keyboardWillShow(_ notifications: Notification){
        
        textView.frame.origin.y = -getKeyboardHeight(notifications)
        
    }
    
    @objc func keyboardWillGo(_ notificatons: Notification){
        
        textView.frame.origin.y = +getKeyboardHeight(notificatons)
    }
    
    
    func getKeyboardHeight(_ notification: Notification) -> CGFloat{
        let userInfo = notification.userInfo
        let keyboardSize = userInfo![UIKeyboardFrameEndUserInfoKey] as! NSValue
        return keyboardSize.cgRectValue.height
        
    }
    
    func subscribetoKeyBoardNotifications(){
        
        NotificationCenter.default.addObserver(self, selector: #selector (keyboardWillShow(_ :)), name: .UIKeyboardWillShow, object: nil)
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillGo(_:)), name: .UIKeyboardDidHide, object: nil)
    }
    
    
    func unsubscribeFromKeyboardNotification(){
        
        
        NotificationCenter.default.removeObserver(self, name: . UIKeyboardWillShow, object: nil)
        
    }
    
    
    
    
    
    
    
    
    
    
}
