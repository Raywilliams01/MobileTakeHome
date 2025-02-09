//
//  APIError.swift
//  MobileTakeHome
//
//  Created by ray williams on 2/9/25.
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
