//
//  Textfield+Helper.swift
//  Pixabay
//
//  Created by Ilia Tsikelashvili on 06.08.22.
//

import SwiftUI

struct SuperTextField: View {
    
    var placeholder: Text
    @Binding var text: String
    var editingChanged: (Bool)->() = { _ in }
    var commit: ()->() = { }
    var isSecure: Bool = false
    
    var body: some View {
        
        ZStack(alignment: .leading) {
            if text.isEmpty { placeholder }
            
            if isSecure {
                SecureField("",
                            text: $text,
                            onCommit: commit)
                
            } else {
                TextField("",
                          text: $text,
                          onEditingChanged: editingChanged,
                          onCommit: commit)
            }
        }
    }
}
