//
//  AlbumPhotoCollectionViewCell.swift
//  Hazem-HSSTask
//
//  Created by Hazem Mohammed on 01/02/2021.
//

import UIKit
import SDWebImage

class AlbumPhotoCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var albumPhotoImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    //MARK:- Class Methods.
    
    func configerCell(withImages images: AlbumPhotosResponse) {
        
        guard let url = URL(string: images.url) else { return }
        albumPhotoImageView.sd_setImage(with: url, completed: nil)
    }

}
