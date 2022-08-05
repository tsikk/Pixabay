//
//  GalleryViewModel.swift
//  Pixabay
//
//  Created by Ilia Tsikelashvili on 05.08.22.
//

import Foundation
import Combine

class GalleryViewModel: BaseViewModel {
    
    @Published var photos = [Hits]()
    private let service: GalleryService
    private var subscriptions = Set<AnyCancellable>()

    init(service: GalleryService) {
        self.service = service
    }

    required init() {
        fatalError("init() has not been implemented")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        service.getGallery().sink(receiveCompletion: { completion in
            switch completion {
            case let .failure(error):
                print("Couldn't get users: \(error)")
            case .finished:
                break
            }
        }) { gallery in
            DispatchQueue.main.async {
                self.photos = gallery.hits
                print(gallery)
            }
        }
        .store(in: &subscriptions)
        
    }

}
