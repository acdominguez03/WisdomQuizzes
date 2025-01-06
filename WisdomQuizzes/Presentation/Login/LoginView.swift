//
//  LoginView.swift
//  WisdomQuizzes
//
//  Created by Andres Cordón on 3/1/25.
//

import SwiftUI

struct LoginView: View {
    @State var viewModel: LoginViewModel
    
    var body: some View {
        NavigationStack {
            ZStack {
                
                VStack(spacing: 20) {
                    Spacer()
                    
                    Text("Wisdom Quizzes")
                        .titleStyle(size: 40)
                    
                    CustomTextField(title: "Usuario", text: $viewModel.username)
                    
                    SecureTextField(title: "Contraseña", text: $viewModel.password)
                    
                    HStack(spacing: 0) {
                        Text("¿Has olvidado tu ")
                            .regularStyle(size: 14, color: .black)
                        Text("contraseña?")
                            .boldStyle(size: 14, color: Color("PrincipalGreen"))
                    }
                    
                    let isDisabled = viewModel.username.isEmpty || viewModel.password.isEmpty
                    
                    CustomButton(
                        title: "Iniciar sesión",
                        isDisabled: isDisabled
                    ) {
                        Task {
                            try await viewModel.login()
                        }
                    }
                    
                    Spacer()
                    
                    HStack(spacing: 0) {
                        Text("¿No tienes una cuenta? ")
                            .regularStyle(size: 14, color: .black)
                        NavigationLink("Regístrate", value: "Registro")
                            .boldStyle(size: 14, color: Color("PrincipalGreen"))
                    }
                }
                .modifier(BackgroundModifier())
                
                if (viewModel.isLoading) {
                    VStack {
                        Spacer()
                        ProgressView()
                        Spacer()
                    }
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .background(.black.opacity(0.3))
                }
            }.alert(viewModel.errorMessage, isPresented: $viewModel.showAlert) {
                Button("Aceptar", role: .cancel){}
            }
            .navigationDestination(for: String.self) { value in
                RegisterView()
            }
        }
    }
}

#Preview {
    LoginView(viewModel: LoginViewModel())
}
