//
//  HomeVC.swift
//  DemoSocket
//
//  Created by Apple on 6/8/20.
//  Copyright © 2020 vinova. All rights reserved.
//

import UIKit
import SocketIO

class HomeVC: UIViewController {
    @IBOutlet weak var contentTf: UITextField!
    
    @IBOutlet weak var redView: UIView!
    
    let manager = SocketManager(socketURL: URL(string: "http://192.168.1.74:2020")!, config: [.log(true), .compress])
    lazy var socket = manager.defaultSocket

    override func viewDidLoad() {
        super.viewDidLoad()
        socket.connect()
        socket.on("data") { (data, ack) in
            print(data)
        }
        
        redView.addGestureRecognizer(UIPanGestureRecognizer(target: self, action: #selector(onPanRedView(_:))))
        
        socket.on("taodonhanve") { (data, ack) in
            let arr = data[0] as! Array<Any>
            
            self.redView.layer.transform = CATransform3DTranslate(CATransform3DIdentity, arr[0] as! CGFloat, arr[1] as! CGFloat, 0)
        }
        
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
    }
    
    
    
    @objc func onPanRedView(_ pan: UIPanGestureRecognizer) {
        let point = pan.translation(in: view)
     
        redView.layer.transform = CATransform3DTranslate(CATransform3DIdentity, point.x, point.y, 0)
        
        socket.emit("toado", with: [[point.x, point.y]])
        
        pan.setTranslation(point, in: view)
    

        
        
    }
    
    
    
    
    @IBAction func sendDataBtn(_ sender: Any) {
        print("tap")
       socket.emit("listen", with: [contentTf.text!])
    }


}
