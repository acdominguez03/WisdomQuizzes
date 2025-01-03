//
//  GetPokemonUseCase.swift
//  WisdomQuizzes
//
//  Created by Andres Cordón on 5/1/25.
//

import Foundation

protocol LoginUseCaseProtocol {
    func execute(username: String, password: String) async throws -> Result<LoginBO, ErrorResponse>
}

struct LoginUseCase: LoginUseCaseProtocol {
    
    let repository: UserRepositoryProtocol
    
    init(repository: UserRepositoryProtocol = UserRepositoryImpl.shared) {
        self.repository = repository
    }
    
    func execute(username: String, password: String) async throws -> Result<LoginBO, ErrorResponse> {
        do {
            let result = try await repository.login(username: username, password: password)
            return .success(result)
        } catch {
            let error = error as? ErrorResponse
            return .failure(ErrorResponse(code: error?.code ?? 504, message: error?.message ?? "No se pudo conectar con el servidor", type: error?.type ?? "ServerError"))
        }
    }
}
