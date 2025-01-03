//
//  WisdomQuizzesApp.swift
//  WisdomQuizzes
//
//  Created by Andres Cordón on 3/1/25.
//

import SwiftUI

@main
struct WisdomQuizzesApp: App {
    var body: some Scene {
        WindowGroup {
            LoginView(viewModel: LoginViewModel())
        }
    }
}
