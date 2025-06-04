//
//  APIService.swift
//  AeroPass
//
//  Created by 신동현 on 5/29/25.
//

import Foundation

class APIService {
    static let shared = APIService()
    
    private init() {}
    
    func postRequest<T: Codable>(apiUrl: String, parameters: [String: Any], responseType: T.Type) async throws -> T {
            guard let url = URL(string: "http://localhost:8080/api" + apiUrl) else {
                throw APIError.invalidURL
            }

            guard let jsonData = try? JSONSerialization.data(withJSONObject: parameters) else {
                throw APIError.encodingError
            }

            var request = URLRequest(url: url)
            request.httpMethod = "POST"
            request.setValue("application/json", forHTTPHeaderField: "Content-Type")
            request.setValue("application/json", forHTTPHeaderField: "Accept")
            request.httpBody = jsonData

            let (data, response) = try await URLSession.shared.data(for: request)

            guard let httpResponse = response as? HTTPURLResponse else {
                throw APIError.invalidResponse
            }

            if (200..<300).contains(httpResponse.statusCode) {
                if let accessToken = httpResponse.value(forHTTPHeaderField: "Authorization") {
                    print("서버 응답 토큰:", accessToken)
                    saveKeychain(key: "AccessToken", value: accessToken)
                }
                do {
                    return try JSONDecoder().decode(responseType, from: data)
                } catch {
                    throw APIError.decodingError
                }
            } else {
                if let serverError = try? JSONDecoder().decode(ErrorMessage.self, from: data) {
                    throw APIError.serverError(serverError.message)
                } else {
                    throw APIError.unknown
                }
            }
        }
}
