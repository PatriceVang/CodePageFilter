//
//  PageOne.swift
//  MVVMOne
//
//  Created by Apple on 6/28/20.
//  Copyright © 2020 vinova. All rights reserved.
//

import UIKit
import RxSwift

class PageOne: UIViewController {
    let redView = UIView(frame: .init(x: 50, y: 200, width: 200, height: 200))
    var isChangeColor: Bool = false
    let dispose = DisposeBag()
    
    var viewModel: PageOneViewModeling
    init(viewModel: PageOneViewModeling) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        redView.backgroundColor = .red
        
        self.view.addSubview(redView)
        
        redView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(onTapRedView)))
        redView.isUserInteractionEnabled = true
        setupRx()
    }
    
    private func setupRx() {
        viewModel.isClearColor.subscribe(onNext: { [weak self] (isChange) in
            guard let self = self else {return}
            self.redView.backgroundColor = isChange == true ? .white : .red
        }) {
            self.dispose
        }
        
    }
    
    @objc func onTapRedView() {
        isChangeColor.toggle()
        viewModel.OnChangeBackGroudColor(isChangColor: isChangeColor)
    }


}
