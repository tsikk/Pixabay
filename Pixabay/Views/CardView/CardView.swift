//
//  CardView.swift
//  Pixabay
//
//  Created by Ilia Tsikelashvili on 05.08.22.
//

import SwiftUI
import Kingfisher

struct CardView: View {
    let photo: Hits
    
    var body: some View {
        ZStack(alignment: .bottom) {
            KFImage(URL(string: photo.webformatURL))
                .placeholder {
                    ProgressView()
                }
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(minWidth: 0, maxHeight: 400)
            
            HStack {
                KFImage(URL(string: photo.userImageURL))
                    .placeholder {
                        ProgressView()
                    }
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .border(.white, width: 1)
                    .frame(width: 30, height: 30)
                    .clipShape(Circle())
                Text(photo.user)
                    .bold()
                Spacer()
            }
            .padding()
            .background(.thinMaterial)
        }
        .background(.thickMaterial)
        .mask(RoundedRectangle(cornerRadius: 16))
        .padding(8)
    }
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        CardView(photo: Hits(id: 1,
                             webformatURL: "https://pixabay.com/get/g21ad1e89422f9c6c7e92d5866a437c57398114e999dc197a4ae1d5da882ef515c26dc26d872f30a466158660f28eb6f0165bc60d0d9ba91b268ad044caaa0040_640.jpg",
                             downloads: 1,
                             user: "matthiasboeckel",
                             userImageURL: "https://cdn.pixabay.com/user/2022/04/12/06-48-11-19_250x250.jpg"))
    }
}
