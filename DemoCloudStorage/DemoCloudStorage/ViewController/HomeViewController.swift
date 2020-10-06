//
//  HomeViewController.swift
//  DemoCloudStorage
//
//  Created by Apple on 10/6/20.
//

import UIKit
import SnapKit
import FirebaseStorage


class HomeViewController: UIViewController {
    
    let presentImage: UIImageView = {
       let img  = UIImageView()
        img.image = UIImage(named: "images-4")
        return img
    }()
    
    let uploadButton: UIButton = {
       let btn = UIButton()
        btn.setTitle("Upload", for: .normal)
        btn.setTitleColor(.blue, for: .normal)
        
        return btn
    }()
    
    let topImage: UIImageView = {
       let img  = UIImageView()
//        img.image = UIImage(named: "images-4")
        return img
    }()
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        
    }
    
    private func setupUI() {
        self.view.backgroundColor = .white
        
        self.view.addSubview(topImage)
        topImage.snp.makeConstraints { (make) in
            make.top.equalTo(self.view.safeAreaInsets.top)
            make.centerX.equalTo(self.view)
        }
        
        self.view.addSubview(presentImage)
        presentImage.snp.makeConstraints { (make) in
            make.centerX.equalTo(self.view)
            make.centerY.equalTo(self.view)
        }
        
        
        self.view.addSubview(uploadButton)
        uploadButton.addTarget(self, action: #selector(onTapUploadButton(_sender:)), for: .touchUpInside)
        uploadButton.snp.makeConstraints { (make) in
            make.centerX.equalTo(self.view)
            make.bottom.equalTo(presentImage).offset(50)
        }
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Down load", style: .plain, target: self, action: #selector(onTapDownloadButton(_:)))
    }
    
    @objc func onTapUploadButton(_sender: UIButton) {
        StorageService.shared.upload(image: presentImage.image!)
    }
    
    @objc func onTapDownloadButton(_ sender: UIButton) {
//        StorageService.shared.download { (data) in
//            self.topImage.image = UIImage(data: data)
//        }
        
        StorageService.shared.downloadReturnUrl { (url) in
            do {
                let data = try Data(contentsOf: url)
                DispatchQueue.main.async {
                    self.topImage.image = UIImage(data: data)
                }
            } catch (let err) {
                print(err.localizedDescription)
            }
        }
    }
    

}
