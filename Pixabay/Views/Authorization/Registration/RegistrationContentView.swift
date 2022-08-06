//
//  RegistrationContentView.swift
//  Pixabay
//
//  Created by Ilia Tsikelashvili on 06.08.22.
//

import SwiftUI

struct RegistrationContentView: View {
    @State private var mail: String = ""
    @State private var password: String = ""
    @State private var age: String = ""

    var body: some View {
        
        VStack(spacing: 32) {
            
            Spacer()
            
            SuperTextField(placeholder: Text("Enter your mail"), text: $mail)
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
                print("Tapped")
            }
            .buttonStyle(GrowingButton())
            
            Spacer()
        }
        .padding()
        
    }
}

struct RegistrationContentView_Previews: PreviewProvider {
    static var previews: some View {
        RegistrationContentView()
    }
}
