//
//  UserRepositoryProtocol.swift
//  WisdomQuizzes
//
//  Created by Andres Cordón on 3/1/25.
//

import Foundation

protocol UserRepositoryProtocol {
    func login(username: String, password: String) async throws -> LoginBO
}
