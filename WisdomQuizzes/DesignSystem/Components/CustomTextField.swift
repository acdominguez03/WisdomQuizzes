//
//  CustomTextField.swift
//  WisdomQuizzes
//
//  Created by Andres Cordón on 5/1/25.
//

import SwiftUI

struct CustomTextField: View {
    var title: String
    @Binding var text: String
    var onChange: () -> Void = {}
    
    var body: some View {
        VStack(alignment: .leading, spacing: 5) {
            Text(title)
                .mediumStyle(size: 14, color: .black)
            TextField(title, text: $text)
                .padding(12)
                .regularStyle(size: 14, color: .black)
                .background(
                    RoundedRectangle(cornerRadius: 8).fill(Color.white)
                )
                .onChange(of: text) { oldValue, newValue in
                    onChange()
                }
        }
    }
}

#Preview {
    CustomTextField(title: "User", text: .constant("Enter Your User"), onChange: {})
}

