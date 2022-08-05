//
//  LoginContentView.swift
//  Pixabay
//
//  Created by Ilia Tsikelashvili on 06.08.22.
//

import SwiftUI

struct LoginContentView: View {
    @ObservedObject var viewModel: LoginViewModel
    @State private var mail: String = ""
    @State private var password: String = ""

    var body: some View {

        
        VStack(spacing: 16) {
            
            Spacer()
            
            Image(systemName: "person.circle")
                .resizable()
                .frame(width: 200, height: 200, alignment: .center)
            
            Spacer()
            
            VStack(spacing: 32) {
                
                SuperTextField(placeholder: Text("Enter your name"), text: $mail)
                .foregroundColor(.white)
                .accentColor(.white)
                .modifier(customViewModifier(roundedCornes: 6,
                                             startColor: .black,
                                             endColor: .white,
                                             textColor: .white))

                SuperTextField(placeholder: Text("Enter your password"), text: $password)
                .foregroundColor(.white)
                .accentColor(.white)
                .modifier(customViewModifier(roundedCornes: 6,
                                             startColor: .black,
                                             endColor: .white,
                                             textColor: .white))

            }

            Spacer()
            
            Button("Enter") {
                print("Tapped")
            }
            .buttonStyle(GrowingButton())
            
            Button("Register") {
                print("Tapped")
            }
            .buttonStyle(GrowingButton())
            
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

struct GrowingButton: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .frame(maxWidth: .infinity)
            .padding()
            .background(.black)
            .foregroundColor(.white)
            .clipShape(Capsule())
            .scaleEffect(configuration.isPressed ? 1.08 : 1)
            .animation(.easeOut(duration: 0.2),
                       value: configuration.isPressed)
    }
}

struct customViewModifier: ViewModifier {
    var roundedCornes: CGFloat
    var startColor: Color
    var endColor: Color
    var textColor: Color
    
    func body(content: Content) -> some View {
        content
            .padding()
            .background(LinearGradient(gradient: Gradient(colors: [startColor, endColor]), startPoint: .topLeading, endPoint: .bottomTrailing))
            .cornerRadius(roundedCornes)
            .padding(3)
            .foregroundColor(textColor)
            .overlay(RoundedRectangle(cornerRadius: roundedCornes)
                        .stroke(LinearGradient(gradient: Gradient(colors: [startColor, endColor]), startPoint: .topLeading, endPoint: .bottomTrailing), lineWidth: 2.5))
            .font(.custom("Open Sans", size: 18))
            .shadow(radius: 1.5)
    }
}

struct SuperTextField: View {
    
    var placeholder: Text
    @Binding var text: String
    var editingChanged: (Bool)->() = { _ in }
    var commit: ()->() = { }
    
    var body: some View {
        ZStack(alignment: .leading) {
            if text.isEmpty { placeholder }
            TextField("", text: $text,
                      onEditingChanged: editingChanged,
                      onCommit: commit)
        }
    }
    
}
