//
//  NetworkController.swift
//  Hazem-HSSTask
//
//  Created by Hazem Mohammed on 01/02/2021.
//

import Foundation
import Alamofire

class ApiService {
    
    static let shared = ApiService()
    
    func fetchData<T:Codable ,E:Codable>(url:String , parms:Parameters? , headers: HTTPHeaders?, method : HTTPMethod? , Compltion : @escaping((T?, E?, Error?)->Void)) {
        AF.request(url, method: method ?? .get, parameters: parms, encoding: JSONEncoding.default, headers: headers)
            .validate(statusCode: 200 ..< 300)
            .responseJSON { (response) in
                switch response.result {
                case.success(_):
                    do {
                        guard let data = response.data else {return}
                        
                        let ResponseData = try JSONDecoder().decode(T?.self, from: data)
                        Compltion(ResponseData , nil , nil)
                        
                    }
                    catch let JsonErorr {
                        
                        print(JsonErorr)
                        
                    }
                case .failure(let error):
                    let StautsCode = response.response?.statusCode ?? 0
                    if StautsCode > 300 {
                        do {
                            guard let data = response.data else {return}
                            let responseError = try JSONDecoder().decode(E?.self, from: data)
                            Compltion(nil, responseError , nil)
                            
                        }
                        catch let JsonError {
                            print(JsonError)
                        }
                    }else{
                        Compltion(nil, nil , error)
                    }
                }
            }
    }
}
