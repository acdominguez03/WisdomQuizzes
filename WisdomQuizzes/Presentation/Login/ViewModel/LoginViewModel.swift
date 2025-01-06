//
//  LoginViewModel.swift
//  WisdomQuizzes
//
//  Created by Andres Cordón on 3/1/25.
//

import Foundation

@Observable
@MainActor final class LoginViewModel {
    let loginUseCase: LoginUseCaseProtocol!
    
    var errorMessage: String = ""
    var username: String = ""
    var password: String = ""
    
    var showAlert: Bool = false
    var isLoading: Bool = false
    
    init(loginUseCase: LoginUseCaseProtocol = LoginUseCase()) {
        self.loginUseCase = loginUseCase
    }
    
    func login() async throws {
        isLoading = true
        let result = try await loginUseCase.execute(username: username, password: password)
        switch result {
        case .success(let loginBO):
            self.isLoading = false
            self.errorMessage = loginBO.accessToken
            self.showAlert = true
        case .failure(let error):
            self.isLoading = false
            self.errorMessage = error.message
            self.showAlert = true
        }
    }
}
