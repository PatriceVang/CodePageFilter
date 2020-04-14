//
//  DetailController.swift
//  FashionApp
//
//  Created by Apple on 4/13/20.
//  Copyright © 2020 vinova. All rights reserved.
//

import UIKit

class DetailController: UIViewController {
    @IBOutlet weak var lbRating: UILabel!
    @IBOutlet weak var lbName: UILabel!
    @IBOutlet weak var viewCartAdd: UIView!
    @IBOutlet weak var imgPresent: UIImageView!
    @IBOutlet weak var lbPriceNew: UILabel!
    @IBOutlet weak var imgAddCart: UIImageView!
    @IBOutlet weak var lbPriceOld: UILabel!
    @IBOutlet var arrView: [UIView]!
    @IBOutlet weak var viewRadiusCartAdd: UIView!
    @IBOutlet var arrBtnColor: [UIButton]!
    @IBOutlet var arrBtnSize: [UIButton]!
    @IBOutlet weak var lbReview: UILabel!
    @IBOutlet weak var viewCounting: UIView!
    @IBOutlet weak var lbCounting: UILabel!
    @IBOutlet weak var imgCartAdd: UIImageView!
    //MARK: Proberty
    var dataImg: String?
    var dataText: String?
    var dataReview: String?
    var dataRating: String?
    var counting: Int = 0 {
        didSet {
            lbCounting.text = String(counting)
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        getData()
        customElement()
    }
    override func viewWillDisappear(_ animated: Bool) {
        self.navigationController?.navigationBar.isHidden = true
    }
    //MARK: Handle Tap
    @IBAction func onTapBtnColor(_ sender: Any) {
        let indexBtn = arrBtnColor.firstIndex(of: sender as! UIButton)
        for item in arrView {
            let indexView = arrView.firstIndex(of: item)
            arrView[indexView!].backgroundColor = indexBtn == indexView ? Resource.Color.chosenColor : .white
        }
    }
    @IBAction func onTapBtnMinus(_ sender: Any) {
        if counting == 0 {
            counting = 0
        }else {
            counting -= 1
        }
    }
    @IBAction func onTapBtnAdd(_ sender: Any) {
        counting += 1
    }
    @IBAction func onTapBtnSize(_ sender: Any) {
        let indexSize = arrBtnSize.firstIndex(of: sender as! UIButton)
        for item in arrBtnSize {
            let index = arrBtnSize.firstIndex(of: item)
            arrBtnSize[index!].backgroundColor = indexSize == index ? Resource.Color.chosenSize : .white
        }
    }
    @objc func onTapAddToCart() {
        print("add to cart")
    }
    //MARK: Get data
    private func getData() {
        guard let data = dataImg else {return}
        guard let url = URL(string: data) else {return}
        do {
            let data = try Data(contentsOf: url)
            DispatchQueue.main.async {
                self.imgPresent.image = UIImage(data: data)
            }
        } catch {}
        lbName.text = dataText
        lbReview.text = dataReview
        lbRating.text = dataRating
    }
    //MARK: Custom Element
    private func customElement() {
        // Set navigation bar
        self.tabBarController?.tabBar.isHidden = true
        self.navigationController?.navigationBar.isTranslucent = true
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationItem.backBarButtonItem?.title = "back"
        self.navigationController?.navigationBar.isHidden = false
        // Set height img
        imgPresent.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.4).isActive = true
        // Set strikethrough lable
        let attributeString =  NSMutableAttributedString(string: "$500")
        attributeString.addAttribute(NSAttributedString.Key.strikethroughStyle,
                                             value: 2,
                                                 range: NSMakeRange(0, attributeString.length))
        self.lbPriceOld.attributedText = attributeString
        // Set radius btn and view color
        for i in 0..<arrBtnColor.count {
            Resource.StyleElement.radiusElement(element: arrView[i], radius: arrView[0].frame.height / 2)
            Resource.StyleElement.radiusElement(element: arrBtnColor[i], radius: arrBtnColor[0].frame.height / 2)
        }
        for i in 0..<arrBtnSize.count {
            Resource.StyleElement.radiusElement(element: arrBtnSize[i], radius: arrBtnSize[0].frame.height / 2)
        }
        // Set chosen default color and size
        arrView[0].backgroundColor = Resource.Color.chosenColor
        arrBtnSize[0].backgroundColor = Resource.Color.chosenSize
        // View counting
        viewCounting.layer.cornerRadius = viewCounting.frame.height / 2
        viewCounting.clipsToBounds = true
        viewCounting.layer.borderWidth = 2
        viewCounting.layer.borderColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        lbCounting.text = String(0)
        // View cart Add
        viewCartAdd.layer.cornerRadius = viewCounting.frame.height / 2
        viewCartAdd.clipsToBounds = true
        let tap = UITapGestureRecognizer(target: self, action: #selector(onTapAddToCart))
        viewCartAdd.isUserInteractionEnabled = true
        viewCartAdd.addGestureRecognizer(tap)
        //View radius cart add
        viewRadiusCartAdd.layer.cornerRadius = viewRadiusCartAdd.frame.height / 2
        viewRadiusCartAdd.clipsToBounds = true
        viewRadiusCartAdd.backgroundColor = .white
    }
}
