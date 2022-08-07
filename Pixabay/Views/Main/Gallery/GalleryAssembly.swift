//
//  GalleryAssembly.swift
//  Pixabay
//
//  Created by Ilia Tsikelashvili on 05.08.22.
//

import UIKit

struct GalleryAssembly {
    
    static func build() -> UIViewController {
        
        let networking = Networking()
        let service = GalleryService(network: networking)
        let viewModel = GalleryViewModel(service: service)
        let view = GalleryContentView(viewModel: viewModel)
        let controller = BaseViewController<GalleryViewModel, GalleryContentView>(rootView: view)
        controller.viewModel = viewModel
        controller.navigationItem.hidesBackButton = true
        controller.title = "Gallery"
        return controller
    }
    
}
