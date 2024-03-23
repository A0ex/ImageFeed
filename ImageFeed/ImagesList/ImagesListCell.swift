//
//  ImagesListCell.swift
//  ImageFeed
//
//  Created by Alex on 20.03.2024.
//

import UIKit

final class ImagesListCell: UITableViewCell {
    @IBOutlet weak var cellImage: UIImageView!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var likeButton: UIButton!
    static let reuseIdentifier = "ImagesListCell"
}
