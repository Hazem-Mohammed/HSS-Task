//
//  UserAlbumsTableViewCell.swift
//  Hazem-HSSTask
//
//  Created by Hazem Mohammed on 01/02/2021.
//

import UIKit

class UserAlbumsTableViewCell: UITableViewCell {

    @IBOutlet weak var albumNameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        selectionStyle = .none
    }
    
    //MARK:- Class Methods.
    
    func configerCell(withAlbum album: UserAlbumesResponse) {
        
        self.albumNameLabel.text = album.title
    }
}
