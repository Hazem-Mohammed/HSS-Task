//
//  ImageViewerViewController.swift
//  Hazem-HSSTask
//
//  Created by Hazem Mohammed on 01/02/2021.
//

import UIKit
import SDWebImage

class ImageViewerViewController: UIViewController {
    
    @IBOutlet weak var selectedPhotoImageView: UIImageView!
    
    var selectedPhoto = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
    }
    
    private func setupUI() {
        
        guard let url = URL(string: selectedPhoto) else { return }
        selectedPhotoImageView.sd_setImage(with: url, completed: nil)
    }
}
