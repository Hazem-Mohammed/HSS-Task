//
//  UserProfileViewController.swift
//  Hazem-HSSTask
//
//  Created by Hazem Mohammed on 01/02/2021.
//

import UIKit

class UserProfileViewController: UIViewController {
    
    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var addressLabel: UILabel!
    @IBOutlet weak var userAlbumesTableView: UITableView!
    
    private let progressHUD = ProgressHUD(text: "Loading...")
    var userProfile: UserProfileModel?
    var userAlbums: [UserAlbumesResponse]?
    var selectedAlbum = UserAlbumesResponse()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setTableViewDelegateAndDataSource()
        registerTableViewCell()
        setupTableViewFooter()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
        getUserProfile()
    }
    //MARK:- Class Methods.
    
    private func setTableViewDelegateAndDataSource() {
        
        userAlbumesTableView.delegate = self
        userAlbumesTableView.dataSource = self
    }
    
    private func registerTableViewCell() {
        
        userAlbumesTableView.register(UINib(nibName: "UserAlbumsTableViewCell", bundle: nil), forCellReuseIdentifier: "UserAlbumsTableViewCell")
    }
    
    private func setupTableViewFooter() {
        
        userAlbumesTableView.tableFooterView = UIView()
    }
    
    private func getUserProfile() {
        
        view.addSubview(progressHUD)
        
        let url = "\(APIConstant.getUrl())\(APIConstant.API.users.rawValue)"
        
        ApiService.shared.fetchData(url: url, parms: nil, headers: nil, method: .get) { [weak self] (userProfileSuccessResponse: [UserProfileModel]?, userProfileErrorResponse: [UserProfileModel]?, error) in
            
            
            guard let self = self else {return}
            
            if let error = error {
                
                self.progressHUD.hide()
                AlertController.showAlert(title: "Error", message: error.localizedDescription, VC: self)
                
            } else {
                
                self.userProfile = userProfileSuccessResponse?.first
                print("USER PROFILE : \(String(describing: self.userProfile))")
                self.getUserAlbumes()
                self.updateUserInfo()
                self.progressHUD.hide()
            }
        }
    }
    
    private func getUserAlbumes() {
        
        view.addSubview(progressHUD)
        
        let url = "\(APIConstant.getUrl())\(APIConstant.API.albums.rawValue)\(APIConstant.API.userId.rawValue)=\(userProfile?.id ?? 0)"
        
        ApiService.shared.fetchData(url: url, parms: nil, headers: nil, method: .get) { [weak self] (userAlbumSuccessResponse: [UserAlbumesResponse]?, userAlbumErrorResponse: [UserAlbumesResponse]?, error) in
            
            
            guard let self = self else {return}
            
            if let error = error {
                
                self.progressHUD.hide()
                AlertController.showAlert(title: "Error", message: error.localizedDescription, VC: self)
                
            } else {
                
                self.userAlbums = userAlbumSuccessResponse
                self.progressHUD.hide()
                DispatchQueue.main.async {
                    self.userAlbumesTableView.reloadData()
                }
            }
        }
    }
    
    private func updateUserInfo() {
        
        userNameLabel.text = userProfile?.name
        addressLabel.text = userProfile?.address.getFullAddress()
    }
    
    //MARK:- Navigation.
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if let vc = segue.destination as? AlbumdetailsViewController {
            vc.selectedAlbum = selectedAlbum
        }
    }
}
