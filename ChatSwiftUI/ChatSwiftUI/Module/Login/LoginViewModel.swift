//
//  LoginViewModel.swift
//  ChatSwiftUI
//
//  Created by Apple on 11/3/21.
//

import Foundation
import Firebase
import SwiftUI


class LoginViewModel: ObservableObject {
    @Published var isLoginMode = true
    @Published var email = ""
    @Published var password = ""
    @Published var errorMessage = ""
    @Published var showImagePicker = false
    @Published var imgAvatar: UIImage?
    @Published var isPush = false
    
    init() {}
    
    func createAccount() {
        FirebaseManager.shared.signup(email: email, password: password) { (result) in
            switch result {
            case .success(let data):
                self.errorMessage = ""
                print("Create a new account successfully!", data?.user.email as Any)
                self.saveImage(image: self.imgAvatar ?? UIImage(systemName: "person")!)
            case .failure(let error):
                self.errorMessage = error.localizedDescription
            }
        }
    }
    
    func login() {
        FirebaseManager.shared.login(email: email, password: password) { (result) in
            switch result {
            case .success:
                self.errorMessage = ""
                print("Login is successfullly!")
                self.isPush = true
            case .failure(let error):
                self.isPush = false
                self.errorMessage = error.localizedDescription
            }
        }
    }
    
    func saveImage(image: UIImage) {
        FirebaseManager.shared.persistImageIntoStoage(image: image) { (result) in
            switch result {
            case .failure(let error):
                self.errorMessage = error.localizedDescription
            case .success(let url):
                self.errorMessage = ""
                FirebaseManager.shared.saveToFirestore(email: self.email, imageUrl: url) { str in
                    if let errorStr = str {
                        print(errorStr)
                    }
                    print("Save User to firestore successfully!")
                }
            }
        }
    }
    
 
}
