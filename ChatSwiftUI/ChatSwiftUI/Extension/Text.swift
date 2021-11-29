//
//  Text.swift
//  ChatSwiftUI
//
//  Created by Apple on 11/16/21.
//

import Foundation
import SwiftUI

extension Text {
    func setFont(size: CGFloat = 14, weight: Font.Weight = .regular) -> some View {
        return self
            .font(.system(size: size))
            .fontWeight(weight)
//            .foregroundColor(color)
    }
}
