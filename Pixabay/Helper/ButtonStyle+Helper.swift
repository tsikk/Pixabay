//
//  ButtonStyle+Helper.swift
//  Pixabay
//
//  Created by Ilia Tsikelashvili on 06.08.22.
//

import SwiftUI

struct GrowingButton: ButtonStyle {
    
    var isSignUpComplete: Bool
    
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
            .opacity(isSignUpComplete ? 1 : 0.4)
            .disabled(!isSignUpComplete)
    }
}

