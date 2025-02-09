//
//  APIService.swift
//  MobileTakeHome
//
//  Created by ray williams on 2/3/25.
//


import Foundation


struct APIService: APIServiceProtocol {

    func getAllRecipe<R: Decodable>(urlEndpoint: String) async throws -> R {
        
        guard let url = URL(string: urlEndpoint) else {
            throw APIError.invalidURL
        }
        print("getAllRecipe was called")
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
