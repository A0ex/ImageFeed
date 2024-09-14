//
//  WebViewViewControllerDelegateProtocol.swift
//  ImageFeed
//
//  Created by Alex on 08.06.2024.
//

import Foundation

protocol WebViewViewControllerDelegate: AnyObject {
    func webViewViewController(_ vc: WebViewViewController, didAuthenticateWithCode code: String)
    func webViewViewControllerDidCancel(_ vc: WebViewViewController) 
}

