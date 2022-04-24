//
//  ApiManager.swift
//  TatvasoftPracticalTest
//
//  Created by Dhruv Rajpurohit on 24/04/22.
//

import Foundation
import Alamofire

class ApiManager: NSObject {
    
    static let shared: ApiManager = ApiManager()
    
    /// Base URl for api call
    let baseUrl = "http://sd2-hiring.herokuapp.com/api/"
    
    /// fetch User Details
    func fetchUserdata(userURL: String, completion: @escaping (_ userResult: UserData) -> Void) {
        let request = AF.request(baseUrl + userURL)
        request.responseData { response in
            switch response.result {
            case .success(let data):
                do {
                    let resp = try JSONDecoder().decode(Base.self, from: data)
                    completion(resp.data!)
                } catch {
                    
                }
            case .failure(let error):
                break
            }
        }
    }
    
}
