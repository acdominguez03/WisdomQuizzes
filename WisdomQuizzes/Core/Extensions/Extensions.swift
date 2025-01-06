//
//  Extensions.swift
//  WisdomQuizzes
//
//  Created by Andres Cordón on 5/1/25.
//

import SwiftUI

extension View {
    @ViewBuilder
    func shimmer(when isLoading: Binding<Bool>) -> some View {
        if isLoading.wrappedValue {
            self.modifier(Shimmer())
                .redacted(reason: isLoading.wrappedValue ? .placeholder : [])
        } else {
            self
        }
    }
    
    func titleStyle(size: CGFloat) -> some View {
        modifier(Title(size: size))
    }
    
    func mediumStyle(size: CGFloat, color: Color) -> some View {
        modifier(Medium(size: size, color: color))
    }
    
    func regularStyle(size: CGFloat, color: Color) -> some View {
        modifier(Regular(size: size, color: color))
    }
    
    func regularButtonStyle() -> some View {
        modifier(RegularButton())
    }
    
    func boldStyle(size: CGFloat, color: Color) -> some View {
        modifier(Bold(size: size, color: color))
    }
    
    func semiBoldStyle() -> some View {
        modifier(SemiBold())
    }
}
