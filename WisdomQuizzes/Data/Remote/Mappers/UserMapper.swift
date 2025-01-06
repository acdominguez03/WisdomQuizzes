//
//  UserMapper.swift
//  WisdomQuizzes
//
//  Created by Andres Cordón on 5/1/25.
//

import Foundation

enum UserMapper {
    static func toLoginBO(input response: LoginDTO) -> LoginBO {
        return LoginBO(
            accessToken: response.accessToken ?? "",
            refreshToken: response.refreshToken ?? ""
        )
    }
}
