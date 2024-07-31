//
//  ImagesViewModel.swift
//  iOS-ImageDownloads
//
//  Created by Adis Mulabdic on 30. 7. 2024..
//

import Foundation

protocol ImagesDownloadDelegate: AnyObject {
    func isCompleted()
}

final class ImagesViewModel {
    
    weak var delegate: ImagesDownloadDelegate?
    
    private var manager = DownloadImageManager()
    var images: [ImageModel] = []
    
    func fetchImages() async {
        let allImages = try? await manager.getAllImages()
        images = allImages ?? []
        delegate?.isCompleted()
    }
}
