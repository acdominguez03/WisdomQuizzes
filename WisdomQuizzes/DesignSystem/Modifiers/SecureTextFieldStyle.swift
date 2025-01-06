//
//  SecureTextFieldStyle.swift
//  WisdomQuizzes
//
//  Created by Andres Cordón on 11/11/24.
//

import Foundation
import SwiftUI

struct SecureTextFieldStyle: TextFieldStyle {
    func _body(configuration: TextField<Self._Label>) -> some View {
        configuration
            .padding(12)
            .regularStyle(size: 14, color: Color.black)
            .foregroundStyle(Color("Placeholder"))
            .background(RoundedRectangle(cornerRadius: 8).fill(Color.white))
    }
    
}
