//
//  ErrorMessage.swift
//  AeroPass
//
//  Created by 신동현 on 5/29/25.
//

import Foundation

struct ErrorMessage: Codable {
    var code: Int
    var message: String
}

enum APIError: Error, LocalizedError {
    case invalidURL
    case encodingError
    case invalidResponse
    case decodingError
    case serverError(String)
    case unknown

    var errorDescription: String? {
        switch self {
        case .invalidURL: return "URL이 잘못되었습니다."
        case .encodingError: return "파라미터 인코딩 실패"
        case .invalidResponse: return "서버 응답이 올바르지 않음"
        case .decodingError: return "응답 디코딩 실패"
        case .serverError(let message): return message
        case .unknown: return "알 수 없는 에러"
        }
    }
}
