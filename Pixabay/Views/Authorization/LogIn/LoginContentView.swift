//
//  LoginContentView.swift
//  Pixabay
//
//  Created by Ilia Tsikelashvili on 06.08.22.
//

import SwiftUI

struct LoginContentView: View {
    @ObservedObject var viewModel: LoginViewModel

    var body: some View {

        
        VStack(spacing: 16) {
            
            Spacer()
            
            Image(systemName: "person.circle")
                .resizable()
                .frame(width: 200, height: 200, alignment: .center)
            
            Spacer()
            
            VStack(spacing: 32) {
                
                SuperTextField(placeholder: Text("Enter your email"), text: $viewModel.email)
                    .textInputAutocapitalization(.never)
                    .disableAutocorrection(true)
                    .foregroundColor(.white)
                    .accentColor(.white)
                    .modifier(customViewModifier(roundedCornes: 6,
                                                 startColor: .black,
                                                 endColor: .blue,
                                                 textColor: .white))
                
                SuperTextField(placeholder: Text("Enter your password"), text: $viewModel.password, isSecure: true)
                    .textInputAutocapitalization(.never)
                    .disableAutocorrection(true)
                    .foregroundColor(.white)
                    .accentColor(.white)
                    .modifier(customViewModifier(roundedCornes: 6,
                                                 startColor: .black,
                                                 endColor: .yellow,
                                                 textColor: .white))

            }

            Spacer()
            
            Button("Enter") {
                viewModel.onSignIn()
            }
            .buttonStyle(GrowingButton(isSignUpComplete: true))
            
            Button("Register") {
                viewModel.onRegisterButton()
            }
            .buttonStyle(GrowingButton(isSignUpComplete: true))
            
            Spacer()

        }
        .padding()
        
    }
}

struct LoginContentView_Previews: PreviewProvider {
    static var previews: some View {
        LoginContentView(viewModel: LoginViewModel())
    }
}

