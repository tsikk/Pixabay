//
//  GalleryService.swift
//  Pixabay
//
//  Created by Ilia Tsikelashvili on 05.08.22.
//

import Foundation
import Combine
import Alamofire

protocol GalleryServiceProtocol: AnyObject {
    var network: NetworkingProtocol { get }

    func getGallery() -> AnyPublisher<Gallery, Error>
    func getPhoto(id: String) -> AnyPublisher<Gallery, Error>
    func getGalleryWithAF(completion: @escaping (Result<Gallery, AFError>) -> Void)
}

final class GalleryService: GalleryServiceProtocol {
    
    let network: NetworkingProtocol
    
    init(network: NetworkingProtocol) {
        self.network = network
    }
    
    func getGallery() -> AnyPublisher<Gallery, Error> {
        let endpoint = Endpoint.gallery
        
        return network.get(type: Gallery.self,
                           url: endpoint.url,
                           headers: endpoint.headers)
    }

    func getPhoto(id: String) -> AnyPublisher<Gallery, Error> {
        let endpoint = Endpoint.photo(id: id)
        
        return network.get(type: Gallery.self,
                           url: endpoint.url,
                           headers: endpoint.headers)
    }
    
    func getGalleryWithAF(completion: @escaping (Result<Gallery, AFError>) -> Void) {
        
        AF.request(Endpoint.gallery.url)
            .validate(statusCode: 200..<300)
            .responseDecodable(of: Gallery.self) { response in
                if let value = response.value {
                    completion(.success(value))
                } else if let error = response.error {
                    completion(.failure(error))
                }
            }
    }
}
