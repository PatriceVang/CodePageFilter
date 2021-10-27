//
//  UserList.swift
//  NetworkingSwiftUI
//
//  Created by Apple on 10/27/21.
//

import SwiftUI

struct UserList: View {
    
    @ObservedObject var viewModel = UserListViewModel()
    
    var body: some View {
        NavigationView {
            List(viewModel.users, id: \.id) { user in
                UserRow(user: user)
            }
            .foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)


            
            // Navigation
            .navigationTitle("All User")
            .navigationBarItems(trailing: Button("Create a Post", action: {
                viewModel.createNewPost()
            }))
    
        }

    }
}

struct UserScreen_Previews: PreviewProvider {
    static var previews: some View {
        UserList()
    }
}


fileprivate struct UserRow: View {
    let user: User
    var body: some View {
        HStack(content: {
            Text("\(user.id)")
            Spacer()
            Text(user.name)
        })
    }
}

fileprivate struct UserRow_Previews: PreviewProvider {
    static var previews: some View {
        UserRow(user: User(id: 1, name: "David"))
    }
}

