//
//  APIService.swift
//  MobileTakeHome
//
//  Created by ray williams on 2/3/25.
//


import Foundation


enum APIError: Error, LocalizedError {
    case invalidURL
    case invalidResponseStatus
    case decodingError
    case dataTaskError
    
    var errorDescription: String? {
        switch self {
        case .invalidURL:
            return NSLocalizedString("The endpoint URL is invalid", comment: "")
        case .invalidResponseStatus:
            return NSLocalizedString("Response code error", comment: "")
        case .decodingError:
            return NSLocalizedString("Error decoding json", comment: "")
        case .dataTaskError:
            return NSLocalizedString("Error getting Recipe", comment: "")
        }
    }
}

struct APIService: APIServiceProtocol {
    private let baseURL = "https://d3jbb8n5wk0qxi.cloudfront.net/"
    
    func getAllRecipe<R: Decodable>(urlEndpoint: String) async throws -> R {
        
        guard let url = URL(string: urlEndpoint) else {
            throw APIError.invalidURL
        }
        
        do {
            let (data, response) = try await URLSession.shared.data(from: url)
            guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
                throw APIError.invalidResponseStatus
            }
            let decoder = JSONDecoder()
            do {
                let decodeData = try decoder.decode(R.self, from: data)
                return decodeData
            } catch {
                throw APIError.decodingError
            }
        } catch {
            throw APIError.dataTaskError
        }
    }
}
