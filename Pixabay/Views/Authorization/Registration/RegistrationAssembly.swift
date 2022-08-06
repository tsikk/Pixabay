//
//  RegistrationAssembly.swift
//  Pixabay
//
//  Created by Ilia Tsikelashvili on 06.08.22.
//

import UIKit

struct RegistrationAssembly {
    
    static func build() -> UIViewController {
        let viewModel = RegistrationViewModel()
        let view = RegistrationContentView(viewModel: viewModel)
        let controller = BaseViewController<RegistrationViewModel, RegistrationContentView>(rootView: view)
        controller.viewModel = viewModel
        return controller
    }
    
}
