//
//  GalleryViewController.swift
//  Pixabay
//
//  Created by Ilia Tsikelashvili on 05.08.22.
//

import UIKit
import Combine

class GalleryViewController: UIViewController {

    let galleryService = GalleryService(network: Networking())
    var subscriptions = Set<AnyCancellable>()

    override func viewDidLoad() {
        super.viewDidLoad()

        galleryService.getGallery().sink(receiveCompletion: { (completion) in
            switch completion {
            case let .failure(error):
                print("Couldn't get users: \(error)")
            case .finished:
                break
            }
        }) { gallery in
            print(gallery)
        }
        .store(in: &subscriptions)
    }

}
