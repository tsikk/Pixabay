//
//  SelctedPhotoContentView.swift
//  Pixabay
//
//  Created by Ilia Tsikelashvili on 05.08.22.
//

import SwiftUI

struct SelectedPhotoContentView: View {
    @ObservedObject var viewModel: SelectedPhotoViewModel
    
    var body: some View {
        Text("\(viewModel.data.id)")
        Text("\(viewModel.data.downloads)")
        Text("\(viewModel.data.webformatURL)")
    }
}

struct SelctedPhotoContentView_Previews: PreviewProvider {
    static var previews: some View {
        SelectedPhotoContentView(viewModel: SelectedPhotoViewModel())
    }
}
