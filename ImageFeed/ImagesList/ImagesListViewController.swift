//
//  ViewController.swift
//  ImageFeed
//
//  Created by Alex on 04.03.2024.
//

import UIKit

final class ImagesListViewController: UIViewController {
    
    @IBOutlet private weak var tableView: UITableView!
    
    private let photosName: [String] = Array(0..<20).map{ "\($0)" }
    private lazy var dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateStyle = .long
        formatter.timeStyle = .none
        return formatter
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.contentInset = UIEdgeInsets(top: 12, left: 0, bottom: 12, right: 0)
    }
    
    func configCell(for cell: ImagesListCell, with indexPath: IndexPath) {
        let imageName = photosName[indexPath.row]
        guard let image = UIImage(named: imageName) else {
            return
        }
        
        cell.dateLabel.text = dateFormatter.string(from: Date())
        cell.cellImage.image = image
        cell.cellImage.layer.masksToBounds = true
        cell.cellImage.layer.cornerRadius = 16
        if indexPath.row % 2 == 0 {
            cell.likeButton.imageView?.image = UIImage(named: "ColouredLike")
        } else {
            cell.likeButton.imageView?.image = UIImage(named: "Like")
        }
    }
}


// MARK: - UITableViewDelegate

extension ImagesListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let imageViewWidth: CGFloat = tableView.bounds.width
        
        let imageName = "\(indexPath.row)"
        guard let image = UIImage(named: imageName) else {
            return 0
        }
        
        let imageHeight = image.size.height * (imageViewWidth / image.size.width)
        return imageHeight
    }
}

// MARK: - UITableViewDataSource

extension ImagesListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return photosName.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(
            withIdentifier: ImagesListCell.reuseIdentifier,
            for: indexPath
        )
        
        guard let imageListCell = cell as? ImagesListCell else {
            return UITableViewCell()
        }
        
        configCell(for: imageListCell, with: indexPath)
        return imageListCell
    }
}
