//
//  ErrorResponse.swift
//  WisdomQuizzes
//
//  Created by Andres Cordón on 3/1/25.
//

import Foundation

struct ErrorResponse: Decodable, Error {
    let code: Int
    let message: String
    let type: String
}

struct ErrorEntryResponse: Decodable, Error {
    let error: ErrorResponse
}
