//
//  LoginPage.swift
//  ChatSwiftUI
//
//  Created by Apple on 11/3/21.
//

import SwiftUI


struct LoginPage: View {
    
    @ObservedObject var viewModel = LoginViewModel()
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack {
                    segmentView(binding: $viewModel.isLoginMode, label: "Picker")
                    if !viewModel.isLoginMode {
                        avatarView(image: $viewModel.imgAvatar) {
                            viewModel.showImagePicker = true
                        }
                    }
                    Group {
                        TextField("Email", text: $viewModel.email)
                            .keyboardType(.emailAddress)
                            .autocapitalization(.none)
                        SecureField("Password", text: $viewModel.password)
                    }
                    .padding(12)
                    .defaultTextField()
                    
                    if !viewModel.errorMessage.isEmpty {
                        Text(viewModel.errorMessage)
                            .foregroundColor(.red)
                            .font(.system(size: 14))
                    }
                    
                    createButton(title: viewModel.isLoginMode ? "Login" : "Create account") {
                        if viewModel.isLoginMode {
                            viewModel.login()
                        } else {
                            viewModel.createAccount()
                        }
                    }
                    
                    NavigationLink(destination: MessagePage(viewModel: MessageViewModel()), isActive: $viewModel.isPush) {
                        Text("")
                    }.hidden()
                    
                }
            }
            .navigationTitle( !viewModel.isLoginMode ? "Create account" : "Login")
            .sheet(isPresented: $viewModel.showImagePicker, content: {
                ImagePicker(image: $viewModel.imgAvatar)
            })
        }
    }
    
    // VIEW
    func segmentView(binding: Binding<Bool>, label: String) -> some View {
        Picker(selection: binding, label: Text(label), content: {
            Text("Login").tag(true)
            Text("Create account").tag(false)
        })
        .pickerStyle(SegmentedPickerStyle())
        .padding()
    }
    
    func avatarView(image: Binding<UIImage?>, completion: @escaping() -> Void) -> some View {
        Button(action: completion, label: {
            VStack {
                if let image = image.wrappedValue {
                    Image(uiImage: image)
                        .resizable()
                        .frame(width: 128, height: 128)
                        .scaledToFill()
                        .cornerRadius(64)
                } else {
                    Image(systemName: "person")
                        .font(.system(size: 64))
                        .padding()
                }
            }
            .overlay(RoundedRectangle(cornerRadius: 64).stroke(Color.blue, lineWidth: 2))
        })
    }
    
    func createButton(title: String, completion: @escaping() -> Void) -> some View {
        Button(title, action: completion)
            .radiusButton()
            .padding()
        
        
    }
}

struct LoginPage_Previews: PreviewProvider {
    static var previews: some View {
        LoginPage()
    }
}
