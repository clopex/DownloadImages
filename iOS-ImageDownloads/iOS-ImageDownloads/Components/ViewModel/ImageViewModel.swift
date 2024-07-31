//
//  ImageViewModel.swift
//  iOS-ImageDownloads
//
//  Created by Adis Mulabdic on 30. 7. 2024..
//

import Foundation
import UIKit

final class ImageViewModel: ObservableObject {
    private let manager = DownloadImageManager()
    @Published var images: [ImageModel] = []
    
    func fetchImages() async {
        let images = try? await manager.getAllImages()
        await MainActor.run {
            self.images = images ?? []
        }
    }
    
    func clearCache() {
        Task {
           await ImageCache.shared.invalidate()
        }
    }
}

