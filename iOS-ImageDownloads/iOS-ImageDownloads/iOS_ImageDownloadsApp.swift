//
//  iOS_ImageDownloadsApp.swift
//  iOS-ImageDownloads
//
//  Created by Adis Mulabdic on 30. 7. 2024..
//

import SwiftUI

@main
struct iOS_ImageDownloadsApp: App {
    var body: some Scene {
        WindowGroup {
            //Enable This for SwiftUI implementation
            ImagesView()
            //Enable This for UIKit implementation but with integration into SwiftUI
//            ImageViewUIKit()
        }
    }
}
