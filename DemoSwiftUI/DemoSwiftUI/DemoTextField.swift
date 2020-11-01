//
//  DemoTextField.swift
//  DemoSwiftUI
//
//  Created by Apple on 10/31/20.
//  Copyright © 2020 vinova. All rights reserved.
//

import SwiftUI
import Combine


class UserManager: ObservableObject {
    @Published var user : String = ""
    
    @Published var rememberMe: Bool = false
    
    
    func checkValidDate() -> Bool {
        return user == ""
    }
}

struct DemoTextField: View {
    
    @State var value = ""
    
    
    @EnvironmentObject var userManager: UserManager
    
    
    var body: some View {
    
        VStack {
            Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
            
            TextField("Input name", text: $userManager.user)
                .background(Color.init(.white))
                .textFieldStyle(RoundedBorderTextFieldStyle())
            Text("\(userManager.user.count)")
            
            Toggle(isOn: $userManager.rememberMe) {
                Text("Remember Me")  
            }
            
        
            
                
            Button(action: {
                print(self.userManager.$user)
            }) {
                Text("OK")
            }.disabled(self.userManager.checkValidDate())
        }.padding()
    }
}

//struct DemoTextField_Previews: PreviewProvider {
//
//
//
//    static var previews: some View {
//        DemoTextField()
//    }
//}


//struct Button<Label> where Label: View {
//
//    var action: () -> Void
//
//
//    init() {
//        action = () -> Void
//
//        @ViewBuilder label: () -> Label
//    }
//}



