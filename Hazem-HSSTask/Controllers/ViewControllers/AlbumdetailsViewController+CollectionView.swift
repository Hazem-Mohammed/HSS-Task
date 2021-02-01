//
//  AlbumdetailsViewController+CollectionView.swift
//  Hazem-HSSTask
//
//  Created by Hazem Mohammed on 01/02/2021.
//

import UIKit

extension AlbumdetailsViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return filterdPhoto?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "AlbumPhotoCollectionViewCell", for: indexPath) as! AlbumPhotoCollectionViewCell
        
        if let albumPhoto = filterdPhoto?[indexPath.item] {
            
            cell.configerCell(withImages: albumPhoto)
        } else {
            
            AlertController.showAlert(title: "Error", message: "This Album Photo Is Not Available Right Now", VC: self)
        }
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        if let photo = filterdPhoto?[indexPath.row] {
            
            selectedPhoto = photo.url
            print("SELECTED IS : \(selectedAlbum)")
            self.performSegue(withIdentifier: "goToImageViewer", sender: nil)
            
        } else {
            
            AlertController.showAlert(title: "Error", message: "This Album Is Not Available Right Now", VC: self)
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        
        return UIEdgeInsets(top: 8, left: 4, bottom: 8, right: 4)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        
        return CGFloat(8)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let cellWidth = (view.bounds.size.width - 32) / 3
        let cellHeight = cellWidth * 1.2
        
        return CGSize(width: cellWidth, height: cellHeight)
    }
}
