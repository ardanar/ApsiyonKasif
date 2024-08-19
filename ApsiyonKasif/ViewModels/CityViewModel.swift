//
//  CityViewModel.swift
//  ApsiyonKasif
//
//  Created by Arda Nar on 26.07.2024.
//

import Foundation
import Combine
import Alamofire

class CityViewModel: ObservableObject {
    @Published var cities: [City] = []
    @Published var isLoading: Bool = false
    @Published var errorMessage: String?
    
    private var cancellables = Set<AnyCancellable>()
    private let session: Session

    init() {
        let interceptor = AuthInterceptor()
        session = Session(interceptor: interceptor)
    }

    func fetchCities() {
        let url = "https://api.mlsadpu.com/City/Cities" 

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
                    let cities = try JSONDecoder().decode([City].self, from: data)
                    self.cities = cities
                    print("Fetched cities: \(cities)")
                } catch {
                    self.errorMessage = "JSON decode hatası: \(error.localizedDescription)"
                    print("JSON decode hatası: \(error.localizedDescription)")
                }
            })
            .store(in: &cancellables)
    }
}
