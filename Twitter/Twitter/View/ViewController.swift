//
//  ViewController.swift
//  Twitter
//
//  Created by Apple on 5/10/20.
//  Copyright © 2020 vinova. All rights reserved.
//

import UIKit

private let cellId = "cell"
private let headerId = "header"
private let footerId = "footer"

struct User {
    var name: String?
    var country: String?
    var descrition: String
}

class ViewController: UIViewController {
    var loaddingV: LoadmoreFooter?
    let myColletionV: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.estimatedItemSize = CGSize(width: UIScreen.main.bounds.width, height: 10)
        let myCV = UICollectionView(frame: .zero, collectionViewLayout: layout)
        myCV.translatesAutoresizingMaskIntoConstraints  = false
        myCV.backgroundColor = .white
        myCV.register(OptionCell.self, forCellWithReuseIdentifier: cellId)
        myCV.register(InfoHeader.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: headerId)
        myCV.register(LoadmoreFooter.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionFooter, withReuseIdentifier: footerId)
        return myCV
    }()
    var countUser = 0
    var listUser = [
        User(name: "David", country: "England", descrition: "Nam Cao tên thật là Trần Hữu Tri (có nguồn ghi là Trần Hữu Trí), sinh năm 1915, nhưng theo giấy khai sinh ghi thì là ngày 29 tháng 10 năm 1917"),
        User(name: "Jhonshon", country: "Americar", descrition: "Tố Hữu, tên thật là Nguyễn Kim Thành (4 tháng 10 năm 1920 – 9 tháng 12 năm 2002), quê gốc ở làng Phù Lai, nay thuộc xã Quảng Thọ, huyện Quảng Điền, tỉnh Thừa Thiên - Huế"),
        User(name: "Kayplement", country: "Scotland", descrition: "Ngô Tất Tố sinh năm 1894 ở làng Lộc Hà, tổng Hội Phụ, phủ Từ Sơn, Bắc Ninh (nay là thôn Lộc Hà, xã Mai Lâm, huyện Đông Anh, Hà Nội). Ông là con thứ hai, nhưng là trưởng nam trong một gia đình có bảy anh chị em, ba trai, bốn gái. Lúc còn nhỏ Ngô Tất Tố được thụ hưởng một nền dục Nho học"),
        User(name: "Standar", country: "Nederland", descrition: "Kim Lân (sinh 1 tháng 8 năm 1920 - mất 20 tháng 7 năm 2007), tên thật là Nguyễn Văn Tài, là một nhà văn Việt Nam. Ông được biết đến với các tác phẩm văn học như Vợ nhặt, Làng"),
    ]
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        self.view.addSubview(myColletionV)
        myColletionV.backgroundColor = .white
        myColletionV.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 0).isActive = true
        myColletionV.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 0).isActive = true
        myColletionV.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: 0).isActive = true
        myColletionV.bottomAnchor.constraint(equalTo: self.view.bottomAnchor).isActive = true
        myColletionV.dataSource = self
        myColletionV.delegate = self
        myColletionV.alwaysBounceVertical = true
    }
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        myColletionV.collectionViewLayout.invalidateLayout()
    }
}

//MARK: Collection View
extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    //MARK: Header
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        if kind == UICollectionView.elementKindSectionHeader {
            let header = myColletionV.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: headerId, for: indexPath)
            return header
        } else {
            let footer = myColletionV.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: footerId, for: indexPath)
            loaddingV = (footer as! LoadmoreFooter)
            return footer
        }
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return .init(width: myColletionV.frame.width, height: 50)
    }
    //MARK: Cell
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return listUser.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = myColletionV.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as? OptionCell
        cell?.presentImg.image = UIImage(systemName: "person")
        let user = listUser[indexPath.row]
        cell?.user = user
        return cell!
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return .init(top: 10, left: 0, bottom: 10, right: 0)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return .init(width: myColletionV.frame.width - 20, height: 100)
    }
    
    
    
    //MARK: Footer
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForFooterInSection section: Int) -> CGSize {
        return .init(width: myColletionV.frame.width, height: 100)
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        let finalIndex = listUser.count - 1
        // Start countUser = 0
        if indexPath.row == finalIndex && countUser <= 10 {
            print(countUser)
            //Allow loadmore
            let newUser = User(name: "Smelling\(self.countUser)", country: "East Sea", descrition: "Hồ Xuân Hương (chữ Hán: 胡春香, 1772 – 1822) là một thi sĩ sống ở giai đoạn cuối thế kỷ XVIII và đầu thế kỷ XIX, mà hiện tại vẫn khiến nhiều học giả tranh cãi[1]. Di tác của bà hoàn toàn là thơ, trong đó mảng Nôm có nhiều phẩm chất tốt cần sự khảo cứu lâu, nhưng hậu thế có thi sĩ Xuân Diệu đã mạo muội tôn Hồ Xuân Hương làm Bà chúa thơ Nôm")
            countUser += 1
            self.loaddingV?.indicator.startAnimating()
            self.loaddingV?.indicator.isHidden = false
            DispatchQueue.global(qos: .utility).async {
                sleep(3)
               DispatchQueue.main.async {
                    self.listUser.append(newUser)
                    self.myColletionV.reloadData()
               }
            }
            if countUser > 10 {
                print("stoped")
                self.loaddingV?.indicator.stopAnimating()
                self.loaddingV?.indicator.isHidden = true
            }
        }
    }
}

