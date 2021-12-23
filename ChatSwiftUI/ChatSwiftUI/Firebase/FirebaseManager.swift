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
    
    var uid: String? {
        get {
            return auth.currentUser?.uid
        }
    }
    
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
    
    func signOut(completion: (String?) -> Void) {
        do {
            try auth.signOut()
            completion(nil)
        } catch (let error) {
            completion(error.localizedDescription)
        }
        
    }
    
    
    func persistImageIntoStoage(image: UIImage, completion: @escaping(Result<URL, Error>) -> Void) {
        let ref = storage.reference(withPath: uid ?? "")
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
    
    
    func saveUserToFirestore(email: String, imageUrl: URL, completion: @escaping(String?) -> Void) {
        let userData = [
            "uid": uid ?? "",
            "email": email,
            "avatar": imageUrl.absoluteString
        ]
        firestore.collection("users").document(uid ?? "").setData(userData) { (error) in
            if let error = error {
                completion(error.localizedDescription)
                return
            }
            completion(nil)
        }
    }
    
    func fetchCurrentUser(completion: @escaping(Result<ChatUser, Error>) -> Void) {
        var finalUid = uid ?? ""
        if UserDefaultHelper.shared.isLogedIn == true {
            finalUid = UserDefaultHelper.shared.uid ?? ""
        }
        if finalUid == "" {return}
        
        firestore.collection("users").document(finalUid).getDocument { (snapshot, error) in
            if let error = error {
                completion(.failure(error))
                return
            }
            guard let data = snapshot?.data() else {return}
            let user = ChatUser(json: data)
            completion(.success(user))
            
        }
    }
    
    func fetchAllUser(completion: @escaping(Result<[ChatUser], Error>) -> Void) {
        var users = [ChatUser]()
        firestore.collection("users")
            .whereField("uid", isNotEqualTo: uid as Any)
            .getDocuments { (snapshot, error) in
                if let error = error {
                    completion(.failure(error))
                    return
                }
                snapshot?.documents.forEach {
                    let data = $0.data()
                    let user = ChatUser(json: data)
                    users.append(user)
                }
                completion(.success(users))
            }
    }
    
    func saveMessageToFirestore(fromId: String, toId: String, text: String, completion: @escaping(String?) -> Void) {
        let data: [String: Any] = [
            "fromId": fromId,
            "toId": toId,
            "text": text,
            "timestamp": Timestamp()
        ]
        
        firestore.collection("messages").document(fromId).collection(toId).document().setData(data) { (error) in
            if let error = error {
                completion(error.localizedDescription)
                return
            }
            self.firestore.collection("messages").document(toId).collection(fromId).document().setData(data) { (error) in
                if let error = error {
                    completion(error.localizedDescription)
                    return
                }
                completion(nil)
            }
        }
    }
    
    
    func fetchMessages(fromId: String, toId: String, completion: @escaping(Result<[ChatMessage], Error>) -> Void) {
        var chatMessages = [ChatMessage]()
        firestore.collection("messages").document(fromId).collection(toId)
            .order(by: "timestamp")
            .addSnapshotListener { (snapshot, error) in
                if let error = error {
                    completion(.failure(error))
                    return
                }
                
                snapshot?.documentChanges.forEach({ (change) in
                    if change.type == .added {
                        let data = change.document.data()
                        let documentId = change.document.documentID
                        let chatMessage = ChatMessage(json: data, documentId: documentId)
                        chatMessages.append(chatMessage)
                    }
                })
                completion(.success(chatMessages))
            }
    }
    
    func persistRecentMessage(fromId: String, toId: String, text: String, imgUrl: String, email: String) {
        let data: [String: Any] = [
            "timestamp": Timestamp(),
            "text": text,
            "fromId": fromId,
            "toId": toId,
            "avatar": imgUrl,
            "email": email
        ]
        firestore.collection("recent_messages")
            .document(fromId)
            .collection("messages")
            .document(toId)
            .setData(data) { (error) in
                if error != nil {
                    print("Persitst recent message failed!")
                    return
                }
            }
    }
    
    func fetchRecentMessages(completion: @escaping(Result<[ChatRecent],Error>) -> Void) {
        guard let uid = uid else {return}
        var chatRecents = [ChatRecent]()
        firestore.collection("recent_messages")
            .document(uid)
            .collection("messages")
            .order(by: "timestamp", descending: true)
            .addSnapshotListener { (snapshots, error) in
                if let error = error {
                    completion(.failure(error))
                    return
                }
                
                snapshots?.documentChanges.forEach({ (change) in
                    let data = change.document.data()
                    let documentId = change.document.documentID
                    let chatRecent = ChatRecent(dictionary: data, documentId: documentId)
                    if let index = chatRecents.firstIndex {$0.documentId == chatRecent.documentId} {
                        chatRecents.remove(at: index )
                        chatRecents.insert(chatRecent, at: 0)
                    } else {
                        chatRecents.append(chatRecent)
                    }
                })
                completion(.success(chatRecents))
            }
    }
}
