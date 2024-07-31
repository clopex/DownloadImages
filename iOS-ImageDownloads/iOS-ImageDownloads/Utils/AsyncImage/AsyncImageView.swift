//
//  AsyncImageView.swift
//  iOS-ImageDownloads
//
//  Created by Adis Mulabdic on 30. 7. 2024..
//

import SwiftUI

struct AsyncImageView: View {
    var url: URL?
    var placeholder: Image
    
   @StateObject private var viewModel = AsyncImageViewModel()
    
    var body: some View {
        if let image = viewModel.image {
            Image(uiImage: image)
                .resizable()
                .scaledToFit()
        } else {
            placeholder
                .resizable()
                .scaledToFit()
                .task {
                    await viewModel.loadImage(from: url)
                }
        }
    }
}
