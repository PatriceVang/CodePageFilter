//
//  UserDB.swift
//  DemoTodoWithCloudFirestore
//
//  Created by Apple on 10/5/20.
//

import Foundation
import Firebase


protocol FeatureDB {
    associatedtype T
    var ref: DocumentReference? {get set}
    func add(entity: T)
    func getAll(completion: @escaping([T]) -> Void)
    func delete(entity: T)
}




class UserDB: FeatureDB {
    
    
    typealias T = User
    
    static let shared = UserDB()
    
    var ref: DocumentReference? = nil
    let db = Firestore.firestore()
    
    
    func add(entity: User) {
        ref = db.collection("users").addDocument(data: [
            "id": entity.id ?? "0",
            "name": entity.name ?? "",
            "age": entity.age ?? "",
            "major": entity.major ?? ""
        ]) { [weak self] err in
            if let err = err {
                print("Error adding document: \(err)")
            } else {
                print("Document added with ID: \(self?.ref!.documentID ?? "")")
            }
        }
    }
    
    
    func getAll(completion: @escaping ([User]) -> Void) {
        var users = [User]()
        DispatchQueue.global(qos: .utility).async { [weak self] in
            self?.db.collection("users").getDocuments { (query, err) in
                if let err = err {
                    print(err.localizedDescription)
                } else {
                    for docs in query!.documents {
                        
                        if let doc = docs.data() as? [String: String] {
                            let user = User(id: doc["id"], name: doc["name"], age: doc["age"], major: doc["major"], idDoc: docs.documentID)
                            users.append(user)
                        }
                    }
                    completion(users)
                }
            }
        }
        
    }
    
    func delete(entity: User) {
        db.collection("users").document(entity.idDoc).delete()
    }
    
    
    
    
    
}
