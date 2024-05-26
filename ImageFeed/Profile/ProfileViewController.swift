//
//  ProfileViewController.swift
//  ImageFeed
//
//  Created by Alex on 25.03.2024.
//

import UIKit

final class ProfileViewController: UIViewController {
    
    private let profileImageView = UIImageView()
    private let logoutButton = UIButton()
    private let nameLabel = UILabel()
    private let descriptionLabel = UILabel()
    private let declarationLabel = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureProfileImageView()
        configureLogoutButton()
        configureNameLabel()
        configureDescriptionLabel()
        configureDeclarationLabel()
    }
    
    @objc func buttonPressed() { }
    
    private func configureProfileImageView() {
        let profileImage = UIImage(named: "ProfilePhoto")
        profileImageView.tintColor = .gray
        profileImageView.image = profileImage ?? UIImage(named: "Stub")
        profileImageView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(profileImageView)
        
        NSLayoutConstraint.activate([
            profileImageView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            profileImageView.trailingAnchor.constraint(lessThanOrEqualTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -16),
            profileImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 32),
            profileImageView.heightAnchor.constraint(equalToConstant: 70),
            profileImageView.widthAnchor.constraint(equalToConstant: 70)
        ])
    }
    
    private func configureLogoutButton() {
        let logoutImage = UIImage(named: "LogoutButton") ?? UIImage(named: "ipad.and.arrow.forward")!
        let tintColor = UIColor(red: 245/255, green: 107/255, blue: 108/255, alpha: 1.0)
        logoutButton.setImage(logoutImage.withTintColor(tintColor).withRenderingMode(.alwaysOriginal), for: .normal)
        logoutButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(logoutButton)
        
        NSLayoutConstraint.activate([
            logoutButton.centerYAnchor.constraint(equalTo: profileImageView.centerYAnchor),
            logoutButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -24),
            logoutButton.heightAnchor.constraint(equalToConstant: 24),
            logoutButton.widthAnchor.constraint(equalToConstant: 24)
        ])
    }
    
    private func configureNameLabel() {
        nameLabel.text = "Екатерина Новикова"
        nameLabel.font = UIFont.systemFont(ofSize: 23, weight: .bold)
        nameLabel.textColor = .ypWhite
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(nameLabel)
        
        NSLayoutConstraint.activate([
            nameLabel.leadingAnchor.constraint(equalTo: profileImageView.leadingAnchor),
            nameLabel.trailingAnchor.constraint(lessThanOrEqualTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -16),
            nameLabel.topAnchor.constraint(equalTo: profileImageView.bottomAnchor, constant: 8)
        ])
    }
    
    private func configureDescriptionLabel() {
        descriptionLabel.text = "@ekaterina_nov"
        descriptionLabel.font = UIFont.systemFont(ofSize: 13, weight: .regular)
        descriptionLabel.textColor = UIColor(red: 174/255, green: 175/255, blue: 180/255, alpha: 1.0)
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(descriptionLabel)
        
        NSLayoutConstraint.activate([
            descriptionLabel.leadingAnchor.constraint(equalTo: profileImageView.leadingAnchor),
            descriptionLabel.trailingAnchor.constraint(lessThanOrEqualTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -16),
            descriptionLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 8)
        ])
    }
    
    private func configureDeclarationLabel() {
        declarationLabel.text = "Hello world!"
        declarationLabel.font = UIFont.systemFont(ofSize: 13, weight: .regular)
        declarationLabel.textColor = .ypWhite
        declarationLabel.numberOfLines = 0 // при необходимости текст переносится на другую строку
        declarationLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(declarationLabel)
        
        NSLayoutConstraint.activate([
            declarationLabel.leadingAnchor.constraint(equalTo: profileImageView.leadingAnchor),
            declarationLabel.trailingAnchor.constraint(lessThanOrEqualTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -16),
            declarationLabel.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 8)
        ])
    }
    
}
