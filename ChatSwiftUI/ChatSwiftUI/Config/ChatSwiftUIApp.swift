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
        rootView()
    }
    
    func rootView() -> some Scene {
        WindowGroup {
            if let isLogedIn = UserDefaultHelper.shared.isLogedIn, isLogedIn {
                MessagePage(viewModel: MessageViewModel())
            } else {
                LoginPage()
            }
        }
    }
    
}
