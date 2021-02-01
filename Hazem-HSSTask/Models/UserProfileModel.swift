//
//  UserProfileModel.swift
//  Hazem-HSSTask
//
//  Created by Hazem Mohammed on 01/02/2021.
//

import Foundation

struct UserProfileModel: Codable {
    
    let id: Int
    let name: String
    let address: Address
}

// MARK: - Address
struct Address: Codable {
    
    let street: String
    let suite: String
    let city: String
    let zipcode: String
    
    func getFullAddress() -> String {
        
        return "\(street), \(suite), \(city), \(zipcode)"
    }
}
