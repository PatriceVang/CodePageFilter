//
//  HomeVC.swift
//  ThePartYoutubeApp
//
//  Created by Apple on 5/12/20.
//  Copyright © 2020 vinova. All rights reserved.
//

import UIKit
private let cellItemID = "cell"
private let cellUtityID = "cellTable"

class HomeVC: UIViewController {
    @IBOutlet weak var myTableItemsVideo: UITableView!
    let settingsView = ListOptionView(types: [.saveToWatch, .saveToList, .downLoad, .share, .cancel])
    let supportView = UIView()
    var presenter: PresenterHomeProtocol!
    var listVideos = [Videos]()
    var listArtiles = [Articles]()
    
    init() {
        presenter = Presenter()
        super.init(nibName: "HomeVC", bundle: nil)
        presenter.view = self
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    //MARK: Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        // REGISTER
        myTableItemsVideo.register(UINib(nibName: "ItemsVideoCellHome", bundle: nil), forCellReuseIdentifier: cellItemID)
        myTableItemsVideo.register(UINib(nibName: "UtityCellHome", bundle: nil), forCellReuseIdentifier: cellUtityID)
        fetchData()
        settingsView.translatesAutoresizingMaskIntoConstraints = false
        supportView.frame = .init(x: 0 , y: 0, width: self.view.frame.width, height: 0)
    }
    
    private func fetchData() {
        self.presenter.fetchDataVideos()
        self.presenter.fetchDataUtity()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.tabBarController?.navigationController?.navigationBar.isHidden = false
        self.navigationController?.navigationBar.isHidden = true
    }
    
    @objc func onTapSupportView() {
        supportView.removeFromSuperview()
        self.tabBarController?.tabBar.isHidden = false
    }
}

//MARK: Table View
extension HomeVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listVideos.count + 1
    }
    
    /* 3x + 1 = row => x = (row - 1) / 3 phai la so nguyen
     -
     x
     -
     -
     x 
     -
     -
     x
     -
     -
     -
     -
     */
    /*
     -
     x
     -
     -
     -
     x
     -
     -
     */
            
            //list videoInfo
    //        if listVideos.count == 0 { return UITableViewCell() }
    //        //note: limit 3 cell
    ////        if (0..<3).map({ 3 * $0 + 1 }).contains(indexPath.row) {
    //        if (indexPath.row - 1) % 3 == 0 {
    //            //Colectionview cell
    //            let cell = myTableItemsVideo.dequeueReusableCell(withIdentifier: cellUtityID) as? UtityCellHome
    //            return cell!
    //        } else {
    //            //Normal cell
    //            let cell = myTableItemsVideo.dequeueReusableCell(withIdentifier: cellItemID) as? ItemsVideoCellHome
    //            cell?.delegate = self
    //            let videos = listVideos[generateVideoIndex(via: indexPath.row)!]
    //            cell?.videos = videos
    //            return cell!
    //        }
    //    private func generateVideoIndex(via index: Int) -> Int? {
    //         if (index - 1) % 3 == 0 { return nil}
    //            var result = 0
    //            var a = 3*result + 1
    //            for i in 0...index {
    //                if i == a {
    //                    result += 1
    //                    a = 3*result + 1
    //                }
    //            }
    //            return index - result
    //    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            let cell = myTableItemsVideo.dequeueReusableCell(withIdentifier: cellItemID) as? ItemsVideoCellHome
            cell?.delegate = self
            let videos = listVideos.first
            cell?.videos = videos
            return cell!
        } else if indexPath.row == 1 {
            let cell = myTableItemsVideo.dequeueReusableCell(withIdentifier: cellUtityID) as? UtityCellHome
            cell?.listArticle = listArtiles
            return cell!
        } else {
            let cell = myTableItemsVideo.dequeueReusableCell(withIdentifier: cellItemID) as? ItemsVideoCellHome
            cell?.delegate = self
            let videos = listVideos[indexPath.row - 1]
            cell?.videos = videos
            return cell!
        }
    }
        
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return self.view.frame.width / 1.5
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let keyWindow = UIApplication.shared.keyWindow {
            let videoPlayerView = VideosLaucher()
            if indexPath.row == 0 {
                let video = listVideos[indexPath.row]
                videoPlayerView.video = video
            } else {
                let video = listVideos[indexPath.row - 1]
                videoPlayerView.video = video
            }
            
            keyWindow.backgroundColor = .clear
            keyWindow.addSubview(videoPlayerView.view)
            videoPlayerView.view.frame = .init(x: keyWindow.frame.minX, y: keyWindow.frame.maxY, width: keyWindow.frame.width, height: 0 )
            UIView.animate(withDuration: 0.2, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseOut, animations: {
                videoPlayerView.view.frame = keyWindow.frame
            }) { (completed) in
//                UIApplication.shared.setStatusBarHidden(true, with: .fade)
            }
        }
    }
}

extension HomeVC: ItemsVideoCellHomeDelegate {
    func onTapAuthor(name: String) {
        let authorDetailVC = AuthorDetailVC()
        authorDetailVC.titleBackNv = name
        self.tabBarController?.navigationController?.navigationBar.isHidden = true
        self.navigationController?.pushViewController(authorDetailVC, animated: true)
    }
    
    func displaySettingView() {
        self.tabBarController?.tabBar.isHidden = true
        self.view.addSubview(supportView)
        supportView.addSubview(settingsView)
        supportView.frame = .init(x: 0, y: 0, width: self.view.frame.width, height: 0)
        let blackView = UIView()
        blackView.backgroundColor = .black
        blackView.alpha = 0.5
        blackView.translatesAutoresizingMaskIntoConstraints = false
        blackView.setupTapGesture(view: blackView, selector: #selector(self.onTapSupportView), target: self)
        self.supportView.addSubview(blackView)
        UIView.animate(withDuration: 1, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseOut, animations: {
            self.supportView.frame = self.view.frame
            NSLayoutConstraint.activate([
                self.settingsView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
                self.settingsView.trailingAnchor.constraint(equalTo:self.view.trailingAnchor),
                self.settingsView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
                self.settingsView.heightAnchor.constraint(equalToConstant: self.view.frame.height / 2.8),
                self.settingsView.widthAnchor.constraint(equalToConstant: self.view.frame.width)
            ])
            NSLayoutConstraint.activate([
                blackView.topAnchor.constraint(equalTo: self.view.topAnchor),
                blackView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
                blackView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
                blackView.bottomAnchor.constraint(equalTo: self.settingsView.topAnchor)
            ])
        }, completion: nil)
    }
}

extension HomeVC: PresenterHomeDelegate {
    func passDataUtity(articles: [Articles]) {
        self.listArtiles = articles
        self.myTableItemsVideo.reloadData()
    }
    
    func passDataVideos(data: [Videos]) {
        self.listVideos = data
        self.myTableItemsVideo.reloadData()
    }
}




