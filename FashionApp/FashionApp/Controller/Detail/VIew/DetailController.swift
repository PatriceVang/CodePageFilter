//
//  DetailController.swift
//  FashionApp
//
//  Created by Apple on 4/13/20.
//  Copyright © 2020 vinova. All rights reserved.
//

import UIKit
import Kingfisher

class DetailController: UIViewController {
    @IBOutlet weak var lbRating: UILabel!
    @IBOutlet weak var btnAdd: UIButton!
    @IBOutlet weak var lbName: UILabel!
    @IBOutlet weak var btnMinus: UIButton!
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
    var titleBtn: String?
    var colors: String?
    let lb = UILabel()
    
    var countCart: Int = 0 {
        didSet {
            lb.text = String(countCart)
        }
    }
    var counting: Int = 0 {
        didSet{
            lbCounting.text = String(counting)
        }
    }
    var actor: Actor?
    weak var delegate: DetailControllerDelegate?
    override func viewDidLoad() {
        super.viewDidLoad()
        getData()
        customElement()
        customBtnCartBar()
        customNavigationBar()
    }
    func customBtnCartBar() {
        let rightBtnNV: UIBarButtonItem = {
            let btn = UIBarButtonItem()
            let redDot = UILabel(frame: CGRect(x: 21, y: 1, width: 12, height: 12))
            redDot.layer.cornerRadius = redDot.bounds.size.height / 2
            redDot.textAlignment = .center
            redDot.layer.masksToBounds = true
            redDot.textColor = .white
            redDot.font = redDot.font.withSize(10)
            redDot.backgroundColor = .red
            redDot.text = String(counting)
            let rightBtnCart = UIButton()
            rightBtnCart.setBackgroundImage(Resource.Image.imgCartNV, for: .normal)
            rightBtnCart.addTarget(self, action: #selector(self.onTapCartNV), for: .touchUpInside)
            rightBtnCart.addSubview(redDot)
            rightBtnCart.heightAnchor.constraint(equalToConstant: 30).isActive = true
            rightBtnCart.widthAnchor.constraint(equalToConstant: 30).isActive = true
            btn.customView = rightBtnCart
            return btn
        }()
        self.navigationItem.rightBarButtonItem = rightBtnNV
    }
    override func viewWillDisappear(_ animated: Bool) {
        self.navigationController?.navigationBar.isHidden = true
    }
    //MARK: Handle Tap
    enum Color: String {
        case Red, Black, Yellow, Gray
    }
    @IBAction func onTapBtnColor(_ sender: Any) {
        let indexBtn = arrBtnColor.firstIndex(of: sender as! UIButton)
        var color: Color {
            switch indexBtn {
            case 0:
                return .Red
            case 1:
                return .Black
            case 2:
                return .Yellow
            case 3:
                return .Gray
            default:
                return DetailController.Color(rawValue: "")!
            }
        }
        colors = color.rawValue
        for item in arrView {
            let indexView = arrView.firstIndex(of: item)
            arrView[indexView!].backgroundColor = indexBtn == indexView ? Resource.Color.chosenColor : .white
        }
    }
    @IBAction func onTapBtnMinus(_ sender: Any) {
        if counting == 1 {
            counting = 1
        }else {
            counting -= 1
        }
    }
    @IBAction func onTapBtnAdd(_ sender: Any) {
        counting += 1
    }
    @IBAction func onTapBtnSize(_ sender: Any) {
        let indexSize = arrBtnSize.firstIndex(of: sender as! UIButton)
        titleBtn = arrBtnSize[indexSize!].currentTitle
        for item in arrBtnSize {
            let index = arrBtnSize.firstIndex(of: item)
            arrBtnSize[index!].backgroundColor = indexSize == index ? Resource.Color.chosenSize : .white
        }
    }
    //Delegate
    @objc func onTapAddToCart() {
        let data = ModelCart()
        data.name = lbName.text
        data.rating = lbRating.text
        data.quantity = Int(lbCounting.text ?? "1")
        data.pic = actor?.picture
        data.size = Int(titleBtn ?? "5")
        data.color = colors ?? "Do"
        self.delegate?.passData(dataCart: data)
        countCart += 1
        print("Add")
        print(countCart)

    }
    //MARK: Get data
    private func getData() {
        guard let data = actor?.picture else {return}
        self.imgPresent.setImage(url: data)
        lbName.text = actor?.name
        guard let popurity = actor?.popularity else {return}
        lbReview.text = String(popurity)
        guard let rating = actor?.known_for?.first else {return}
        guard let ratingNew = rating.vote_average else {return}
        lbRating.text = String(ratingNew)
    }
    @objc func onTapCartNV()  {
        delegate?.goToCart()
        self.navigationController?.popViewController(animated: true)
        print("tap cart NV")
        
    }
    //MARK: Custom Element
    private func customNavigationBar() {
        // Set navigation bar
        self.tabBarController?.tabBar.isHidden = true
        self.navigationController?.navigationBar.isTranslucent = true
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationItem.backBarButtonItem?.title = "back"
        self.navigationController?.navigationBar.isHidden = false
    }
    
    private func customElement() {
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
        viewCounting.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.3).isActive = true
        viewCounting.clipsToBounds = true
        viewCounting.layer.borderWidth = 2
        viewCounting.layer.borderColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        lbCounting.text = String(1)
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
        btnAdd.showsTouchWhenHighlighted = true
        btnMinus.showsTouchWhenHighlighted = true
    }
}

protocol DetailControllerDelegate: class {
    func passData(dataCart: ModelCart)
    func goToCart()
}


