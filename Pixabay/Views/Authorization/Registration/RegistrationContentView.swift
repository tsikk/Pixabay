//
//  RegistrationContentView.swift
//  Pixabay
//
//  Created by Ilia Tsikelashvili on 06.08.22.
//

import SwiftUI

struct RegistrationContentView: View {
    @ObservedObject var viewModel: RegistrationViewModel

    var body: some View {
        
        VStack(spacing: 32) {
            
            Spacer()
            
            VStack(alignment: .leading) {
                SuperTextField(placeholder: Text("Enter your mail"),
                               text: $viewModel.email)
                .foregroundColor(.white)
                .accentColor(.white)
                .modifier(customViewModifier(roundedCornes: 6,
                                             startColor: .black,
                                             endColor: .blue,
                                             textColor: .white))
                
                Text(viewModel.emailPrompt)
                    .fixedSize(horizontal: false, vertical: true)
                    .font(.caption)
                    .foregroundColor(viewModel.isEmailValid() ? .black : .red)
            }
            
            VStack(alignment: .leading) {
                SuperTextField(placeholder: Text("Enter your age"),
                               text: $viewModel.age)
                .foregroundColor(.white)
                .accentColor(.white)
                .modifier(customViewModifier(roundedCornes: 6,
                                             startColor: .black,
                                             endColor: .red,
                                             textColor: .white))
                
                Text(viewModel.agePrompt)
                    .fixedSize(horizontal: false, vertical: true)
                    .font(.caption)
                    .foregroundColor(viewModel.isAgeValid() ? .black : .red)
            }
            
            
            VStack(alignment: .leading) {
            SuperTextField(placeholder: Text("Enter your password"),
                           text: $viewModel.password,
                           isSecure: true)
                .foregroundColor(.white)
                .accentColor(.white)
                .modifier(customViewModifier(roundedCornes: 6,
                                             startColor: .black,
                                             endColor: .yellow,
                                             textColor: .white))
                
                Text(viewModel.passwordPrompt)
                    .fixedSize(horizontal: false, vertical: true)
                    .font(.caption)
                    .foregroundColor((viewModel.passwordsMatch() && viewModel.isPasswordValid()) ? .black : .red)
            }
            
            
            VStack(alignment: .leading) {
            SuperTextField(placeholder: Text("Confirm yout password"),
                           text: $viewModel.confirmPassword,
                           isSecure: true)
                .foregroundColor(.white)
                .accentColor(.white)
                .modifier(customViewModifier(roundedCornes: 6,
                                             startColor: .black,
                                             endColor: .green,
                                             textColor: .white))
                
                Text(viewModel.confirmPasswordPrompt)
                    .fixedSize(horizontal: false, vertical: true)
                    .font(.caption)
                    .foregroundColor((viewModel.passwordsMatch() && viewModel.isPasswordValid()) ? .black : .red)
            }
            

            Button("Register") {
                viewModel.onSignUp()
            }
            .buttonStyle(GrowingButton(isSignUpComplete: viewModel.isSignUpComplete))

            Spacer()
        }
        .padding()
        
    }
}

struct RegistrationContentView_Previews: PreviewProvider {
    static var previews: some View {
        RegistrationContentView(viewModel: RegistrationViewModel() )
    }
}
