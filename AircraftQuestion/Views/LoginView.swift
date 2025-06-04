//
//  SwiftUIView.swift
//  AeroPass
//
//  Created by 신동현 on 5/27/25.
//

import SwiftUI

struct LoginView: View {
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var checkLogin: Bool = false
    @StateObject private var loginViewModel = LoginViewModel()
    
    var body: some View {
        VStack (alignment: .leading){
            Text("Login")
                .font(.largeTitle)
                .bold()
                .foregroundColor(Color.tealOne)
            
            TextField("이메일", text: $email)
                .keyboardType(.emailAddress)
                .font(.headline)
                .padding()
                .background(Color.gray.opacity(0.1))
                .cornerRadius(3)
                .autocorrectionDisabled()
                .autocapitalization(.none)
            
            SecureField("비밀번호", text: $password)
                .padding()
                .font(.headline)
                .background(Color.gray.opacity(0.1))
                .cornerRadius(3)
                .autocorrectionDisabled()
                .autocapitalization(.none)
            HStack {
                Button {
                    checkLogin = !checkLogin
                } label: {
                    if checkLogin == false {
                        Image("BeforeCheckBoxBtn")
                            .resizable()
                            .frame(width: 20, height: 20)
                    } else {
                        Image("AftercheckBoxBtn")
                            .resizable()
                            .frame(width: 20, height: 20)
                    }
                }
                Text("로그인 유지")
                    .font(.caption)
                    .foregroundColor(Color.gray)
            }
            .padding(.bottom, 2)
            .padding(.top, 2)
            
            Button(action: {
                loginViewModel.login(email: email, password: password)
            }, label: {
                Text("Login")
                    .font(.headline)
                    .frame(maxWidth: .infinity)
                    .padding()
                    .foregroundColor(.white)
            })
            .disabled(email.isEmpty || password.isEmpty)
            .background(Color.tealOne)
            .cornerRadius(3)
            
            
        }
        .padding(20)
        
        
    }
    
}

#Preview {
    LoginView()
}

