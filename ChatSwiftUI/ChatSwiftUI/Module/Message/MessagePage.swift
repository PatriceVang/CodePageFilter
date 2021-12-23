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
    @Environment(\.presentationMode) var presentationMode
    @ObservedObject var viewModel: MessageViewModel
    @State var showDiaolog = false
    
    
    var body: some View {
        NavigationView {
            VStack(alignment: .center, content: {
                navibarView(user: $viewModel.chatUser, completion: {
                    showDiaolog.toggle()
                }) {
                    viewModel.signOut()
                }
                listUser()
                
                NavigationLink(destination: ChatPage(viewModel: ChatPageViewModel(user: viewModel.difUser ?? ChatUser(json: [:]))), isActive: $viewModel.isPushToChatScreen) {
                    Text("")
                }.hidden()
                
            })
            .overlay(
                newMessageButton(title: "Text New message") {
                    viewModel.showMessageScreen = true
                }
                .position(x: UIScreen.main.bounds.width / 2, y: UIScreen.main.bounds.height - 100)
            )
            .fullScreenCover(isPresented: $viewModel.showMessageScreen, onDismiss: nil, content: {
                NewMessagePage(didSelectUser: didSelectUser(user:))
            })
            
            .navigationBarTitle("", displayMode: .inline)
            .navigationBarHidden(true)
        }
    } 
    
    private func navibarView(user: Binding<ChatUser?>, completion: @escaping() -> Void, signOut: @escaping() -> Void) -> some View {
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
        .actionSheet(isPresented: $showDiaolog, content: {
            .init(title:  Text("Settings"), message: Text("What do you want to do?"), buttons: [
                .destructive(Text("Sign out"), action: {
                    signOut()
                    presentationMode.wrappedValue.dismiss()
                }),
                .cancel()
            ])
        })
    }
    
    private func listUser() -> some View {
        return VStack {
            ForEach(viewModel.chatRecents) { chatRecent in
                Button(action: {
//                    didSelectUser(user: ChatUser(uid: chatRecent.toId, email: chatRecent.email, avatar: chatRecent.avatar))
                }, label: {
                    HStack(spacing: 12) {
                        WebImage(url: URL(string: chatRecent.avatar))
                            .frame(width: 30, height: 30, alignment: .center)
                            .clipped()
                            .scaledToFill()
                            .cornerRadius(15)
                        VStack(alignment: .leading) {
                            Text(chatRecent.email)
                                .setFont(size: 16, weight: .bold)
                            Text(chatRecent.text)
                                .setFont(size: 14)
                                .multilineTextAlignment(.leading)
                        }
                        Spacer()
                        Text("33d")
                            .setFont(size: 14, weight: .semibold)
                    }
                    .padding(.vertical, 8)
                })
            }
            Spacer(minLength: 100)
            
            
        }
        .padding()
        
    }
    
    private func newMessageButton(title: String, completion: @escaping() -> Void) -> some View {
        return Button(title, action: completion)
            .radiusButton()
            .padding()
        
    }
    
    // Event
    private func didSelectUser(user: ChatUser) {
        viewModel.difUser = user
        viewModel.isPushToChatScreen.toggle()
    }
}

struct MessageView_Previews: PreviewProvider {
    static var previews: some View {
        MessagePage(viewModel: MessageViewModel())
            .preferredColorScheme(.dark)
    }
}
