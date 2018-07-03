//
//  Finish&Share.swift
//  MemeFinal
//
//  Created by Samuel Zepeda on 6/28/18.
//  Copyright © 2018 Samuel Zepeda. All rights reserved.
//

import UIKit
import Foundation

class FinishShare: UIViewController{
    
  
    @IBOutlet weak var viewImage: UIImageView!
    
    var finalImage: UIImage!
    
    
override func viewDidLoad() {
        super.viewDidLoad()
    
    viewImage.image = finalImage
    
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
         let finalToEdit = segue.destination as! ViewTwo 
        finalToEdit.memedImage = viewImage.image
        
        
        
    }
    
    
    
    override var prefersStatusBarHidden: Bool{
        get {return true}
    }
    
    
    
    
}

