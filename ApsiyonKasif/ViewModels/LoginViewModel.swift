//
//  LoginViewModel.swift
//  ApsiyonKasif
//
//  Created by Arda Nar on 21.07.2024.
//

import Foundation
import Combine
import Alamofire

class LoginViewModel: ObservableObject {
    @Published var error: String?
    @Published var isAuthenticated = false
    
    private var cancellables = Set<AnyCancellable>()
    
    func login(email: String, password: String) {
        guard let url = URL(string: "https://api.mlsadpu.com/auth") else { return }
        
        let parameters: [String: String] = ["email": email, "password": password]
        
        AF.request(url, method: .post, parameters: parameters, encoding: JSONEncoding.default)
            .validate()
            .publishDecodable(type: LoginResponse.self)
            .compactMap { $0.value }
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { completion in
                switch completion {
                case .finished:
                    break
                case .failure(let error):
                    self.error = error.localizedDescription
                }
            }, receiveValue: { response in
                if response.token.isEmpty {
                    self.error = "Geçersiz e-posta veya parola"
                } else {
                    print("Token: \(response.token)")
                    self.isAuthenticated = true
                    self.saveToken(response.token)
                }
            })
            .store(in: &cancellables)
    }
    
    private func saveToken(_ token: String) {
        UserDefaults.standard.set(token, forKey: "authToken")
    }
    
    func getToken() -> String? {
        return UserDefaults.standard.string(forKey: "authToken")
    }
}

struct LoginResponse: Codable {
    let token: String
}
