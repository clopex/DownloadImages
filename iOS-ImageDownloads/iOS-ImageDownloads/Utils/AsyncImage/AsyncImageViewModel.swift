//
//  AsyncImageViewModel.swift
//  iOS-ImageDownloads
//
//  Created by Adis Mulabdic on 30. 7. 2024..
//

import Foundation
import UIKit

@MainActor
final class AsyncImageViewModel: ObservableObject {
    @Published var image: UIImage?
    
    private let networkService: NetworkService
    private var currentTask: Task<Void, Never>? = nil
    
    init(networkService: NetworkService = NetworkService()) {
        self.networkService = networkService
    }
    
    func loadImage(from url: URL?) async  {
        currentTask?.cancel()
        
        guard let url else { return }
        currentTask = Task {
            if let cachedImage = await ImageCache.shared.image(for: url) {
                image = cachedImage
                return
            }
            await downloadImage(from: url)
        }
        await currentTask?.value
    }
    
    private func downloadImage(from url: URL) async {
        do {
            let data = try await networkService.fetchData(from: url)
            guard let image = UIImage(data: data) else { return }
            
            await ImageCache.shared.setImage(image, for: url)
            self.image = image
        } catch {
            if (error as? URLError)?.code != .cancelled {
                print("Failed: \(error.localizedDescription)")
            }
        }
    }
}
