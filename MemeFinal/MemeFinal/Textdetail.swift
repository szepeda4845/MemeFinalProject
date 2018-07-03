//
//  Textdetail.swift
//  MemeFinal
//
//  Created by Samuel Zepeda on 6/28/18.
//  Copyright © 2018 Samuel Zepeda. All rights reserved.
//

import Foundation
import UIKit

class Textdetail: NSObject, UITextFieldDelegate {
    
   

    
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        var newText = textField.text! as NSString
        newText = newText.replacingCharacters(in: range, with: string) as NSString
        
        return newText.length <= 20
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        
        return true;
    }
    
    
}

