//
//  DownloadImageManager.swift
//  iOS-ImageDownloads
//
//  Created by Adis Mulabdic on 30. 7. 2024..
//

import Foundation
import UIKit

class DownloadImageManager {
    private let url = "https://zipoapps-storage-test.nyc3.digitaloceanspaces.com/image_list.json"
    
    private let jsonDecoder: JSONDecoder = {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        return decoder
    }()
    
    private let networkService: NetworkService
    
    init(networkService: NetworkService = NetworkService()) {
        self.networkService = networkService
    }
    
    func getAllImages() async throws -> [ImageModel] {
        guard let url = URL(string: url) else { return [] }

        do {
            let data = try await networkService.fetchData(from: url)
            return try jsonDecoder.decode([ImageModel].self, from: data)
        } catch {
            throw error
        }
    }
}
