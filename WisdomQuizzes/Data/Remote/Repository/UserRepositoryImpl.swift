//
//  UsersRepositoryImpl.swift
//  WisdomQuizzes
//
//  Created by Andres Cordón on 5/1/25.
//

import Foundation

struct UserRepositoryImpl {
    
    let remote: RemoteDataSource
    
    private init(remote: RemoteDataSource = RemoteDataSource.shared) {
        self.remote = remote
    }
    
    static let shared: UserRepositoryImpl = UserRepositoryImpl(remote: RemoteDataSource.shared)
}

extension UserRepositoryImpl: UserRepositoryProtocol {
    func login(username: String, password: String) async throws -> LoginBO {
        do {
            let result = try await remote.login(username: username, password: password)
            
            return UserMapper.toLoginBO(input: result.data)
        } catch {
            throw error
        }
    }
}
