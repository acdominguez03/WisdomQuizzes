//
//  LoginDTO.swift
//  WisdomQuizzes
//
//  Created by Andres Cordón on 3/1/25.
//

import Foundation

struct LoginDTO: Decodable {
    let accessToken: String?
    let refreshToken: String?
}

extension LoginDTO {
    var toLoginBO: LoginBO {
        LoginBO(accessToken: accessToken ?? "", refreshToken: refreshToken ?? "")
    }
}
