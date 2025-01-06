//
//  CustomFontModifiers.swift
//  WisdomQuizzes
//
//  Created by Andres Cordón on 11/11/24.
//

import SwiftUI


struct Title: ViewModifier {
    var size: CGFloat
    
    func body(content: Content) -> some View {
        content
            .font(Font.custom("Poppins-ExtraBold", size: size))
            .foregroundStyle(.black)
    }
}

struct Medium: ViewModifier {
    var size: CGFloat
    var color: Color
    
    func body(content: Content) -> some View {
        content
            .font(Font.custom("Poppins-Medium", size: size))
            .foregroundStyle(color)
    }
}

struct Regular: ViewModifier {
    var size: CGFloat
    var color: Color
    
    func body(content: Content) -> some View {
        content
            .font(Font.custom("Poppins-Regular", size: size))
            .foregroundStyle(color)
    }
}

struct RegularButton: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(Font.custom("Poppins-Regular", size: 18))
            .foregroundStyle(.white)
    }
}

struct Bold: ViewModifier {
    var size: CGFloat
    var color: Color
    
    func body(content: Content) -> some View {
        content
            .font(Font.custom("Poppins-Bold", size: size))
            .foregroundStyle(color)
    }
}

struct SemiBold: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(Font.custom("Poppins-SemiBold", size: 25))
            .foregroundStyle(.black)
    }
}
