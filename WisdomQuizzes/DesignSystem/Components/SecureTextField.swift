//
//  PasswordTextField.swift
//  WisdomQuizzes
//
//  Created by Andres Cordón on 11/11/24.
//

import SwiftUI

struct SecureTextField: View {
    
    static let eyeIcon: String = "eye"
    static let eyeSlashIcon: String = eyeIcon + ".slash"
    
    var title: String
    @Binding var text: String
    @State var isSecure: Bool = true
    
    var body: some View {
        VStack(alignment: .leading, spacing: 5) {
            Text(title)
                .mediumStyle(size: 14, color: .black)
            
            ZStack(alignment: .trailing) {
                
                if(isSecure) {
                    SecureField(title, text: $text)
                        .textFieldStyle(SecureTextFieldStyle())
                } else {
                    TextField(title, text: $text)
                        .textFieldStyle(SecureTextFieldStyle())
                }

                Button(action: {
                    isSecure.toggle()
                }, label: {
                    Image(systemName: !isSecure ? SecureTextField.eyeSlashIcon: SecureTextField.eyeIcon)
                        .foregroundStyle(Color("Placeholder"))
                        .padding(12)
                })
            }.animation(.easeInOut(duration: 0.3), value: isSecure)
        }
    }
    
}

#Preview {
    SecureTextField(title: "Password", text: .constant("Password"))
}
