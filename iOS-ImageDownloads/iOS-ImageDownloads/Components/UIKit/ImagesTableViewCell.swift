//
//  ImagesTableViewCell.swift
//  iOS-ImageDownloads
//
//  Created by Adis Mulabdic on 30. 7. 2024..
//

import UIKit

class ImagesTableViewCell: UITableViewCell {

    @IBOutlet var imageHolder: AsyncImageViewUIKit!
    @IBOutlet var id: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func configure(with model: ImageModel) {
        let url = model.imageURL
        let id = model.id ?? .zero
        imageHolder.configure(with: url, placeholder: UIImage(systemName: "photo.fill"))
        self.id.text = String(id)
    }
}
