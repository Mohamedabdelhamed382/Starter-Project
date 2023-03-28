//
//  HomeTableViewCell.swift
//  Starter Project
//
//  Created by MOHAMED ABD ELHAMED AHMED on 28/03/2023.
//

import UIKit

class HomeTableViewCell: UITableViewCell {

    @IBOutlet weak var uiImagePhoto: UIImageView!
    func setup(url: String) {
        uiImagePhoto.setImageFromStringrURL(photo: uiImagePhoto, stringUrl: url)
    }
    
}
