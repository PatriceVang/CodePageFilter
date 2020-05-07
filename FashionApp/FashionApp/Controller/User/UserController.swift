//
//  UserController.swift
//  FashionApp
//
//  Created by Apple on 4/13/20.
//  Copyright © 2020 vinova. All rights reserved.
//

import UIKit
private let cellId = "cell"

class UserController: UIViewController {
    @IBOutlet weak var headerHeightAnchor: NSLayoutConstraint!
    @IBOutlet weak var headerView: UIView!
    @IBOutlet weak var myTableView: UITableView!
    //MARK: Proberty
    var listSettings = [Settings]()
    var presenterUser: PresenterUserProtocol
    var pickerController: UIImagePickerController?
    let gradient = CAGradientLayer()
    let presentOfUserImg: UIImageView = {
       let img = UIImageView()
        img.image = UIImage(systemName: "person.circle.fill")
        img.contentMode = .scaleAspectFill
        img.translatesAutoresizingMaskIntoConstraints = false
        return img
    }()
    let nameOfUserLb: UILabel = {
       let name = UILabel()
        name.text = "Melody Marks"
        name.textColor = .systemBlue
        name.font = UIFont.boldSystemFont(ofSize: 20)
        name.textAlignment = .center
        name.translatesAutoresizingMaskIntoConstraints = false
        return name
    }()
    let editUserNameBtn: UIButton = {
       let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.setImage(UIImage(systemName: "pencil.circle.fill"), for: .normal)
        btn.addTarget(self, action: #selector(editNameOfUser), for: .touchUpInside)
        return btn
    }()
    //MARK: Intit
    init() {
        presenterUser = UserController.Presenter()
        super.init(nibName: nil, bundle: nil)
        presenterUser.view = self
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    //MARK: ViewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        customElement()
        myTableView.register(UINib(nibName: "MyCellUser", bundle: nil), forCellReuseIdentifier: cellId)
        // User's Name
        guard let text = UserDefaultHelper.shared.name else {return}
        self.nameOfUserLb.text = text
        // User's Img
        guard let img = UserDefaultHelper.shared.presentImg else {return}
        self.presentOfUserImg.image = UIImage(data: img)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.presenterUser.fetchData()
    }
    
    override func viewDidLayoutSubviews() {
        gradient.frame = headerView.bounds
        presentOfUserImg.layer.cornerRadius = presentOfUserImg.frame.height / 2
        presentOfUserImg.layer.masksToBounds = true
    }
    //MARK:Handle tap
    // chosen photo
    @objc func chonsenPresentImg() {
        let alert = UIAlertController(title: "Chosen photo from:", message: nil, preferredStyle: .actionSheet)
        let actionCamera = UIAlertAction(title: "Camera", style: .default) { (camera) in
            self.openCamera()
        }
        let actionLib = UIAlertAction(title: "Library", style: .default) { (lib) in
            self.openLibPhoto()
        }
        let actionCancle = UIAlertAction(title: "Cancle", style: .cancel, handler: nil)
        alert.addAction(actionCamera)
        alert.addAction(actionLib)
        alert.addAction(actionCancle)
        self.present(alert, animated: true, completion: nil)
    }
    // edit name user
    @objc func editNameOfUser() {
        let alert = UIAlertController(title: "Update Myname", message: nil, preferredStyle: .alert)
            let actionOk = UIAlertAction(title: "OK", style: .default) { (ok) in
                guard let text = alert.textFields?.first?.text else {return}
                if text != "" {
                    self.nameOfUserLb.text = text
                    UserDefaultHelper.shared.name = text
                }
            }
            alert.addTextField { (tf) in
                tf.placeholder = "Melody Mark"
            }
            let actionCancle = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
            alert.addAction(actionOk)
            alert.addAction(actionCancle)
            self.present(alert, animated: true, completion: nil)
    }
    private func openCamera() {
        pickerController = UIImagePickerController()
        // neu k ho tro camera thi return
        if UIImagePickerController.isSourceTypeAvailable(.camera) == false {
            return
        }
        pickerController?.delegate = self
        //cho phep edit r chon
        pickerController?.allowsEditing = true
        pickerController?.sourceType = .camera
        self.present(pickerController!, animated: true) {
            //khi present len thi thuc hien ham nay
        }
    }
    private func openLibPhoto() {
        pickerController = UIImagePickerController()
        pickerController?.delegate = self
        pickerController?.sourceType = .photoLibrary
        pickerController?.allowsEditing = true
        self.present(pickerController!, animated: true, completion: nil)
    }
    //MARK: Custom element
    private func customElement() {
        setupGradientForHeader()
        headerHeightAnchor.constant = self.view.frame.width * 0.4
        headerView.backgroundColor = .cyan
        //img present
        headerView.addSubview(presentOfUserImg)
        presentOfUserImg.centerYAnchor.constraint(equalTo: headerView.centerYAnchor).isActive = true
        presentOfUserImg.centerXAnchor.constraint(equalTo: headerView.centerXAnchor).isActive = true
        presentOfUserImg.heightAnchor.constraint(equalTo: headerView.heightAnchor, multiplier: 0.5).isActive = true
        presentOfUserImg.widthAnchor.constraint(equalTo: headerView.heightAnchor, multiplier: 0.5).isActive = true
        let tapImg = UITapGestureRecognizer(target: self, action: #selector(chonsenPresentImg))
        presentOfUserImg.isUserInteractionEnabled = true
        presentOfUserImg.addGestureRecognizer(tapImg)
        // name lb
        headerView.addSubview(nameOfUserLb)
        nameOfUserLb.centerXAnchor.constraint(equalTo: headerView.centerXAnchor).isActive = true
        nameOfUserLb.bottomAnchor.constraint(equalTo: headerView.bottomAnchor, constant: -10).isActive = true
        // btn edit user's name
        headerView.addSubview(editUserNameBtn)
        editUserNameBtn.leadingAnchor.constraint(equalTo: nameOfUserLb.trailingAnchor, constant: 10).isActive = true
        editUserNameBtn.bottomAnchor.constraint(equalTo: headerView.bottomAnchor, constant: -10).isActive = true
    }
    private func setupGradientForHeader() {
        gradient.colors = [Resource.Color.colorHeader.cgColor, Resource.Color.colorTapbar.cgColor]
        gradient.locations = [0, 1]
        gradient.startPoint = CGPoint(x: 0.0, y: 1.0)
        gradient.endPoint = CGPoint(x: 1.0, y: 1.0)
        headerView.layer.addSublayer(gradient)
    }
}
//MARK: TableView
extension UserController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listSettings.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = myTableView.dequeueReusableCell(withIdentifier: cellId) as? MyCellUser
        let settings = listSettings[indexPath.row]
        cell?.model = settings
        return cell!
    }
    
//    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
//        let lineV = UIView(backgroundColor: .black)
//        let headerV = UIView(backgroundColor: .clear)
//        headerV.addSubview(lineV)
//        NSLayoutConstraint.activate([
//            lineV.centerXAnchor.constraint(equalTo: headerV.centerXAnchor),
//            lineV.centerYAnchor.constraint(equalTo: headerV.centerYAnchor),
//            lineV.widthAnchor.constraint(equalTo: headerV.widthAnchor, constant: -30),
//            lineV.heightAnchor.constraint(equalToConstant: 1)
//        ])
//        [lineV].forEach { $0.translatesAutoresizingMaskIntoConstraints = false }
//        return headerV
//    }
//
//    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
//        return 10
//    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == 1 {
            self.navigationController?.setViewControllers([LoginController()], animated: true)
            UserDefaultHelper.shared.email = nil
        }
    }
}

extension UserController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    //ham nay se dc goi khi anh dc chon
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        let chosenPhoto = info[.editedImage] as! UIImage
        self.presentOfUserImg.image = chosenPhoto
        //convert to Data
        guard let data = chosenPhoto.pngData() else { return }
        //create Url
//        let doc = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
//        let url = doc.appendingPathComponent("img_user.png")
//        do {
//            //write to disk
//            try data.write(to: url)
//            UserDefaults.standard.set(url, forKey: "present")
//            print(data)
//        UserDefaults.standard.set(data, forKey: "data")
        UserDefaultHelper.shared.presentImg = data
//        }catch {
//            print(error.localizedDescription)
//        }
        //chon anh xong r thi dismiss man hinh chon anh (*)
        picker.dismiss(animated: true, completion: nil)
    }
    //khi (*) bien mat thi chay ham nay, giai phong bo nho
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
}

extension UserController: PresenterUserDelegate {
    func passData(data: [Settings]) {
        self.listSettings = data
        self.myTableView.reloadData()
    }
}

