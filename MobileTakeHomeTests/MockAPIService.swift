//
//  MockAPIService.swift
//  MobileTakeHome
//
//  Created by ray williams on 2/6/25.
//

import Foundation
@testable import MobileTakeHome

final class MockAPIService: APIServiceProtocol, Mockable {
    
    func getAllRecipe<R: Decodable>(urlEndpoint: String) async throws -> R {
        switch urlEndpoint {
        case APIEndpoint.emptyData.path:
            return loadJSON(filename: "EmptyRecipeResponse", type: Recipe.self) as! R
        case APIEndpoint.malformedData.path:
            throw APIError.dataTaskError
        default:
            throw APIError.dataTaskError
        }
    }
    
    
    func getAllRecipe() async throws -> [Recipe] {
        return loadJSON(filename: "RecipeResponse", type: Recipe.self)
    }
}
