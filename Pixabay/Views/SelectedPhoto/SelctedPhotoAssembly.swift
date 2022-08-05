//
//  SelctedPhotoAssembly.swift
//  Pixabay
//
//  Created by Ilia Tsikelashvili on 05.08.22.
//

import UIKit

struct SelectedPhotoAssembly {
    
    static func build(with data: Hits) -> UIViewController {
        
        let viewModel = SelectedPhotoViewModel(data: data)
        let view = SelectedPhotoContentView(viewModel: viewModel)
        let controller = BaseViewController<SelectedPhotoViewModel, SelectedPhotoContentView>(rootView: view)
        controller.viewModel = viewModel
        return controller
    }
    
}
