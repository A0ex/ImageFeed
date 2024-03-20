//
//  ViewController.swift
//  ImageFeed
//
//  Created by Alex on 04.03.2024.
//

import UIKit

class ImagesListViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.rowHeight = 200
    }
    
    @IBOutlet private var tableView: UITableView!
    
    func configCell(for cell: ImagesListCell) { 
        let image = UIImage(named: "0")
        cell.cellImage.image = image
        cell.cellImage.layer.masksToBounds = true
        cell.cellImage.layer.cornerRadius = 16
    }
}

extension ImagesListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
}

extension ImagesListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(
            withIdentifier: ImagesListCell.reuseIdentifier,
            for: indexPath
        )
        
        guard let imageListCell = cell as? ImagesListCell else {
            return UITableViewCell()
        }
        
        configCell(for: imageListCell)
        return imageListCell
    }
}
