//
//  UserProfileViewController+TableView.swift
//  Hazem-HSSTask
//
//  Created by Hazem Mohammed on 01/02/2021.
//

import UIKit

extension UserProfileViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return userAlbums?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "UserAlbumsTableViewCell", for: indexPath) as! UserAlbumsTableViewCell
        
        if let album = userAlbums?[indexPath.row] {
            
            cell.configerCell(withAlbum: album)
        } else {
            
            AlertController.showAlert(title: "Error", message: "This Album Is Not Available Right Now", VC: self)
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if let album = userAlbums?[indexPath.row] {
            
            selectedAlbum = album
            print("SELECTED IS : \(selectedAlbum)")
            self.performSegue(withIdentifier: "goToDetails", sender: nil)
            
        } else {
            
            AlertController.showAlert(title: "Error", message: "This Album Is Not Available Right Now", VC: self)
        }
    }
}
