//
//  ToDoDB.swift
//  DemoTodoWithCloudFirestore
//
//  Created by Apple on 10/5/20.
//

import Foundation
import Firebase


class TodoDB {
    
    static let shared = TodoDB()
    
    let db = Firestore.firestore()
    
    var ref: DocumentReference? = nil
    
    init() {
    
    }
    
    func addTodo(id: String, todo: String) {
        ref = db.collection("todos").addDocument(data: [
            id: todo
        ]) { [weak self] err in
            if let err = err {
                print("Error adding document: \(err)")
            } else {
                print("Document added with ID: \(self?.ref!.documentID ?? "")")
            }
        }
    }
    
    func getData(completion: @escaping(Any) -> Void) {
        
        let dic: NSMutableDictionary = [:]
        DispatchQueue.global(qos: .utility).async { [self] in
            db.collection("todos").getDocuments { (query, err) in
                if let err = err {
                    print(err.localizedDescription)
                } else {
                    for doc in query!.documents {
                        dic.addEntries(from: doc.data())
                    }
                    completion(dic)
                }
            }
            
        }
        
    }
    
    
    
    
    
}
