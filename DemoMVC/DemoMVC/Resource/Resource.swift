//
//  Resource.swift
//  DemoMVC
//
//  Created by Apple on 5/28/20.
//  Copyright © 2020 vinova. All rights reserved.
//

import UIKit


class Resource {
    static let shared = Resource()
    
    class Color {
        static let colorHeader: UIColor  = #colorLiteral(red: 0.9471083283, green: 0.3039065301, blue: 0.2734370828, alpha: 1)
        static let colorDownloadBtn: UIColor = #colorLiteral(red: 0.9471083283, green: 0.3039065301, blue: 0.2734370828, alpha: 1)
    }
    
    class Text {
        static let download = "Download"
    }
}
