//
//  Extensions.swift
//  GrokJSON
//
//  Created by Fernando Augusto de Marins on 02/05/16.
//  Copyright © 2016 FernandoMarins. All rights reserved.
//

import UIKit

// MARK: - Alert Extension -
extension UIViewController {
    
    func alertViewWithTitle(title:String, message:String) {
        
        // UIAlertController
        let alert = UIAlertController(title: title, message: message, preferredStyle: .Alert)
        alert.addAction(UIAlertAction(title: "OK", style: .Default, handler: nil))
        presentViewController(alert, animated: true, completion: nil)
        
    }
}