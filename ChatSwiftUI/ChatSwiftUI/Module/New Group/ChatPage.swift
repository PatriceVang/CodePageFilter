//
//  ChatPage.swift
//  ChatSwiftUI
//
//  Created by Apple on 11/30/21.
//

import SwiftUI

struct ChatPage: View {
    
    @ObservedObject var viewModel: ChatPageViewModel
    
    init(viewModel: ChatPageViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        
        ZStack {
            messageView()
            VStack {
                Spacer()
                inputTextView()
            }
        }
        .navigationTitle(viewModel.chatUser.email)
        .navigationBarTitleDisplayMode(.inline)
        .navigationBarItems(trailing: Button(action: {
            viewModel.count += 1
        }, label: {
            Text("Scroll to bottom")
        }))
        
    }
    
    
    private func messageView() -> some View {
        ScrollView {
            ScrollViewReader { value in
                VStack {
                    ForEach(viewModel.chatMessages) { message in
                        VStack {
                            if message.fromId == FirebaseManager.shared.uid {
                                HStack {
                                    Spacer()
                                    if !viewModel.messageError.isEmpty {
                                        Image(systemName: "gear")
                                    }
                                    HStack {
                                        Text(message.text)
                                            .foregroundColor(.white)
                                    }
                                    .padding()
                                    .background(Color.blue)
                                    .cornerRadius(8)
                                }
                                
                            } else {
                                HStack {
                                    if !viewModel.messageError.isEmpty {
                                        Image(systemName: "gear")
                                    }
                                    HStack {
                                        Text(message.text)
                                            .foregroundColor(.black)
                                    }
                                    .padding()
                                    .background(Color.white)
                                    .cornerRadius(8)
                                    Spacer()
                                }
                            }
                        }
                        .padding(.horizontal)
                        .padding(.top, 8)
                    }
                    Spacer(minLength: 1t00)
                }
                
                .id("Empty")
                .onReceive(viewModel.$count, perform: { _ in
                    withAnimation(.easeOut(duration: 0.5)) {
                        value.scrollTo("Empty", anchor: .bottom)
                    }
                })
            }
        }
        .background(Color.gray.opacity(0.2))
        
    }
    
    
    
    private func inputTextView() -> some View {
        HStack(alignment: .center, spacing: 8, content: {
            Image(systemName: "photo")
                .font(.system(size: 28))
            ZStack(alignment: .leading) {
                TextEditor(text: $viewModel.chatText)
                    .padding(.top, 10)
                Text("New message...")
                    .foregroundColor(viewModel.chatText.isEmpty ? .gray : .clear)
                    .padding(.leading, 2)
            }
            
            Button(action: {
                viewModel.sendMessage()
            }, label: {
                Text("Send")
                    .font(.system(size: 18))
                    .foregroundColor(.white)
                    .padding(8)
            })
            .background(Color.blue)
            .cornerRadius(6)
        })
        .frame(width: .none, height: 60)
        .padding()
        .background(Color.white)
    }
}

struct ChatPage_Previews: PreviewProvider {
    static var previews: some View {
        ChatPage(viewModel: ChatPageViewModel(user: ChatUser(json: [:])))
    }
}
