//
//  NeighbourhoodViewModel.swift
//  ApsiyonKasif
//
//  Created by Arda Nar on 27.07.2024.
//

import Foundation
import Alamofire
import Combine

class NeighbourhoodViewModel: ObservableObject {
    @Published var neighbourhoods: [Neighbourhood] = []
    @Published var isLoading: Bool = false
    @Published var errorMessage: String?

    private var cancellables = Set<AnyCancellable>()
    private let session: Session

    init() {
        let interceptor = AuthInterceptor()
        session = Session(interceptor: interceptor)
    }

    func fetchNeighbourhoods(forCountyID districtId: Int) {
        guard districtId != 0 else {
            self.errorMessage = "Invalid district ID"
            return
        }

        let url = "https://api.mlsadpu.com/district/\(districtId)"
        isLoading = true
        errorMessage = nil

        session.request(url)
            .validate()
            .publishData()
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { completion in
                self.isLoading = false
                
                switch completion {
                case .finished:
                    break
                case .failure(let error):
                    self.errorMessage = "Request error: \(error.localizedDescription)"
                    print("Request error: \(error.localizedDescription)")
                }
            }, receiveValue: { dataResponse in
                guard let data = dataResponse.data else {
                    self.errorMessage = "No data received"
                    print("No data received")
                    return
                }
                
                do {
                    let neighbourhoods = try JSONDecoder().decode([Neighbourhood].self, from: data)
                    self.neighbourhoods = neighbourhoods
                } catch {
                    self.errorMessage = "JSON decode error: \(error.localizedDescription)"
                    print("JSON decode error: \(error.localizedDescription)") 
                }
            })
            .store(in: &cancellables)
    }
}
