//
//  ImageCache.swift
//  iOS-ImageDownloads
//
//  Created by Adis Mulabdic on 30. 7. 2024..
//

import Foundation
import UIKit

actor ImageCache {
    static let shared = ImageCache()
    
    private var cache = NSCache<NSURL, ImageCached>()
    
    func image(for url: URL) -> UIImage? {
        guard let cachedImage = cache.object(forKey: url as NSURL) else { return nil }
        
        if cachedImage.isNotExpired {
            return cachedImage.image
        } else {
            cache.removeObject(forKey: url as NSURL)
            return nil
        }
    }
    
    func setImage(_ image: UIImage, for url: URL) {
        let cachedImage = ImageCached(image: image)
        cache.setObject(cachedImage, forKey: url as NSURL)
    }
    
    func invalidate() {
        cache.removeAllObjects()
    }
}
