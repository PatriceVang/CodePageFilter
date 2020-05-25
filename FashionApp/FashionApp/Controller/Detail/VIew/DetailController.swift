//
//  DetailController.swift
//  FashionApp
//
//  Created by Apple on 4/13/20.
//  Copyright © 2020 vinova. All rights reserved.
//

import UIKit
import Kingfisher

class DetailController: BaseView {
    @IBOutlet weak var cartV: UIView!
    @IBOutlet weak var iconCart: UIImageView!
    @IBOutlet weak var contentStV: UIStackView!
    @IBOutlet weak var widthCartV: NSLayoutConstraint!
    @IBOutlet weak var heightPresentImg: NSLayoutConstraint!
    @IBOutlet weak var ratingLb: UILabel!
    @IBOutlet weak var addBtn: UIButton!
    @IBOutlet weak var nameLb: UILabel!
    @IBOutlet weak var minusBtn: UIButton!
    @IBOutlet weak var addToCartV: UIView!
    @IBOutlet weak var presentImg: UIImageView!
    @IBOutlet weak var newPriceLb: UILabel!
    @IBOutlet weak var oldPriceLb: UILabel!
    @IBOutlet var arrChosenColorView: [UIView]!
    @IBOutlet weak var setupRadiusAddToCartV: UIView!
    @IBOutlet var arrColorBtn: [UIButton]!
    @IBOutlet var arrSizeBtn: [UIButton]!
    @IBOutlet weak var reviewLb: UILabel!
    @IBOutlet weak var quantityV: UIView!
    @IBOutlet weak var quantityLb: UILabel!
    var animationImg: UIImageView?
    let redDotLb: UILabel = {
        let red = UILabel(frame: CGRect(x: 22, y: 0, width: 16, height: 16))
            red.layer.cornerRadius = red.bounds.size.height / 2
            red.textAlignment = .center
            red.layer.masksToBounds = true
            red.textColor = .white
            red.text = String(0)
            red.alpha = 1
            red.font = red.font.withSize(12)
            red.backgroundColor = .red
        return red
    }()
    //MARK: Proberty
    var sizes: String?
    var colors: String?
    var count = 0
    var countingCart: Int = 0 {
        didSet {
            redDotLb.text = String(countingCart)
        }
    }
    var counting: Int = 1 {
        didSet{
            quantityLb.text = String(counting)
        }
    }
    var actor: Actor?
    weak var delegate: DetailControllerDelegate?
    var presenterDetail: PresenterDetailProtocol
    //MARK: Init
    init() {
        presenterDetail = PresenterDetail()
        super.init(nibName: "DetailController", bundle: nil)
        presenterDetail.view = self
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    //MARK: ViewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        getDataFromHomeVC()
        customElement()
    }
    override func viewWillAppear(_ animated: Bool) {
        customNavigationBar()
        guard let count = UserDefaultHelper.shared.cart?.count else {return}
        countingCart = count
        redDotLb.text = String(countingCart)
    }
    override func viewWillDisappear(_ animated: Bool) {
        self.navigationController?.navigationBar.isHidden = true
    }
    //MARK: Handle Tap
    @IBAction func onTapColorBtn(_ sender: Any) {
        let indexBtn = arrColorBtn.firstIndex(of: sender as! UIButton)!
        self.presenterDetail.chosenColor(index: indexBtn)
    }
    @IBAction func onTapMinusBtn(_ sender: Any) {
        self.presenterDetail.decrementCount(count: counting)
    }
    @IBAction func onTapAddBtn(_ sender: Any) {
        self.presenterDetail.incrementCount(count: counting)
    }
    @IBAction func onTapSizeBtn(_ sender: Any) {
        let indexSize = arrSizeBtn.firstIndex(of: sender as! UIButton)
        self.presenterDetail.chosenSize(index: indexSize!, arrBtn: arrSizeBtn)
    }
    @objc func onTapShoppingCartIcon()  {
          delegate?.goToCart()
          self.navigationController?.popViewController(animated: true)
    }
    @objc func onTapAddToCartV() {
        let data = ModelCart()
        data.name = nameLb.text
        data.rating = ratingLb.text
        data.quantity = Int(quantityLb.text ?? "1")
        data.pic = actor?.picture
        data.size = Int(sizes ?? "3")
        data.color = colors ?? "Do"
        self.delegate?.passData(dataCart: data)
        countingCart += 1
        self.setupAnimationMove(view: addToCartV, delay: 0, target: self)
        //Animation when tap btn
        animationImg = UIImageView()
        animationImg?.frame = self.presentImg.frame
        guard let imgData = self.actor?.picture else {return}
        animationImg?.setImage(url: imgData)
        let minXIconCart = self.iconCart.convert(self.iconCart.frame, to: self.view).minX
        let minYIconCart = self.iconCart.convert(self.iconCart.frame, to: self.view).minY
        view.addSubview(animationImg!)

        UIView.animate(withDuration: 1, delay: 0.1, options: .curveEaseIn, animations: {
            self.animationImg?.transform = CGAffineTransform(translationX: minXIconCart, y: minYIconCart)
            self.animationImg?.frame.size.height -= self.presentImg.frame.size.height - 10
            self.animationImg?.frame.size.width -= self.presentImg.frame.size.width - 10
            self.animationImg?.alpha = 0
        }, completion: { _ in
            //Handle width of cart
            if self.widthCartV.constant < self.view.frame.width - 30 {
                self.widthCartV.constant += 35
            }
            let item = UIImageView()
            guard let imgData = self.actor?.picture else {return}
            item.setImage(url: imgData)
            item.layer.cornerRadius = 15
            item.layer.masksToBounds = true
            item.translatesAutoresizingMaskIntoConstraints = false
            item.widthAnchor.constraint(equalToConstant: 30).isActive = true
            self.contentStV.addArrangedSubview(item)
        })
    }
    @objc func onPanGesCart(_ ges: UIPanGestureRecognizer) {
        let translation = ges.translation(in: ges.view)
//        let velocity = ges.velocity(in: ges.view)
//        let target = translation.target(initialVelocity: velocity)
        print(translation.y)
        switch ges.state {
        case .began, .changed:
            if self.cartV.frame.maxX >= self.view.frame.maxX {
                self.cartV.center.y += translation.y
                self.cartV.center.x += translation.x
              
                if self.cartV.frame.maxX < self.view.frame.maxX {
                    UIView.animate(withDuration: 1, delay: 0.3, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseIn, animations: {
                        self.cartV.center.x = self.view.frame.maxX - ( self.cartV.frame.width / 2)
                    }, completion: nil)
                }
                let frameOfIconInView = iconCart.convert(iconCart.frame, to: self.view)
                if frameOfIconInView.maxX > self.view.frame.maxX {
                    UIView.animate(withDuration: 0.2) {
                        let x = self.view.frame.maxX - 50
                        let y = self.cartV.frame.minY
                        let with = self.cartV.frame.width
                        let height = self.cartV.frame.height
                        self.cartV.frame = .init(x: x, y: y, width: with, height: height)
                    }
                }
            }
        case .ended:
            UIView.animate(withDuration: 0.1, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseOut, animations: {
                    self.cartV.center.x += 10
                }) { (Bool) in
                    UIView.animate(withDuration: 0.6) {
                        self.cartV.center.x -= 10
                    }
                }
        default: break
        }
        ges.setTranslation(.zero, in: ges.view)
    }
    //MARK: Get data
    private func getDataFromHomeVC() {
        guard let data = actor?.picture else {return}
        self.presentImg.setImage(url: data)
        nameLb.text = actor?.name
        guard let popurity = actor?.popularity else {return}
        reviewLb.text = String(popurity)
        guard let rating = actor?.known_for?.first else {return}
        guard let ratingNew = rating.vote_average else {return}
        ratingLb.text = String(ratingNew)
    }
    //MARK: Custom Element
//    private func customBtnCartBar() {
//        let rightBtnNV: UIBarButtonItem = {
//            let btn = UIBarButtonItem()
//            let rightBtnCart = UIButton()
//            rightBtnCart.setBackgroundImage(Resource.Image.imgCartNV, for: .normal)
//            rightBtnCart.addTarget(self, action: #selector(self.onTapCartNV), for: .touchUpInside)
//            rightBtnCart.addSubview(redDotLb)
//            rightBtnCart.heightAnchor.constraint(equalToConstant: 30).isActive = true
//            rightBtnCart.widthAnchor.constraint(equalToConstant: 30).isActive = true
//            btn.customView = rightBtnCart
//            return btn
//        }()
//        self.navigationItem.rightBarButtonItem = rightBtnNV
//    }
    private func customNavigationBar() {
        self.tabBarController?.tabBar.isHidden = true
        self.navigationController?.navigationBar.isTranslucent = true
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.isHidden = false
    }
    private func customElement() {
        // Set height img
        heightPresentImg.constant = view.frame.height * 0.4
        presentImg.contentMode = .scaleAspectFill
        // Set strikethrough lable
        let attributeString =  NSMutableAttributedString(string: "$500")
        attributeString.addAttribute(NSAttributedString.Key.strikethroughStyle, value: 2, range: NSMakeRange(0, attributeString.length))
        self.oldPriceLb.attributedText = attributeString
        // Set radius btn and view color
        for i in 0..<arrColorBtn.count {
            Resource.StyleElement.radiusElement(element: arrChosenColorView[i], radius: arrChosenColorView[0].frame.height / 2)
            Resource.StyleElement.radiusElement(element: arrColorBtn[i], radius: arrColorBtn[0].frame.height / 2)
        }
        for i in 0..<arrSizeBtn.count {
            Resource.StyleElement.radiusElement(element: arrSizeBtn[i], radius: arrSizeBtn[0].frame.height / 2)
        }
        // Set chosen default color and size
        arrChosenColorView[0].backgroundColor = Resource.Color.chosenColor
        arrSizeBtn[0].backgroundColor = Resource.Color.chosenSize
        // View counting
        quantityV.layer.cornerRadius = quantityV.frame.height / 2
        quantityV.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.3).isActive = true
        quantityV.clipsToBounds = true
        quantityV.layer.borderWidth = 2
        quantityV.layer.borderColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        // View cart Add
        addToCartV.layer.cornerRadius = quantityV.frame.height / 2
        addToCartV.clipsToBounds = true
        let tap = UITapGestureRecognizer(target: self, action: #selector(onTapAddToCartV))
        addToCartV.isUserInteractionEnabled = true
        addToCartV.addGestureRecognizer(tap)
        //View radius cart to add
        setupRadiusAddToCartV.layer.cornerRadius = setupRadiusAddToCartV.frame.height / 2
        setupRadiusAddToCartV.clipsToBounds = true
        setupRadiusAddToCartV.backgroundColor = .white
        addBtn.showsTouchWhenHighlighted = true
        minusBtn.showsTouchWhenHighlighted = true
        self.cartV.backgroundColor = Resource.Color.colorHeader
        self.cartV.layer.cornerRadius = 20
        self.cartV.layer.maskedCorners = [.layerMinXMinYCorner]
        let tapIconCart = UITapGestureRecognizer(target: self, action: #selector(onTapShoppingCartIcon))
        iconCart.isUserInteractionEnabled = true
        iconCart.addGestureRecognizer(tapIconCart)
        iconCart.addSubview(redDotLb)
        
        //Pan gesture for icon cart
        let panGes = UIPanGestureRecognizer(target: self, action: #selector(onPanGesCart(_:)))
        iconCart.isUserInteractionEnabled = true
        iconCart.addGestureRecognizer(panGes)
    }
}
//MARK: Delegate
protocol DetailControllerDelegate: class {
    func passData(dataCart: ModelCart)
    func goToCart()
}

extension DetailController: PresenterDetailDelegate {
    func passColorData(color: String, index: Int) {
        colors = color
        for item in arrChosenColorView {
            let indexView = arrChosenColorView.firstIndex(of: item)
            arrChosenColorView[indexView!].backgroundColor = index == indexView ? Resource.Color.chosenColor : .white
        }
    }
    
    func passCountingData(count: Int) {
        counting = count
    }
    func passSizeData(title: String, index: Int) {
        sizes = title
        for item in arrSizeBtn {
            let indexBtn = arrSizeBtn.firstIndex(of: item)
            arrSizeBtn[indexBtn!].backgroundColor = indexBtn == index ? Resource.Color.chosenSize : .white
        }
    }

}
// Not use yet
//public extension CGPoint {
//    // The target points after decelerating to 0 velocity at a constant rate
//    func target(initialVelocity: CGPoint, decelerationRate: CGFloat = UIScrollView.DecelerationRate.normal.rawValue) -> CGPoint {
//        let x = self.x + self.x.target(initialVelocity: initialVelocity.x, decelerationRate: decelerationRate)
//        let y = self.y + self.y.target(initialVelocity: initialVelocity.y, decelerationRate: decelerationRate)
//        return CGPoint(x: x, y: y)
//    }
//}
//extension CGFloat {
//    func target(initialVelocity: CGFloat, decelerationRate: CGFloat = UIScrollView.DecelerationRate.normal.rawValue) -> CGFloat {
//        return (initialVelocity / 1000.0) * decelerationRate / (1.0 - decelerationRate)
//    }
//}
