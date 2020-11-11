//
//  UpdateName.swift
//  DemoSwiftUI
//
//  Created by Apple on 11/11/20.
//  Copyright © 2020 vinova. All rights reserved.
//

import SwiftUI

struct UpdateName: View {
    
    var completion: (String, Int) -> Void
    @State private var newName: String = ""
    var index = 0
    
    var body: some View {
        VStack {
            TextField("Melody", text: $newName)
            
            Button(action: {
                self.completion(self.newName, index)
            }) {
                Text("Confirm")
            }
        }.padding()
        
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
