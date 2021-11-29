//
//  InputTextFiled.swift
//  ChatSwiftUI
//
//  Created by Apple on 11/3/21.
//

import Foundation
import SwiftUI



struct InputTextfield: ViewModifier {
    func body(content: Content) -> some View {
        content
            .foregroundColor(.blue)
            .background(Color.gray.opacity(0.1))
            
    }
}

extension View {
    func defaultTextField() -> some View {
       modifier(InputTextfield())
    }
}


