//
//  DistrictViewModel.swift
//  ApsiyonKasif
//
//  Created by Arda Nar on 27.07.2024.
//

import Foundation
import Combine
import Alamofire

class DistrictViewModel: ObservableObject {
    @Published var districts: [District] = []
    @Published var isLoading: Bool = false
    @Published var errorMessage: String?
    
    private var cancellables = Set<AnyCancellable>()
    private let session: Session

    init() {
        let interceptor = AuthInterceptor()
        session = Session(interceptor: interceptor)
    }

    func fetchDistricts(forCityID cityID: Int) {
        let url = "https://api.mlsadpu.com/county/\(cityID)"
        
        isLoading = true
        errorMessage = nil
        
        session.request(url, method: .get)
            .validate()
            .publishData()
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { completion in
                self.isLoading = false
                
                switch completion {
                case .finished:
                    break
                case .failure(let error):
                    self.errorMessage = "AF request hatası: \(error.localizedDescription)"
                    print("AF request hatası: \(error.localizedDescription)")
                }
            }, receiveValue: { dataResponse in
                guard let data = dataResponse.data else {
                    self.errorMessage = "Veri alınamadı"
                    print("Veri alınamadı")
                    return
                }
                
                do {
                    let districts = try JSONDecoder().decode([District].self, from: data)
                    self.districts = districts
                    print("Fetched districts: \(districts)")
                } catch {
                    self.errorMessage = "JSON decode hatası: \(error.localizedDescription)"
                    print("JSON decode hatası: \(error.localizedDescription)") 
                }
            })
            .store(in: &cancellables)
    }
}
