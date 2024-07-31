//
//  ImagesView.swift
//  iOS-ImageDownloads
//
//  Created by Adis Mulabdic on 30. 7. 2024..
//

import SwiftUI

struct ImagesView: View {
    @StateObject private var viewModel = ImageViewModel()
    private let columns = [GridItem(.flexible()), GridItem(.flexible())]

    var body: some View {
        NavigationStack {
            ScrollView {
                LazyVGrid(columns: columns) {
                    ForEach(viewModel.images, id: \.self) { image in
                        VStack {
                            AsyncImageView(url: image.imageURL, 
                                           placeholder: Image(systemName: "photo.fill"))
                                .frame(width: 150, height: 150)
                            Text(String(image.id ?? .zero))
                        }
                    }
                }
            }
            .navigationTitle("Images")
            .navigationBarTitleDisplayMode(.large)
        }
        .task {
            await viewModel.fetchImages()
        }
    }
}

#Preview {
    ImagesView()
}
