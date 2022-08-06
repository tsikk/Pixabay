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
    @State private var age: String = ""
    @ObservedObject var viewModel: RegistrationViewModel

    var body: some View {
        
        VStack(spacing: 32) {
            
            Spacer()
            
            SuperTextField(placeholder: Text("Enter your mail"), text: $email)
                .foregroundColor(.white)
                .accentColor(.white)
                .modifier(customViewModifier(roundedCornes: 6,
                                             startColor: .black,
                                             endColor: .blue,
                                             textColor: .white))
            
            SuperTextField(placeholder: Text("Enter your age"), text: $age)
                .foregroundColor(.white)
                .accentColor(.white)
                .modifier(customViewModifier(roundedCornes: 6,
                                             startColor: .black,
                                             endColor: .red,
                                             textColor: .white))
            
            
            SuperTextField(placeholder: Text("Enter your password"), text: $password)
                .foregroundColor(.white)
                .accentColor(.white)
                .modifier(customViewModifier(roundedCornes: 6,
                                             startColor: .black,
                                             endColor: .yellow,
                                             textColor: .white))
            
            

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
