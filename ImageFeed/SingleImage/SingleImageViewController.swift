//
//  SingleImageViewController.swift
//  ImageFeed
//
//  Created by Alex on 16.05.2024.
//

import UIKit

final class SingleImageViewController: UIViewController {
    
    @IBOutlet private var imageView: UIImageView!
    
    @IBOutlet private var scrollView: UIScrollView!
    
    var image: UIImage?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imageView.image = image
    }
    @IBAction private func didTapBackButton() {
        dismiss(animated: true, completion: nil)
    }
}
