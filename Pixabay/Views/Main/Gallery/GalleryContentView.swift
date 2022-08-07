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
            .toolbar {
                Button("Sign Out") {
                    viewModel.onSignOut()
                }
            }
    }
    
    private var listOfMovies: some View {
        List(viewModel.photos, id: \.self) { photo in
            CardView(photo: photo)
                .listRowInsets(EdgeInsets())
                .listRowSeparator(.hidden)
                .onTapGesture {
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
