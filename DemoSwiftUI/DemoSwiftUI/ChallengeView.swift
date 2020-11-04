//
//  ChallengeView.swift
//  DemoSwiftUI
//
//  Created by Apple on 11/4/20.
//  Copyright © 2020 vinova. All rights reserved.
//

import SwiftUI

struct User: Identifiable {
    var id: Int
    let name: String
    let message: String
}

struct ChallengeView: View {
    
    let users: [User] = [
        .init(id: 0, name: "Tim Cook", message: "Both UI/UX design which ones is better to do"),
        .init(id: 1, name: "Apple", message: "Ai biết máy e bị làm sao mà cứ tự tắt âm thanh mỗi khi em xem video,em phải ấn"),
        .init(id: 2, name: "Android", message: "e 23t co suc khoe moi nguoi bit cho nao tuyen dung hk chi zum e vs tks nhiu a.")
    ]
    
    var body: some View {
        NavigationView {
            List {
                Text("Users").font(.largeTitle)
                ForEach(self.users) { user in
                    UserItem(user: user)
                    
                }
                
            }
        }.navigationBarTitle(Text("Dynamic List"))
        
    }
}

struct UserItem: View {
    
    let user: User
    var body: some View {
        HStack {
            Image("fingerprint_off")
                .resizable()
                .clipShape(Circle())
                .overlay(Circle().stroke(Color.black, lineWidth: 3))
                .frame(width: 50, height: 50)
            VStack (alignment: .leading) {
                Text(user.name).font(.headline)
                Text(user.message).font(.subheadline).lineLimit(nil)
            }.padding(.leading, 8)
            
        }.padding(.init(top: 12, leading: 0, bottom: 12, trailing: 0))
    }
}

struct ChallengeView_Previews: PreviewProvider {
    static var previews: some View {
        ChallengeView()
    }
}
