//
//  CustomButton.swift
//  WisdomQuizzes
//
//  Created by Andres Cordón on 11/11/24.
//

import SwiftUI

struct CustomButton: View {
    var title: String
    var isDisabled: Bool = false
    var action: () -> Void
    
    var body: some View {
        Button(action: action) {
            Text(title)
                .regularButtonStyle()
                .frame(maxWidth: .infinity)
                .padding(10)
        }
        .disabled(isDisabled)
        .foregroundStyle(.white)
        .background(isDisabled ? Color("BackgroundResponse") : Color("PrincipalGreen"))
        .clipShape(RoundedRectangle(cornerRadius: 10))
    }
}

#Preview {
    CustomButton(title: "Iniciar Sesión", isDisabled: false, action: {})
}
