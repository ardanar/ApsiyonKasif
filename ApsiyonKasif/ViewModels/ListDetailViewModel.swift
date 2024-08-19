//
//  ListDetailViewModel.swift
//  ApsiyonKasif
//
//  Created by Arda Nar on 27.07.2024.
//

import Foundation
import Alamofire

class ListDetailViewModel: ObservableObject {
    @Published var listDetail: ListDetail?
    @Published var isLoading = false
    @Published var errorMessage: String?
    
    private let session: Session
    
    init() {
        let interceptor = AuthInterceptor()
        self.session = Session(interceptor: interceptor)
    }
    
    func fetchListDetail(for advertId: String) {
        guard let advertIdInt = Int(advertId) else {
            self.errorMessage = "Invalid advertId"
            return
        }
        
        let url = "https://api.mlsadpu.com/Advert/AdvertDetail?advertId=\(advertIdInt)"
        isLoading = true
        
        session.request(url).validate().responseDecodable(of: ListDetail.self) { response in
            self.isLoading = false
            switch response.result {
            case .success(let listDetail):
                self.listDetail = listDetail
                print("Data fetched successfully: \(listDetail)")
            case .failure(let error):
                self.errorMessage = error.localizedDescription
                print("Error fetching data: \(error.localizedDescription)")
            }
        }
    }
}
