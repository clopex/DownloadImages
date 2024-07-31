//
//  AsyncImageViewUIKit.swift
//  iOS-ImageDownloads
//
//  Created by Adis Mulabdic on 30. 7. 2024..
//

import UIKit

final class AsyncImageViewUIKit: UIImageView {
    private var viewModel = AsyncImageViewModel()
    private var url: URL?
    
    func configure(with url: URL?, placeholder: UIImage?) {
        self.url = url
        self.image = placeholder
        self.viewModel = AsyncImageViewModel()
        loadImage()
    }
    
    private func loadImage() {
        guard let url else { return }
        Task {
            await viewModel.loadImage(from: url)
            image = viewModel.image
        }
    }
}
