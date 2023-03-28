//
//  Extension + ViewController.swift
//  Starter Project
//
//  Created by MOHAMED ABD ELHAMED AHMED on 28/03/2023.
//

import Foundation
import UIKit

extension UIViewController {
    func alertView(error: String) {
        let alert = UIAlertController(title: "Network Error", message: error, preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
}

extension UIViewController {
    
}
