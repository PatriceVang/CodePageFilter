//
//  APICaller.swift
//  SampleMVP
//
//  Created by phthphat on 4/15/20.
//  Copyright © 2020 phthphat. All rights reserved.
//

import Foundation

protocol APICaller: Networking {
    
    var baseUrl: String { get set }
    associatedtype apiOperator: APIOperator
}


protocol APIOperator {}

