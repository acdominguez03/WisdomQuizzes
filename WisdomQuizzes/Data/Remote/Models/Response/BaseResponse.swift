//
//  BaseResponse.swift
//  WisdomQuizzes
//
//  Created by Andres Cordón on 3/1/25.
//

import Foundation

struct BaseResponse <T: Decodable> : Decodable {
    let code: Int?
    let message: String?
    let data: T
}
