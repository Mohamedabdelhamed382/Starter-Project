//
//  UIImage +  Extension.swift
//  BostaTask
//
//  Created by MOHAMED ABD ELHAMED AHMED on 01/03/2023.
//

import Foundation
import UIKit
extension UIImageView {
    func setImageFromStringrURL(photo: UIImageView,stringUrl: String) {
        if let url = URL(string: stringUrl) {
        URLSession.shared.dataTask(with: url) { (data, response, error) in
          // Error handling...
          guard let imageData = data else { return }

          DispatchQueue.main.async {
            photo.image = UIImage(data: imageData)
          }
        }.resume()
      }
    }
}
