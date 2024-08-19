//
//  CreateAdvertViewModel.swift
//  ApsiyonKasif
//
//  Created by Arda Nar on 28.07.2024.
//

import Alamofire
import Foundation

class CreateAdvertViewModel: ObservableObject {
    
    let token: String = "your_access_token"
    
    
    private lazy var session: Session = {
        let interceptor = AuthInterceptor()
        return Session(interceptor: interceptor)
    }()

    func createAdvert(price: Decimal, advertTypeId: Int, homeId: Int) {
        let url = "https://api.mlsadpu.com/Advert/CreateAdvert"
        
        let parameters: [String: Any] = [
            "price": price,
            "advertTypeId": advertTypeId,
            "homeId": homeId
        ]
        
        session.request(url, method: .post, parameters: parameters, encoding: JSONEncoding.default)
            .validate()
            .responseJSON { response in
                switch response.result {
                case .success(let data):
                    print("Successfully created advert: \(data)")
                case .failure(let error):
                    print("Failed to create advert: \(error)")
                    if let data = response.data {
                        print("Response data: \(String(data: data, encoding: .utf8) ?? "No response data")")
                    } else {
                        print("No response data")
                    }
                }
            }
    }
}
