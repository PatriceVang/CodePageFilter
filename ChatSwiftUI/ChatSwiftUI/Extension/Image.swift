//
//  Image.swift
//  ChatSwiftUI
//
//  Created by Apple on 11/16/21.
//

import Foundation
import SwiftUI


extension Image {
    func borderAndRadius(size: CGFloat = 14, color: Color, radius: CGFloat, lineWidth: CGFloat = 1) -> some View {
        return self
            .font(.system(size: size))
            .overlay(RoundedRectangle(cornerRadius: radius).stroke(color, lineWidth: lineWidth))
    }
    
    func setRadius(size: CGFloat = 14, color: Color, radius: CGFloat, lineWidth: CGFloat = 1) -> some View {
        return self
            .font(.system(size: size))
            .overlay(RoundedRectangle(cornerRadius: radius))
    }
}
