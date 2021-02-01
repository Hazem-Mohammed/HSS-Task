//
//  AlbumdetailsViewController.swift
//  Hazem-HSSTask
//
//  Created by Hazem Mohammed on 01/02/2021.
//

import UIKit

class AlbumdetailsViewController: UIViewController {
    
    @IBOutlet weak var photosSearchBar: UISearchBar!
    @IBOutlet weak var albumPhotosCollectionView: UICollectionView!
    
    private let progressHUD = ProgressHUD(text: "Loading...")
    var albumPhotos: [AlbumPhotosResponse]?
    var filterdPhoto: [AlbumPhotosResponse]?
    var selectedAlbum = UserAlbumesResponse()
    var selectedPhoto = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        getAlbumPhotos()
    }
    
    //MARK:- Class Methods.
    
    private func setupUI() {
        
        self.title = selectedAlbum.title
        
        setCollectionViewDelegateAndDataSource()
        registerCollectionViewCell()
        setupSearchBarDelegate()
    }
    
    private func setCollectionViewDelegateAndDataSource() {
        
        albumPhotosCollectionView.delegate = self
        albumPhotosCollectionView.dataSource = self
    }
    
    private func registerCollectionViewCell() {
        
        albumPhotosCollectionView.register(UINib(nibName: "AlbumPhotoCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "AlbumPhotoCollectionViewCell")
    }
    
    private func setupSearchBarDelegate() {
        
        photosSearchBar.delegate = self
    }
    
    private func getAlbumPhotos() {
        
        view.addSubview(progressHUD)
        
        let url = "\(APIConstant.getUrl())\(APIConstant.API.photos.rawValue)\(APIConstant.API.albumId.rawValue)=\(selectedAlbum.id)"
        
        ApiService.shared.fetchData(url: url, parms: nil, headers: nil, method: .get) { [weak self] (albumPhotosSuccessResponse: [AlbumPhotosResponse]?, albumPhotosErrorResponse: [AlbumPhotosResponse]?, error) in
            
            
            guard let self = self else {return}
            
            if let error = error {
                
                self.progressHUD.hide()
                AlertController.showAlert(title: "Error", message: error.localizedDescription, VC: self)
                
            } else {
                
                self.albumPhotos = albumPhotosSuccessResponse
                self.filterdPhoto = albumPhotosSuccessResponse
                print("albumPhotos : \(self.albumPhotos)")
                self.progressHUD.hide()
                DispatchQueue.main.async {
                    self.albumPhotosCollectionView.reloadData()
                }
            }
        }
    }
    
    //MARK:- Navigation.
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if let vc = segue.destination as? ImageViewerViewController {
            vc.selectedPhoto = selectedPhoto
        }
    }
}
