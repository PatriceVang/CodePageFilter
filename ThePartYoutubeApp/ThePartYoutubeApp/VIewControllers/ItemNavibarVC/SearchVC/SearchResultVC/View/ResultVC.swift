//
//  SearchResultVC.swift
//  ThePartYoutubeApp
//
//  Created by Apple on 5/20/20.
//  Copyright © 2020 vinova. All rights reserved.
//

import UIKit

private let cellId = "cell"

class ResultVC: UIViewController {
    @IBOutlet weak var myResultTableV: UITableView!
    let searchTf: UITextField = {
       let tf = UITextField()
        tf.frame = .init(x: 0, y: 0, width: UIScreen.main.bounds.width - 50, height: 30)
        tf.layer.cornerRadius = 5
        tf.layer.masksToBounds = true
        tf.backgroundColor = #colorLiteral(red: 0.9306792422, green: 0.9306792422, blue: 0.9306792422, alpha: 1)
        tf.enablesReturnKeyAutomatically = true
        return tf
    }()
    var listArticles = [Articles]()
    var presenter: PresenterSearchResultProtocol!
    var textFromSeachVC = ""
    var textTextfield = ""
    //MARK: Life cycle
    init() {
        presenter = Presenter()
        super.init(nibName: "ResultVC", bundle: nil)
        presenter.view = self
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    //MARK: Life cycles
    override func viewDidLoad() {
        super.viewDidLoad()
        myResultTableV.register(UINib(nibName: "ResultCell", bundle: nil), forCellReuseIdentifier: cellId)
        customNaviBar()
        callApi()
        customElement()
    }
    //call api from textFromSeachVC
    private func callApi() {
        self.presenter.fetchDataSearchResult(text: textFromSeachVC)
    }
    //MARK:Custom Element
    private func customElement() {
        //textfield
        searchTf.enablesReturnKeyAutomatically = true
         searchTf.delegate = self
         searchTf.returnKeyType = .done
    }
    private func customNaviBar() {
        self.navigationItem.leftBarButtonItems = [
            UIBarButtonItem(image: UIImage(systemName: "arrow.left"), style: .plain, target: self, action: #selector(onTapBackBtnNV)),
        ]
        self.navigationItem.titleView = searchTf
        self.navigationItem.rightBarButtonItems = [
            UIBarButtonItem(image: Resource.Image.connectImg, style: .plain, target: self, action: #selector(onTapConnectBtnNv)),
            UIBarButtonItem(image: Resource.Image.adjustmentImg, style: .plain, target: self, action: #selector(onTapADjustmentBtnNv))
        ]
    }
    
    //MARK: Handle tap
    @objc func onTapBackBtnNV() {
        self.navigationController?.popViewController(animated: true)
    }
    
    @objc func onTapConnectBtnNv() {
        print("connect")
    }
    @objc func onTapADjustmentBtnNv() {
        print("adjustment")
    }
}

extension ResultVC: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if let text = textField.text {
            self.textTextfield = text
            self.presenter.fetchDataSearchResult(text: textTextfield)
        }
        return true
    }
}

extension ResultVC: UITableViewDataSource, UITableViewDelegate {
    //cell
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listArticles.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = myResultTableV.dequeueReusableCell(withIdentifier: cellId) as? ResultCell
        let articles = listArticles[indexPath.row]
        cell?.articles = articles
        return cell!
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return myResultTableV.frame.width / 3.5
    }
}

extension ResultVC: PresenterResultDelegate {
    func passDataSearchResult(data: [Articles]) {
        self.listArticles = data
        self.myResultTableV.reloadData()
    }
}

