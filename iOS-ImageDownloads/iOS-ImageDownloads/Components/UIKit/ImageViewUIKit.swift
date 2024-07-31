//
//  ImageViewUIKit.swift
//  iOS-ImageDownloads
//
//  Created by Adis Mulabdic on 30. 7. 2024..
//

import Foundation
import SwiftUI

struct ImageViewUIKit: UIViewControllerRepresentable {
    typealias UIViewControllerType = ImagesViewController
    
    func makeUIViewController(context: Context) -> ImagesViewController {
        let vc = ImagesViewController()
        return vc
    }
    
    func updateUIViewController(_ uiViewController: ImagesViewController, context: Context) {
        
    }
}
