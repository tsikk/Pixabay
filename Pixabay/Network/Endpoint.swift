//
//  Endpoint.swift
//  Pixabay
//
//  Created by Ilia Tsikelashvili on 05.08.22.
//

import Foundation

struct Endpoint {
    var path: String
    var queryItems: [URLQueryItem] = []
}

extension Endpoint {
    var url: URL {
        var components = URLComponents()
        let queryItemToken = URLQueryItem(name: "key", value: "29076776-8d41b7d58ad17358f87bb72f2")
        let queryItemQuery = URLQueryItem(name: "", value: "q")
        components.scheme = "https"
        components.host = "pixabay.com"
        components.path = "/api" + path
        components.queryItems = [queryItemToken, queryItemQuery]
        
        guard let url = components.url else {
            preconditionFailure("Invalid URL components: \(components)")
        }
        
        return url
    }
    
    var headers: [String: String] {
        return [
            "app-id": "29076776-8d41b7d58ad17358f87bb72f2"
        ]
    }
}

extension Endpoint {
    static var gallery: Self {
        return Endpoint(path: "")
    }
    
    static func photo(id: String) -> Self {
        return Endpoint(path: "/?key=\(id)")
    }
}
