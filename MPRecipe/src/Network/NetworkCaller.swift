//
//  NetworkHandler.swift
//  MPRecipe
//
//  Created by Mauricio Pimienta on 10/7/24.
//

import Foundation
import UIKit

enum NetworkError: Error {
    case invalidUrl, decodableError, invalidResponse, parseError, responseError
}

enum MemberType {
    case photo, source, youtube, json
}

class NetworkCaller {
    
    // MARK: Constants
    static let shared = NetworkCaller()
    
    // MARK: External
    func loadFrom<T: Decodable>(urlString: String, type: MemberType, completion: @escaping (_ result: Result<T, NetworkError>) -> Void) {
        guard let url = URL(string: urlString) else {
            completion(.failure(.invalidUrl))
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            if error != nil {
                completion(.failure(.responseError))
                return
            }
            guard let data = data else {
                completion(.failure(.decodableError))
                return
            }
            guard let httpResponse = response as? HTTPURLResponse,
                  (200...299).contains(httpResponse.statusCode) else {
                completion(.failure(.invalidResponse))
                return
            }
            
            switch type {
            case .photo:
                if let photoData = RecipePhotoData(photoData: data) as? T {
                    completion(.success(photoData))
                } else {
                    completion(.failure(.decodableError))
                }
            case .source: break
            case .youtube: break
            case .json:
                do {
                    let decoder = JSONDecoder()
                    decoder.keyDecodingStrategy = .convertFromSnakeCase
                    let response = try decoder.decode(T.self, from: data)
                    completion(.success(response))
                } catch {
                    completion(.failure(.parseError))
                }
            }
            
        }.resume()
    }
    
    // Concurrency mock
    /*
    func loadFrom<T: Decodable>(urlString: String, type: MemberType) async throws -> T? {
        guard let url = URL(string: urlString) else {
            throw NetworkError.invalidUrl
        }
        
        let (data, response) = try await URLSession.shared.data(from: url)
        
        guard let httpResponse = response as? HTTPURLResponse,
              (200...299).contains(httpResponse.statusCode) else {
            throw NetworkError.invalidResponse
        }
        
        switch type {
        case .photo:
            if let photoData = RecipePhotoData(photoData: data) as? T {
                return photoData
            } else {
                throw NetworkError.decodableError
            }
        case .source: break // add more functionality
        case .youtube: break // add more functionality
        case .json:
            do {
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                return try decoder.decode(T.self, from: data)
            } catch {
                throw NetworkError.parseError
            }
        }
        
        return nil
    }
     */
    
}
