//
//  ReservationListViewModel.swift
//  ApsiyonKasif
//
//  Created by Arda Nar on 27.07.2024.
//

import SwiftUI
import Combine
import Alamofire

class ReservationListViewModel: ObservableObject {
    @Published var reservations: [Reservation] = []
    @Published var isLoading: Bool = false
    @Published var errorMessage: String?
    
    private var cancellables = Set<AnyCancellable>()
    private let session: Session
    private let baseUrl = "https://api.mlsadpu.com/Appointment/AdvertWithAppointments"
    
    init() {
        
        let token = UserDefaults.standard.string(forKey: "authToken") ?? ""
        let interceptor = AuthInterceptor()
        self.session = Session(interceptor: interceptor)
    }
    
    func fetchReservations() {
        isLoading = true
        errorMessage = nil
        
        session.request(baseUrl)
            .validate()
            .responseDecodable(of: [Reservation].self) { [weak self] response in
                self?.isLoading = false
                
                switch response.result {
                case .success(let reservations):
                    self?.reservations = reservations
                case .failure(let error):
                    self?.errorMessage = error.localizedDescription
                }
            }
    }
}
