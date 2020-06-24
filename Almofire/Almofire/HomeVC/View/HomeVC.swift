//
//  HomeVC.swift
//  Almofire
//
//  Created by Apple on 6/4/20.
//  Copyright © 2020 vinova. All rights reserved.
//

import UIKit
import Alamofire


//enum APIRouter: URLRequestConvertible {
//    private var method: HTTPMethod {
//        switch <#value#> {
//        case <#pattern#>:
//            <#code#>
//        default:
//            <#code#>
//        }
//    }
//}




struct Login: Codable {
    var name: String?
    
}

class HomeVC: UIViewController {
    @IBOutlet weak var progressDownload: UISlider!
    
    @IBOutlet weak var presentimg: UIImageView!
    
    var resumeData: Data?
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let url = "https://jsonplaceholder.typicode.com/users"
        
        APICaller.shared.getMethod(of: [Login].self, url: url) { (data, err) in
            if err != nil {
                print(err?.localizedDescription as Any)
            } else {
                print(data?.count)
            }
        }

        
        //POST
//        AF.request(url, method: .post, parameters: login, encoder: JSONParameterEncoder.default).response {
//            print($0)
//        }
//
//        let header: HTTPHeaders = [
//        .authorization(<#T##value: String##String#>),
//        .accept(<#T##value: String##String#>)
//
//        ]
        
        
//        AF.request(url).validate(statusCode: 200...299).validate(contentType: ["application/json"]).responseData { (reponse) in
//            switch reponse.result {
//            case .success:
//                print("validation success \(reponse)")
//            case .failure(let err):
//                print(err.localizedDescription)
//            }
//        }
        
        
        // decode
//        AF.request(url, method: .get, parameters: .none).responseDecodable(of: [Login].self) { response in
//            print(response)
//        }
        
        
//
        
        //queue
        
//        AF.request(url).responseJSON(queue: .global(qos: .utility), options: .mutableContainers) { (reponse) in
//            print(reponse)
//        }
        
        //MARK: Doawload
        
        AF.download("https://i.dlpng.com/static/png/6945740_preview.png").downloadProgress(queue: .global(qos: .utility)) { (progress) in
            DispatchQueue.main.async {
                 self.progressDownload.value = Float(progress.fractionCompleted)
             
            }
           
        }.responseData { data in
            if let data = data.value {
                self.presentimg.image = UIImage(data: data)
            }
        }

//        let download = AF.download("https://httpbin.org/image/png")
//        .downloadProgress { progress in
//            print("Download Progress: \(progress.fractionCompleted)")
//        }
//        .responseData { response in
//            if let data = response.value {
//                self.presentimg.image = UIImage(data: data)
//            }
//        }
//
//        download.cancel { (data) in
//            self.resumeData = data
//        }
//
//        download.cancel(producingResumeData: true)
//
//        AF.download(resumingWith: resumeData!).responseData { (response) in
//            if let data = response.value {
//                self.presentimg.image = UIImage(data: data)
//            }
//
//
//        }
        
        
        //MARK: UPload
        //data
//        let data = Data("data".utf8)
//
//        AF.upload(data, to: "url").responseDecodable(of: Login.self, completionHandler: { response in
//            print(response)
//        })
//
//
//        let fileUrl = Bundle.main.url(forResource: "video", withExtension: "mov")
//        AF.upload(fileUrl!, to: "httpt").responseDecodable(of: Login.self, completionHandler: { response in
//            print(response)
//
//        })
//
//        AF.upload(multipartFormData: { (multiPart) in
//            multiPart.append(data, withName: "1")
//            multiPart.append(Data("two".utf8), withName: "2")
//        }, to: "url").responseDecodable(of: Login.self) { (reponse) in
//
//        }
                
        
        
    }
}
