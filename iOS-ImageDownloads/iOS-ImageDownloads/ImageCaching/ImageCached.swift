//
//  ImageCached.swift
//  iOS-ImageDownloads
//
//  Created by Adis Mulabdic on 30. 7. 2024..
//

import Foundation
import UIKit

class ImageCached {
    let image: UIImage
    let time: Date
    
    init(image: UIImage) {
        self.image = image
        self.time = Date()
    }
    
    var isNotExpired: Bool {
        let duration: TimeInterval = 4 * 60 * 60
        return Date().timeIntervalSince(time) < duration
    }
}
