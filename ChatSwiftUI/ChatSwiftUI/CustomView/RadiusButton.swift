//
//  RadiusButton.swift
//  ChatSwiftUI
//
//  Created by Apple on 11/3/21.
//

import Foundation
import SwiftUI

struct RadiusButton: ViewModifier {
    func body(content: Content) -> some View {
        content
            .frame(width: 300, height: 40, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
            .background(Color.blue)
            .foregroundColor(.white)
            .cornerRadius(10)
            .font(.system(size: 14, weight: .semibold))
    }
}

extension View {
    func radiusButton() -> some View {
        modifier(RadiusButton())
    }
}
