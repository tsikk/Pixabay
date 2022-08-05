//
//  GalleryContentView.swift
//  Pixabay
//
//  Created by Ilia Tsikelashvili on 05.08.22.
//

import SwiftUI

struct GalleryContentView: View {
    @ObservedObject var viewModel: GalleryViewModel

    var body: some View {
        listOfMovies
    }
    
    private var listOfMovies: some View {
        List(viewModel.photos, id: \.self) { photo in
                
            Text("\(photo.downloads)")
                .onTapGesture {
                    print("TAPPED: \(photo.downloads)")
                    viewModel.selectPhoto(with: photo.id)
                }
        }
        .listStyle(.plain)
    }
}

struct GalleryContentView_Previews: PreviewProvider {
    static var previews: some View {
        GalleryContentView(viewModel: GalleryViewModel())
    }
}
