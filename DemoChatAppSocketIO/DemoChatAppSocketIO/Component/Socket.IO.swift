//
//  Socket.IO.swift
//  DemoChatAppSocketIO
//
//  Created by Apple on 7/18/20.
//  Copyright © 2020 vinova. All rights reserved.
//

import Foundation
import SocketIO


public class SocketIOManager {
    static let shared = SocketIOManager()
    let io: SocketManager
    var socket: SocketIOClient {return io.defaultSocket}
    
    
    init() {
        let url = "http://192.168.1.74:6900"
        io = .init(socketURL: URL(string: url)!, config: [.log(true)])
    }
    
    func estaplishConnection() {
        io.connect()
    }
    
    func closeConnection() {
        io.disconnect()
    }
    
    
    func updateNickName(nickName: String) {
        socket.emit("updateNickName", nickName)
    }
    func observerChangeNickname(newName: @escaping (Any) -> Void) {
        socket.on("updateFriendList") { (data, ack) in
            newName(data)
        }
    }
}
