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
    @IBOutlet weak var bottomSheetView: UIView!
    @IBOutlet weak var iconCart: UIImageView!
    @IBOutlet weak var contentStV: UIStackView!
    @IBOutlet weak var widthBottomSheetView: NSLayoutConstraint!
    @IBOutlet weak var heightOfpresentImg: NSLayoutConstraint!
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
    var tempImg: UIImageView?
    let redDotLb: UILabel = {
        let red = UILabel(frame: CGRect(x: 21, y: 1, width: 16, height: 16))
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
            lbCounting.text = String(counting)
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
        getDataFromHome()
        customElement()
        customBtnCartBar()
     
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
    @IBAction func onTapBtnColor(_ sender: Any) {
        let indexBtn = arrBtnColor.firstIndex(of: sender as! UIButton)
        self.presenterDetail.chosenColor(index: indexBtn!)
    }
    @IBAction func onTapBtnMinus(_ sender: Any) {
        self.presenterDetail.decrementCount(count: counting)
    }
    @IBAction func onTapBtnAdd(_ sender: Any) {
        self.presenterDetail.incrementCount(count: counting)
    }
    @IBAction func onTapBtnSize(_ sender: Any) {
        let indexSize = arrBtnSize.firstIndex(of: sender as! UIButton)
        self.presenterDetail.chosenSize(index: indexSize!, arrBtn: arrBtnSize)
    }
    @objc func onTapCartNV()  {
          delegate?.goToCart()
          self.navigationController?.popViewController(animated: true)
    }
    @objc func onTapAddToCart() {
        let data = ModelCart()
        data.name = lbName.text
        data.rating = lbRating.text
        data.quantity = Int(lbCounting.text ?? "1")
        data.pic = actor?.picture
        data.size = Int(sizes ?? "3")
        data.color = colors ?? "Do"
        self.delegate?.passData(dataCart: data)
        countingCart += 1
        self.setupAnimationMove(view: viewCartAdd, delay: 0, target: self)
        //Animation when tap btn
        tempImg = UIImageView()
        tempImg?.frame = self.imgPresent.frame
        guard let imgData = self.actor?.picture else {return}
        tempImg?.setImage(url: imgData)
        let minXIconCart = self.iconCart.convert(self.iconCart.frame, to: self.view).minX
        let minYIconCart = self.iconCart.convert(self.iconCart.frame, to: self.view).minY
        view.addSubview(tempImg!)

        UIView.animate(withDuration: 1, delay: 0.1, options: .curveEaseIn, animations: {
            self.tempImg?.transform = CGAffineTransform(translationX: minXIconCart, y: minYIconCart)
            self.tempImg?.frame.size.height -= self.imgPresent.frame.size.height - 10
            self.tempImg?.frame.size.width -= self.imgPresent.frame.size.width - 10
            self.tempImg?.alpha = 0
        }, completion: { _ in
            if self.widthBottomSheetView.constant < self.view.frame.width - 15 {
                self.widthBottomSheetView.constant += 50
            }
            let item = UIImageView()
            guard let imgData = self.actor?.picture else {return}
            item.setImage(url: imgData)
            item.layer.cornerRadius = 25
            item.layer.masksToBounds = true
            item.translatesAutoresizingMaskIntoConstraints = false
            item.widthAnchor.constraint(equalToConstant: 50).isActive = true
            self.contentStV.addArrangedSubview(item)
        })
    }
    
    @objc func onPanGesCart(_ ges: UIPanGestureRecognizer) {

        let translation = ges.translation(in: ges.view)
//        let velocity = ges.velocity(in: ges.view)
//        let target = translation.target(initialVelocity: velocity)
        switch ges.state {
        case .began, .changed:
            if self.bottomSheetView.frame.maxX >= self.view.frame.maxX {
                self.bottomSheetView.center.x += translation.x
                if self.bottomSheetView.frame.maxX < self.view.frame.maxX {

                    UIView.animate(withDuration: 0.2) {
                        self.bottomSheetView.center.x = self.view.frame.maxX - ( self.bottomSheetView.frame.width / 2)
                    }
                    
                }
                var frameOfIconInView = iconCart.convert(iconCart.frame, to: self.view)
                if frameOfIconInView.maxX > self.view.frame.maxX {
                    UIView.animate(withDuration: 0.2) {
                        let x = self.view.frame.maxX - self.iconCart.frame.width
                        let y = self.bottomSheetView.frame.minY
                        let width = self.bottomSheetView.frame.width
                        let heigh = self.bottomSheetView.frame.height
                        self.bottomSheetView.frame = .init(x: x, y: y, width: width, height: heigh)
                    }
                }
            }
        case .ended:
            self.bottomSheetView.center.x += 5
        default: break
        }
        ges.setTranslation(.zero, in: ges.view)
    }
    // get data
    private func getDataFromHome() {
        guard let data = actor?.picture else {return}
        self.imgPresent.setImage(url: data)
        lbName.text = actor?.name
        guard let popurity = actor?.popularity else {return}
        lbReview.text = String(popurity)
        guard let rating = actor?.known_for?.first else {return}
        guard let ratingNew = rating.vote_average else {return}
        lbRating.text = String(ratingNew)
    }
    //MARK: Custom Element
    private func customBtnCartBar() {
        let rightBtnNV: UIBarButtonItem = {
            let btn = UIBarButtonItem()
            let rightBtnCart = UIButton()
            rightBtnCart.setBackgroundImage(Resource.Image.imgCartNV, for: .normal)
            rightBtnCart.addTarget(self, action: #selector(self.onTapCartNV), for: .touchUpInside)
            rightBtnCart.addSubview(redDotLb)
            rightBtnCart.heightAnchor.constraint(equalToConstant: 30).isActive = true
            rightBtnCart.widthAnchor.constraint(equalToConstant: 30).isActive = true
            btn.customView = rightBtnCart
            return btn
        }()
        self.navigationItem.rightBarButtonItem = rightBtnNV
    }
    private func customNavigationBar() {
        self.tabBarController?.tabBar.isHidden = true
        self.navigationController?.navigationBar.isTranslucent = true
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.isHidden = false
    }
    private func customElement() {
        // Set height img
        heightOfpresentImg.constant = view.frame.height * 0.4
        imgPresent.contentMode = .scaleAspectFill
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
        // View cart Add
        viewCartAdd.layer.cornerRadius = viewCounting.frame.height / 2
        viewCartAdd.clipsToBounds = true
        let tap = UITapGestureRecognizer(target: self, action: #selector(onTapAddToCart))
        viewCartAdd.isUserInteractionEnabled = true
        viewCartAdd.addGestureRecognizer(tap)
        //View radius cart to add
        viewRadiusCartAdd.layer.cornerRadius = viewRadiusCartAdd.frame.height / 2
        viewRadiusCartAdd.clipsToBounds = true
        viewRadiusCartAdd.backgroundColor = .white
        btnAdd.showsTouchWhenHighlighted = true
        btnMinus.showsTouchWhenHighlighted = true
        
        self.bottomSheetView.layer.cornerRadius = 20
        self.bottomSheetView.layer.maskedCorners = [.layerMinXMinYCorner]
        
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
    func passCount(count: Int) {
        counting = count
    }
    func passDataSize(title: String, index: Int) {
        sizes = title
        for item in arrBtnSize {
            let indexBtn = arrBtnSize.firstIndex(of: item)
            arrBtnSize[indexBtn!].backgroundColor = indexBtn == index ? Resource.Color.chosenSize : .white
        }
    }
    func passDataColor(color: String, index: Int) {
        colors = color
        for item in arrView {
            let indexView = arrView.firstIndex(of: item)
            arrView[indexView!].backgroundColor = index == indexView ? Resource.Color.chosenColor : .white
        }
    }
}



public extension CGPoint {
    // The target points after decelerating to 0 velocity at a constant rate
    func target(initialVelocity: CGPoint, decelerationRate: CGFloat = UIScrollView.DecelerationRate.normal.rawValue) -> CGPoint {
        let x = self.x + self.x.target(initialVelocity: initialVelocity.x, decelerationRate: decelerationRate)
        let y = self.y + self.y.target(initialVelocity: initialVelocity.y, decelerationRate: decelerationRate)
        return CGPoint(x: x, y: y)
    }
}
extension CGFloat {
    func target(initialVelocity: CGFloat, decelerationRate: CGFloat = UIScrollView.DecelerationRate.normal.rawValue) -> CGFloat {
        return (initialVelocity / 1000.0) * decelerationRate / (1.0 - decelerationRate)
    }
}
