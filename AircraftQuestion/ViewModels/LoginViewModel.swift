//
//  LoginViewModel.swift
//  AeroPass
//
//  Created by 신동현 on 5/29/25.
//

import Foundation

class LoginViewModel: ObservableObject{
    func login(email: String, password: String) {
        Task {
            do {
                let response = try await APIService.shared.postRequest(
                    apiUrl: "/login",
                    parameters: ["email": email, "password": password],
                    responseType: LoginResponse.self
                )
                print("✅ 로그인 성공: \(response.email)")
            } catch {
                print("❌ 로그인 실패: \(error.localizedDescription)")
            }
        }
    }
    
}
