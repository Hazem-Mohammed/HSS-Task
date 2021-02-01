//
//  AlbumdetailsViewController+SearchBarDelegate.swift
//  Hazem-HSSTask
//
//  Created by Hazem Mohammed on 01/02/2021.
//

import UIKit

extension AlbumdetailsViewController: UISearchBarDelegate {
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
        filterdPhoto = []
        
        if searchText == "" {
            
            filterdPhoto = albumPhotos
        } else {
            
            filterdPhoto = albumPhotos?.filter { $0.title.contains(searchText.lowercased()) }
        }
        
        self.albumPhotosCollectionView.reloadData()
    }
}
