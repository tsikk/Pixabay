//
//  SelctedPhotoContentView.swift
//  Pixabay
//
//  Created by Ilia Tsikelashvili on 05.08.22.
//

import SwiftUI
import Kingfisher

struct SelectedPhotoContentView: View {
    @ObservedObject var viewModel: SelectedPhotoViewModel
    
    var body: some View {
     
        VStack {
            ZStack(alignment: .bottom) {
                KFImage(URL(string: viewModel.data.largeImageURL))
                    .placeholder {
                        ProgressView()
                    }
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(minWidth: 0, maxHeight: 400)
                
                HStack {
                    Text(viewModel.data.tags)
                        .bold()
                    Spacer()
                    
                    HStack {
                        Text("W:\(viewModel.data.imageWidth),")
                        Text("H:\(viewModel.data.imageHeight)" )
                    }
                }
                .padding()
                .background(.thinMaterial)
            }
            .background(.thickMaterial)
            .mask(RoundedRectangle(cornerRadius: 16))

            List {
                HStack {
                    Image(systemName: "eye.circle")
                    Text("Viewed \(viewModel.data.views) times")
                }
                
                HStack {
                    Image(systemName: "hand.thumbsup.circle")
                    Text("Liked \(viewModel.data.likes) times")
                }
                
                HStack {
                    Image(systemName: "arrow.down.circle.fill")
                    Text("Downloaded \(viewModel.data.downloads) times")
                }
                
                HStack {
                    Image(systemName: "star.circle")
                    Text("Added to Favourites \(viewModel.data.collections) times")
                }
            }
            
        }
    }
}

struct SelctedPhotoContentView_Previews: PreviewProvider {
    static var previews: some View {
        SelectedPhotoContentView(viewModel: SelectedPhotoViewModel())
    }
}
