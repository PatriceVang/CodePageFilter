//
//  NewMessage.swift
//  ChatSwiftUI
//
//  Created by Apple on 11/30/21.
//

import SwiftUI
import SDWebImageSwiftUI

struct NewMessagePage: View {
    
    @Environment(\.presentationMode) var presentationMode
    @ObservedObject var viewModel = NewMessageViewModel()
    
    var didSelectUser: ((ChatUser) -> Void)?
    
    var body: some View {
        NavigationView {
            ScrollView {
                ForEach(viewModel.users) { user in
                    userView(user: user)
                    Divider()
                }
            }
            .navigationTitle("Create new message")
            .toolbar(content: {
                ToolbarItemGroup(placement: .navigationBarLeading) {
                    Button("Cancel") {
                        presentationMode.wrappedValue.dismiss()
                    }
                }
            })
        }
    }
    
    func userView(user: ChatUser) -> some View {
        return Button(action: {
            didSelectUser?(user)
            presentationMode.wrappedValue.dismiss()
        }, label: {
            HStack(spacing: nil, content: {
            WebImage(url: URL(string: user.avatar))
                .frame(width: 44, height: 44)
                .scaledToFit()
                .cornerRadius(22)
                .overlay(RoundedRectangle(cornerRadius: 22).stroke(Color(.label), lineWidth: 2))
            Text(user.email)
            Spacer()
        }).padding()
        })
            
           
    }
}

struct NewMessage_Previews: PreviewProvider {
    static var previews: some View {
        NewMessagePage()
    }
}
