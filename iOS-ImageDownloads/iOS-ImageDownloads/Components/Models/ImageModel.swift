//
//  ImageModel.swift
//  iOS-ImageDownloads
//
//  Created by Adis Mulabdic on 30. 7. 2024..
//

import Foundation

struct ImageModel: Codable, Identifiable, Hashable {
    let id: Int?
    let imageUrl: String?
    
    var imageURL: URL? {
        URL(string: imageUrl ?? String())
    }
}
