//
//  OAuth2Service.swift
//  ImageFeed
//
//  Created by Alex on 22.07.2024.
//

import Foundation

final class OAuth2Service {
    static let shared = OAuth2Service()
    
    private init() {}
    
    struct OAuthTokenResponseBody: Decodable {
        let access_token: String
        let token_type: String
        let scope: String
        let created_at: Int
    }
    
    private func makeOAuthTokenRequest(code: String) -> URLRequest {
        let baseURL = URL(string: "https://unsplash.com")!
        if let url = URL(
            string: "/oauth/token"
            + "?client_id=\(Constants.accessKey)"
            + "&&client_secret=\(Constants.secretKey)"
            + "&&redirect_uri=\(Constants.redirectURI)"
            + "&&code=\(code)"
            + "&&grant_type=authorization_code",
            relativeTo: baseURL
        ) {
            var request = URLRequest(url: url)
            request.httpMethod = "POST"
            return request
        }
        else {
            print("Ошибка в makeOAuthTokenRequest")
            let request = URLRequest(url: baseURL)
            return request
        }
    }
    
//    private func fetchOAuthToken(code: String) {
//        let request = makeOAuthTokenRequest(code: code)
//        let task: URLSessionDataTask = URLSession.shared.dataTask(with: request) { data, response, error in
//            if let error = error {
//                print("Ошибка запроса: \(error)")
//            }
//            // Проверяем, что нам пришёл успешный код ответа
//            if let response = response as? HTTPURLResponse,
//               response.statusCode < 200 || response.statusCode >= 300 {
//                
//            }
//            guard let data = data else {
//                print("Нет данных")
//                return
//            }
//        }
//        task.resume()
//    }
    func fetchOAuthToken(code: String, completion: @escaping (Result<String, Error>) -> Void) {
        let request = makeOAuthTokenRequest(code: code)
        let task: URLSessionDataTask = URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                DispatchQueue.main.async {
                    completion(.failure(error))
                }
                return
            }
            
            guard let httpResponse = response as? HTTPURLResponse else {
                DispatchQueue.main.async {
                    completion(.failure(NetworkError.urlSessionError))
                }
                return
            }
            
            guard (200...299).contains(httpResponse.statusCode) else {
                DispatchQueue.main.async {
                    completion(.failure(NetworkError.httpStatusCode(httpResponse.statusCode)))
                }
                return
            }
            
            guard let data = data else {
                DispatchQueue.main.async {
                    completion(.failure(NetworkError.urlSessionError))
                }
                return
            }
            
            do {
                let tokenResponse = try JSONDecoder().decode(OAuthTokenResponseBody.self, from: data)
                let accessToken = tokenResponse.access_token
                DispatchQueue.main.async {
                    completion(.success(accessToken))
                }
                // Сохранение токена в UserDefaults
                OAuth2TokenStorage.shared.token = accessToken
            } catch {
                DispatchQueue.main.async {
                    completion(.failure(error))
                }
            }
        }
        task.resume()
    }
}

final class OAuth2TokenStorage {
    static let shared = OAuth2TokenStorage()
    private let tokenKey = "authToken"

    
    var token: String? {
        get {
            return UserDefaults.standard.string(forKey: tokenKey)
        }
        set {
            UserDefaults.standard.set(newValue, forKey: tokenKey)
        }
    }
}
