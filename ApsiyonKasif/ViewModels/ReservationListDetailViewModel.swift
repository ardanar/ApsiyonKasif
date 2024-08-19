//
//  ReservationListDetailViewModel.swift
//  ApsiyonKasif
//
//  Created by Arda Nar on 28.07.2024.
//

import SwiftUI
import Alamofire

class ReservationListDetailViewModel: ObservableObject {
    @Published var availableTimes: [String] = []

    func fetchAvailableTimes(for date: String) {
        let url = "https://api.mlsadpu.com/Appointment/GetAppointmentsByDate?date=\(date)"
        AF.request(url, method: .get, interceptor: AuthInterceptor())
            .responseDecodable(of: [Appointment].self) { response in
                switch response.result {
                case .success(let appointments):
                    DispatchQueue.main.async {
                        self.availableTimes = appointments.map { $0.value }
                    }
                case .failure(let error):
                    print("Error fetching available times: \(error.localizedDescription)")
                }
            }
    }

    func saveSelectedDate(_ date: String) {
        UserDefaults.standard.set(date, forKey: "selectedDate")
    }

    func loadSelectedDate() -> String {
        return UserDefaults.standard.string(forKey: "selectedDate") ?? ""
    }

    func makeReservation(date: String, time: String, completion: @escaping (Result<Void, Error>) -> Void) {
        let url = "https://api.mlsadpu.com/Appointment/CreateAppoinmentByHours"
        let parameters: Parameters = [
            "date": date,
            "hour": time
        ]
        
        AF.request(url, method: .post, parameters: parameters, encoding: JSONEncoding.default, interceptor: AuthInterceptor())
            .response { response in
                switch response.result {
                case .success:
                    completion(.success(()))
                case .failure(let error):
                    completion(.failure(error))
                }
            }
    }
}
