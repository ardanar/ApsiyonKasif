//
//  AuthInterceptor.swift
//  ApsiyonKasif
//
//  Created by Arda Nar on 27.07.2024.
//

import Alamofire
import Foundation

class AuthInterceptor: RequestInterceptor {
    private let retryLimit = 6
    private let retryDelay: TimeInterval = 10

    func adapt(_ urlRequest: URLRequest, for session: Session, completion: @escaping (Result<URLRequest, Error>) -> Void) {
        var request = urlRequest
        if let token = UserDefaults.standard.string(forKey: "authToken") {
            request.setValue("Bearer \(token)", forHTTPHeaderField: "Authorization")
        }
        completion(.success(request))
    }

    func retry(_ request: Request, for session: Session, dueTo error: Error, completion: @escaping (RetryResult) -> Void) {
        let response = request.task?.response as? HTTPURLResponse
        if let statusCode = response?.statusCode, statusCode == 401, request.retryCount < retryLimit {
            completion(.retryWithDelay(retryDelay))
        } else {
            completion(.doNotRetry)
        }
    }
}

