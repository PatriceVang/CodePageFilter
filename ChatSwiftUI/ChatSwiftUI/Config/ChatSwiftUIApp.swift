//
//  ChatSwiftUIApp.swift
//  ChatSwiftUI
//
//  Created by Apple on 11/2/21.
//

import SwiftUI
import Firebase

@main
struct ChatSwiftUIApp: App {
    
    init() {
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            LoginPage()
        }
    }
}
