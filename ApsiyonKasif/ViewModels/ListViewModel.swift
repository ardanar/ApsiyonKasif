//
//  ListViewModel.swift
//  ApsiyonKasif
//
//  Created by Arda Nar on 27.07.2024.
//

import SwiftUI
import Alamofire

class ListViewModel: ObservableObject {
    @Published var listings: [Listing] = []
    @Published var isLoading = false
    @Published var errorMessage: String? = nil
    
    private let session: Session
    
    init(session: Session = Session(interceptor: AuthInterceptor())) {
        self.session = session
    }
    
    func fetchListings() {
        isLoading = true
        errorMessage = nil
        
        
        let advertType = UserDefaults.standard.string(forKey: "advertType") ?? "1"
        let advertTypeId = Int(advertType) ?? 1
        
        
        let districtId = UserDefaults.standard.integer(forKey: "neighbourhoodId")
        let cityId = UserDefaults.standard.integer(forKey: "cityId")
        let countyId = UserDefaults.standard.integer(forKey: "districtId")
        
        
        
        
         let url = "https://api.mlsadpu.com/Advert/AdvertDetailWithId?advertTypeId=\(advertTypeId)&cityId=\(cityId)&countyId=\(countyId)&districtId=\(districtId)"
        print(url)
        
        session.request(url)
            .validate()
            .responseDecodable(of: [Listing].self) { response in
                switch response.result {
                case .success(let listings):
                    self.listings = listings
                case .failure(let error):
                    self.errorMessage = error.localizedDescription
                }
                self.isLoading = false
            }
        
        
    }
}
