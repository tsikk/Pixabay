//
//  LoginAssembly.swift
//  Pixabay
//
//  Created by Ilia Tsikelashvili on 06.08.22.
//

import UIKit

struct LoginAssembly {
    
    static func build() -> UIViewController {
        
        let viewModel = LoginViewModel()
        let view = LoginContentView(viewModel: viewModel)
        let controller = BaseViewController<LoginViewModel, LoginContentView>(rootView: view)
        controller.viewModel = viewModel
        return controller
    }
    
}
