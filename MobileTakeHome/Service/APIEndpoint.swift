//
//  APIEndpoint.swift
//  MobileTakeHome
//
//  Created by ray williams on 2/8/25.
//
// Base URL https://d3jbb8n5wk0qxi.cloudfront.net/recipes.json
import Foundation

enum APIEndpoint {
    case allRecipe
    case malformedData
    case emptyData
    
    private var baseURL: String{
      return "https://d3jbb8n5wk0qxi.cloudfront.net/"
    }
    
    var path: String? {
        switch self {
        case .allRecipe:
            return baseURL+"recipes.json"
        case .malformedData:
            return baseURL+"recipes-malformed.json"
        case .emptyData:
            return baseURL+"recipes-empty.json"
        }
    }
}
