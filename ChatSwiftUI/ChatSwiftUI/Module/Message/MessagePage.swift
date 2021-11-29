//
//  MessageView.swift
//  ChatSwiftUI
//
//  Created by Apple on 11/16/21.
//

import SwiftUI
import Combine
import SDWebImageSwiftUI

struct MessagePage: View {
    
    @ObservedObject var viewModel = MessageViewModel()
    @State var showDiaolog = false
    
//    private let a = ["1","2","3","4","5", "6", "7", "8", "9"]
    var body: some View {
        NavigationView {
            VStack(alignment: .center, content: {
                navibarView(user: $viewModel.chatUser, completion: {
                    showDiaolog.toggle()
                })
                listUser()
            })
            .overlay(
                newMessageButton(title: "Text New message") {
                    print(123)
                }
                .position(x: UIScreen.main.bounds.width / 2, y: UIScreen.main.bounds.height - 100)
            )
            
            .navigationBarHidden(true)
            .actionSheet(isPresented: $showDiaolog, content: {
                .init(title:  Text("Settings"), message: Text("What do you want to do?"), buttons: [
                    .destructive(Text("Sign out"), action: {
                        print(123)
                    }),
                    .cancel()
                ])
            })
        }
    }
    
    
    private func navibarView(user: Binding<ChatUser?>, completion: @escaping() -> Void) -> some View {
        return HStack(spacing: 12) {
            WebImage(url: URL(string: user.wrappedValue?.avatar ?? ""))
                .frame(width: 34, height: 34, alignment: .center)
                .clipped()
                .scaledToFill()
                .cornerRadius(17)
            VStack(alignment: .leading, spacing: 5,content: {
                Text(user.wrappedValue?.email ?? "")
                    .font(.system(size: 24, weight: .bold))
                HStack {
                    Circle().frame(width: 10, height: 10)
                        .foregroundColor(.blue)
                    Text("online")
                        .font(.system(size: 14))
                        .foregroundColor(Color(.lightGray))
                }
            })
            Spacer()
            Button(action:completion, label: {
                Image(systemName: "gear")
                    .font(.system(size: 24, weight: .bold))
            })
        }
        .padding()
    }
    
    private func listUser() -> some View {
        return List {
            ForEach(0...9, id: \.self) { ele in
                HStack(spacing: 12) {
                    Image(systemName: "person.fill")
                        .borderAndRadius(size: 32, color: Color(.label), radius: 44, lineWidth: 1)
                    VStack(alignment: .leading) {
                        Text("Name")
                            .setFont(size: 16, weight: .bold)
                        Text("Old")
                            .setFont(size: 14)
                    }
                    Spacer()
                    Text("33d")
                        .setFont(size: 14, weight: .semibold)
                }
                .padding(.vertical, 8)
            }
        }
        .listStyle(PlainListStyle())
    }
    
    private func newMessageButton(title: String, completion: @escaping() -> Void) -> some View {
        return Button(title, action: completion)
            .radiusButton()
            .padding()
    }
}

struct MessageView_Previews: PreviewProvider {
    static var previews: some View {
        MessagePage()
            .preferredColorScheme(.dark)
    }
}
