//
//  AlbumDetailsViewController.swift
//  Starter Project
//
//  Created by MOHAMED ABD ELHAMED AHMED on 28/03/2023.
//

import UIKit

class AlbumDetailsViewController: BaseWireFrame {

    @IBOutlet weak var uiFullImage: UIImageView!
    var photoUrl: String = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        setup(url: photoUrl)
    }
    
   private func setup(url: String) {
        uiFullImage.setImageFromStringrURL(photo: uiFullImage, stringUrl: url)
    }
}
