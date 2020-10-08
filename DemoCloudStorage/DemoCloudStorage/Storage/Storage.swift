//
//  Storage.swift
//  DemoCloudStorage
//
//  Created by Apple on 10/6/20.
//

import Foundation
import FirebaseStorage

protocol Feature {
    var ref: StorageReference {get set}
    func upload(image: UIImage)
    func download(completion: @escaping(Data) -> Void)
    func downloadReturnUrl(completion: @escaping(URL) -> Void)
    func deleteImage()
}

class StorageService: Feature {
    
    static let shared = StorageService()
    
    var ref: StorageReference = Storage.storage().reference()
    
    func upload(image: UIImage) {
        let metadata = StorageMetadata()
        //type of image
        metadata.contentType = "image/jpeg"
        
        //name of image
        let imageName = UUID().uuidString
        
        //images is name of folder
        let imageRef = ref.child("images").child(imageName)
        
        DispatchQueue.global(qos: .background).async {
            let uploadTask = imageRef.putData(image.pngData()!, metadata: metadata)
            uploadTask.observe(.success) { (snapshot) in
                print("Finished upload!!!!")
            }
            uploadTask.observe(.failure) { (snapshot) in
                print("Upload fail!!!")
            }
        }
    }
    
    func download(completion: @escaping (Data) -> Void) {
        //return data
// "gs://fir-cloudstorage-5c8a8.appspot.com/images/0FA649D1-94B0-4C86-A9F6-CF43B9D85C37"
        let fileRef = ref.child("images").child("0FA649D1-94B0-4C86-A9F6-CF43B9D85C37")
        fileRef.getData(maxSize: 1 * 1024 * 1024) { (data, err) in
            if let err = err {
                print(err.localizedDescription)
            } else {
                completion(data!)
            }
        }

    }
    
    func downloadReturnUrl(completion: @escaping (URL) -> Void) {
        let fileRef = ref.child("images").child("0FA649D1-94B0-4C86-A9F6-CF43B9D85C37")
        fileRef.downloadURL { (url, err) in
            if let err = err {
                print(err.localizedDescription)
            } else {
                completion(url!)
            }
        }
    }
    
    func deleteImage() {
        let fileRef = ref.child("images").child("0FA649D1-94B0-4C86-A9F6-CF43B9D85C37")
        fileRef.delete { (err) in
            if let err = err {
                print(err.localizedDescription)
            } else {
                print("Delete success")
            }
        }
    }
}
