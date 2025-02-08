//
//  Cache.swift
//  MobileTakeHome
//
//  Created by ray williams on 2/5/25.
//

import Foundation

protocol CacheProtocol {
    func load()-> [Recipe]?
    func save(recipeList: [Recipe])
}
