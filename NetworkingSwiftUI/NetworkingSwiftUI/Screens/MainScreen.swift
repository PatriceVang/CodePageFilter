//
//  MainScreen.swift
//  NetworkingSwiftUI
//
//  Created by Apple on 3/2/22.
//

import SwiftUI

struct MainScreen: View {
    
    @ObservedObject var viewModel = ViewModel()
    
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

struct MainScreen_Previews: PreviewProvider {
    static var previews: some View {
        MainScreen()
    }
}
