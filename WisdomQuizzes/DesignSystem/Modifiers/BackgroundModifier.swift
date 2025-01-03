//
//  BackgroundModifier.swift
//  WisdomQuizzes
//
//  Created by Andres Cordón on 11/11/24.
//

import Foundation
import SwiftUI

struct BackgroundModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .padding(.top, 20)
            .padding(.horizontal, 20)
            .containerRelativeFrame([.horizontal, .vertical])
            .background(Color("Background"))
    }
}
