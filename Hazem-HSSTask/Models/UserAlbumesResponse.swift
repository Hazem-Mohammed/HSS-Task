//
//  UserAlbumesResponse.swift
//  Hazem-HSSTask
//
//  Created by Hazem Mohammed on 01/02/2021.
//

import Foundation

struct UserAlbumesResponse: Codable {
    
    let userId: Int
    let id: Int
    let title: String
    
    init() {
        userId = 0
        id = 0
        title = ""
    }
}
