//
//  UpdateName.swift
//  DemoSwiftUI
//
//  Created by Apple on 11/11/20.
//  Copyright © 2020 vinova. All rights reserved.
//

import SwiftUI
import Combine

struct UpdateName: View {
    
    var completion: (String, Int) -> Void
    var deleteUser: (Int) -> Void
    @State private var newName: String = ""
    @Environment(\.presentationMode) var mode: Binding<PresentationMode>
    var index = 0
    
    var body: some View {
        
        NavigationView {
            
            VStack {
                
                TextField("Melody", text: $newName)
                
                Button(action: {
                    if self.newName == "" {
                        return
                    }
                    self.completion(self.newName, self.index)
                    self.mode.wrappedValue.dismiss()
                }) {
                    Text("Confirm")
                }
            }.padding()
        }.navigationBarItems(trailing: Button(action: {
            self.deleteUser(self.index)
            self.mode.wrappedValue.dismiss()
        }, label: {
            Text("Delete User")
        }))
    }
}

struct MyTextField: View {
    @State var myInput: String = ""
    var title: String = ""
    var body: some View {
      TextField(title, text: $myInput)
        .padding(10)
        .overlay(RoundedRectangle(cornerRadius: 5).stroke(Color.gray, lineWidth: 1))
    }
}

//struct UpdateName_Previews: PreviewProvider {
//    static var previews: some View {
//        UpdateName()
//    }
//}

struct UpdateName_Previews: PreviewProvider {
    static var previews: some View {
        /*@START_MENU_TOKEN@*/Text("Hello, World!")/*@END_MENU_TOKEN@*/
    }
}
