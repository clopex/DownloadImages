//
//  ImagesViewController.swift
//  iOS-ImageDownloads
//
//  Created by Adis Mulabdic on 30. 7. 2024..
//

import UIKit

class ImagesViewController: UITableViewController {
    
    private var viewModel = ImagesViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Images"
        tableView.registerCell(ofType: ImagesTableViewCell.self)
        tableView.estimatedRowHeight = 200.0
        tableView.rowHeight = UITableView.automaticDimension
        viewModel.delegate = self
        getImages()
    }
    
    private func getImages() {
        Task {
            await viewModel.fetchImages()
        }
    }
}

extension ImagesViewController {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.images.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueCell(ofType: ImagesTableViewCell.self)
        let model = viewModel.images[indexPath.row]
        cell.configure(with: model)
        
        return cell
    }
}

extension ImagesViewController: ImagesDownloadDelegate {
    func isCompleted() {
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
}

extension UITableViewCell {
    static var reuseIdentifier: String {
        return String(describing: self)
    }
}

extension UITableView {
    
    func dequeueCell<T: UITableViewCell>(ofType type: T.Type) -> T     {
        let cellName = T.reuseIdentifier
        
        return dequeueReusableCell(withIdentifier: cellName) as! T
    }
    
    func registerCell<T: UITableViewCell>(ofType type: T.Type) {
        let cellName = T.reuseIdentifier
        
        if Bundle.main.path(forResource: cellName, ofType: "nib") != nil {
            let nib = UINib(nibName: cellName, bundle: Bundle.main)
            
            register(nib, forCellReuseIdentifier: cellName)
        } else {
            register(T.self, forCellReuseIdentifier: cellName)
        }
    }
}
