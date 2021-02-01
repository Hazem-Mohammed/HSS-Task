//
//  APIConstant.swift
//  Hazem-HSSTask
//
//  Created by Hazem Mohammed on 01/02/2021.
//

import Foundation

class APIConstant {
    
    private static var baseURL: String = "https://jsonplaceholder.typicode.com/"
    
    enum API: String {
        
        case users = "users"
        case albums = "albums"
        case userId = "?userId"
        case albumId = "?albumId"
        case photos = "photos"
    }
    
    class func getUrl() -> String {
        
        return baseURL
    }
}
