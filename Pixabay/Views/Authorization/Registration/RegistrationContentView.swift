//
//  RegistrationContentView.swift
//  Pixabay
//
//  Created by Ilia Tsikelashvili on 06.08.22.
//

import SwiftUI

struct RegistrationContentView: View {
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var confirmPassword: String = ""
    @State private var age: String = ""
    @ObservedObject var viewModel: RegistrationViewModel

    var body: some View {
        
        VStack(spacing: 32) {
            
            Spacer()
            
            VStack(alignment: .leading) {
                SuperTextField(placeholder: Text("Enter your mail"),
                               text: $email)
                .foregroundColor(.white)
                .accentColor(.white)
                .modifier(customViewModifier(roundedCornes: 6,
                                             startColor: .black,
                                             endColor: .blue,
                                             textColor: .white))
                
                Text("That is a prompt designed for somthing")
                    .fixedSize(horizontal: false, vertical: true)
                    .font(.caption)
            }
            
            VStack(alignment: .leading) {
                SuperTextField(placeholder: Text("Enter your age"),
                               text: $age)
                .foregroundColor(.white)
                .accentColor(.white)
                .modifier(customViewModifier(roundedCornes: 6,
                                             startColor: .black,
                                             endColor: .red,
                                             textColor: .white))
                
                Text("That is a prompt designed for somthing")
                    .fixedSize(horizontal: false, vertical: true)
                    .font(.caption)
            }
            
            
            VStack(alignment: .leading) {
            SuperTextField(placeholder: Text("Enter your password"),
                           text: $password,
                           isSecure: true)
                .foregroundColor(.white)
                .accentColor(.white)
                .modifier(customViewModifier(roundedCornes: 6,
                                             startColor: .black,
                                             endColor: .yellow,
                                             textColor: .white))
                
                Text("That is a prompt designed for somthing")
                    .fixedSize(horizontal: false, vertical: true)
                    .font(.caption)
            }
            
            
            VStack(alignment: .leading) {
            SuperTextField(placeholder: Text("Confirm yout password"),
                           text: $confirmPassword,
                           isSecure: true)
                .foregroundColor(.white)
                .accentColor(.white)
                .modifier(customViewModifier(roundedCornes: 6,
                                             startColor: .black,
                                             endColor: .green,
                                             textColor: .white))
                
                Text("That is a prompt designed for somthing")
                    .fixedSize(horizontal: false, vertical: true)
                    .font(.caption)
            }
            

            Button("Register") {
                viewModel.onSignUp(email: email, age: age, password: password)
            }
            .buttonStyle(GrowingButton())
            
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
