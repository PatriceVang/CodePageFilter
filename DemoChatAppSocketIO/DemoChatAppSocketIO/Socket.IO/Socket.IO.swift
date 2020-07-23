//
//  Socket.IO.swift
//  DemoChatAppSocketIO
//
//  Created by Apple on 7/18/20.
//  Copyright © 2020 vinova. All rights reserved.
//

import Foundation
import SocketIO


class SocketIOManager: NSObject {
    static let shared = SocketIOManager()
    var socket = SocketManager(socketURL: URL(string: "http://192.168.17.218:2021")!)
    
    
    override init() {
        super.init()
    }
    
    func estaplishConnection() {
        socket.connect()
    }
    
    func closeConnection() {
        socket.disconnect()
    }
}
