//
//  HomeVC.swift
//  DemoCustomNavigationbar
//
//  Created by Apple on 11/12/20.
//  Copyright © 2020 vinova. All rights reserved.
//

import UIKit


private var AssociatedObjectHandle: UInt8 = 0

extension UINavigationBar {
    
    var height: CGFloat {
        get {
            if let h = objc_getAssociatedObject(self, &AssociatedObjectHandle) as? CGFloat {
                return h
            }
            return 0
        }
        set {
            objc_setAssociatedObject(self, &AssociatedObjectHandle, newValue, objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
    }
    
    override open func sizeThatFits(_ size: CGSize) -> CGSize {
        if self.height > 0 {
            return CGSize(width: UIScreen.main.bounds.width, height: self.height)
        }
        return super.sizeThatFits(size)
    }
    
}



private struct Const {
    /// Image height/width for Large NavBar state
    static let ImageSizeForLargeState: CGFloat = 70
    /// Margin from right anchor of safe area to right anchor of Image
    static let ImageRightMargin: CGFloat = 16
    /// Margin from bottom anchor of NavBar to bottom anchor of Image for Large NavBar state
    static let ImageBottomMarginForLargeState: CGFloat = 12
    /// Margin from bottom anchor of NavBar to bottom anchor of Image for Small NavBar state
    static let ImageBottomMarginForSmallState: CGFloat = 6
    /// Image height/width for Small NavBar state
    static let ImageSizeForSmallState: CGFloat = 32
    /// Height of NavBar for Small state. Usually it's just 44
    static let NavBarHeightSmallState: CGFloat = 44
    /// Height of NavBar for Large state. Usually it's just 96.5 but if you have a custom font for the title, please make sure to edit this value since it changes the height for Large state of NavBar
    static let NavBarHeightLargeState: CGFloat = 96.5
}


class HomeVC: UIViewController, UITableViewDataSource, UITableViewDelegate, UIScrollViewDelegate {
    
    let imageView = UIImageView(image: UIImage(named: "Group 72"))
    
    let lbTitle: UILabel = {
       let lb = UILabel()
        lb.text = "Book mark"
        lb.textColor = .black
        lb.font = .systemFont(ofSize: 38)
        lb.translatesAutoresizingMaskIntoConstraints = false
        return lb
    }()
    
    let lbHightlight: UILabel = {
       let lb = UILabel()
        lb.text = "Book mark"
        lb.textColor = .black
        lb.translatesAutoresizingMaskIntoConstraints = false
        return lb
    }()
    
    private var numbers: [String] {
        var result = [String]()
        for i in 0..<20 {
            result.append(String(i))
        }
        return result
    }
    
    @IBOutlet weak var tbvHome: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tbvHome.register(UINib(nibName: "HomeCell", bundle: nil), forCellReuseIdentifier: "cell")
        setupUI()
        
    }
    
    
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        showImage(false)
    }
    
    
    
    private func setupUI() {
        let height: CGFloat = 250 //whatever height you want to add to the existing height
        let bounds = self.navigationController!.navigationBar.bounds
        self.navigationController?.navigationBar.frame = CGRect(x: 0, y: 0, width: bounds.width, height: bounds.height + height)
        navigationController?.navigationBar.prefersLargeTitles = true
//        navigationItem.title = "HOME"
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Back", style: .done, target: self, action: nil)
        
        // Initial setup for image for Large NavBar state since the the screen always has Large NavBar once it gets opened
        guard let navigationBar = self.navigationController?.navigationBar else { return }
        navigationBar.addSubview(imageView)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            imageView.rightAnchor.constraint(equalTo: navigationBar.rightAnchor, constant: 0),
            imageView.bottomAnchor.constraint(equalTo: navigationBar.bottomAnchor, constant: Const.ImageBottomMarginForLargeState + 30),
            imageView.heightAnchor.constraint(equalToConstant: Const.ImageSizeForLargeState),
            imageView.widthAnchor.constraint(equalToConstant: 179)
        ])
        
        navigationBar.addSubview(lbTitle)
        NSLayoutConstraint.activate([
            lbTitle.bottomAnchor.constraint(equalTo: navigationBar.bottomAnchor, constant: 50),
            lbTitle.leadingAnchor.constraint(equalTo: navigationBar.leadingAnchor, constant: 20)
        ])
        
        
    }
    
//    private func moveAndResizeImage(for height: CGFloat) {
//        let coeff: CGFloat = {
//            let delta = height - Const.NavBarHeightSmallState
//            let heightDifferenceBetweenState = (Const.NavBarHeightLargeState - Const.NavBarHeightSmallState)
//            return delta / heightDifferenceBetweenState
//        }()
//
//        let factor = Const.ImageSizeForSmallState / Const.ImageSizeForLargeState
//
//        let scale: CGFloat = {
//            let sizeAddenfumFactor = coeff * (1 - factor)
//            return min(1, sizeAddenfumFactor + factor)
//        }()
//
//        let sizeDiff = Const.ImageSizeForLargeState * (1.0 - factor) // 8.0
//
//        let yTranslation: CGFloat = {
//            /// This value = 14. It equals to difference of 12 and 6 (bottom margin for large and small states). Also it adds 8.0 (size difference when the image gets smaller size)
//            let maxYTranslation = Const.ImageBottomMarginForLargeState - Const.ImageBottomMarginForSmallState + sizeDiff
//            return max(0, min(maxYTranslation, (maxYTranslation - coeff * (Const.ImageBottomMarginForSmallState + sizeDiff))))
//
//        }()
//
//        let xTranslation = max(0, sizeDiff - coeff * sizeDiff)
//
//        //        imageView.transform = CGAffineTransform.identity
//        //            .scaledBy(x: scale, y: scale)
//        //            .translatedBy(x: xTranslation, y: yTranslation)
//    }
    
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        guard let height = navigationController?.navigationBar.frame.height else { return }
//        moveAndResizeImage(for: height)
        if scrollView.contentOffset.y >= 6 {
            UIView.animate(withDuration: 3, delay: 0, options: .transitionCurlUp, animations: {
                self.imageView.isHidden = true
                self.navigationItem.titleView = self.lbHightlight
                self.lbTitle.isHidden = true
            }, completion: nil)
            
        } else {
            UIView.animate(withDuration: 3, delay: 0, options: .transitionCurlDown, animations: {
                self.imageView.isHidden = false
                self.navigationItem.titleView = nil
                self.lbTitle.isHidden = false
            }, completion: nil)
        }
    }
    
    private func showImage(_ show: Bool) {
        UIView.animate(withDuration: 0.2) {
            self.imageView.alpha = show ? 1.0 : 0.0
        }
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView()
        headerView.backgroundColor = .systemBlue
        return headerView
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 200
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return numbers.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tbvHome.dequeueReusableCell(withIdentifier: "cell") as! HomeCell
        cell.textLabel?.text = numbers[indexPath.row]
        return cell
    }
    
}
