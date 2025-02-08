//
//  APIServiceProtocol.swift
//  MobileTakeHome
//
//  Created by ray williams on 2/6/25.
//
import Foundation


protocol APIServiceProtocol {
    func getAllRecipe<R: Decodable>(urlEndpoint: String) async throws -> R
}
