//
//  FirebaseManager.swift
//  ChatSwiftUI
//
//  Created by Apple on 11/4/21.
//

import Foundation
import Firebase
import SwiftUI
import FirebaseFirestore

class FirebaseManager {
    
    static let shared = FirebaseManager()
    
    private let auth = Auth.auth()
    private let storage = Storage.storage()
    private let firestore = Firestore.firestore()
    
    private init() {}
    
    func login(email: String, password: String, completion: @escaping(Result<AuthDataResult?, Error>) -> Void) {
        auth.signIn(withEmail: email, password: password) { (result, error) in
            if let error = error {
                completion(.failure(error))
                return
            }
            completion(.success(result))
        }
    }
    
    func signup(email: String, password: String, completion: @escaping(Result<AuthDataResult?, Error>) -> Void) {
        auth.createUser(withEmail: email, password: password) { (result, error) in
            if let error = error {
                completion(.failure(error))
                return
            }
            completion(.success(result))
        }
    }
    
    
    func persistImageIntoStoage(image: UIImage, completion: @escaping(Result<URL, Error>) -> Void) {
        guard let uid = auth.currentUser?.uid else { return }
        let ref = storage.reference(withPath: uid)
        guard let data = image.jpegData(compressionQuality: 0.5) else {return}
        ref.putData(data, metadata: nil) { (metadata, error) in
            if let error = error {
                completion(.failure(error))
                return
            }
            ref.downloadURL { (url, error) in
                if let error = error {
                    completion(.failure(error))
                    return
                }
                completion(.success((url ?? URL(string: ""))!))
            }
        }
    }
    
    
    func saveToFirestore(email: String, imageUrl: URL, completion: @escaping(String?) -> Void) {
        guard let uid = auth.currentUser?.uid else { return }
        let userData = [
            "uid": uid,
            "email": email,
            "avatar": imageUrl.absoluteString
        ]
        firestore.collection("users").document(uid).setData(userData) { (error) in
            if let error = error {
                completion(error.localizedDescription)
                return
            }
            completion(nil)
        }
    }
    
    func fetchCurrentUser(completion: @escaping(Result<ChatUser, Error>) -> Void) {
        guard let uid = auth.currentUser?.uid else {return}
        firestore.collection("users").document(uid).getDocument { (snapshot, error) in
            if let error = error {
                completion(.failure(error))
                return
            }
            guard let data = snapshot?.data() else {return}
            guard let uid = data["uid"] as? String, let email = data["email"] as? String, let avatar = data["avatar"] as? String else {return}
            let user = ChatUser(uid: uid, email: email, avatar: avatar)
            completion(.success(user))
        }
    }
}
