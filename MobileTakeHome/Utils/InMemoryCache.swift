//
//  FileManager.swift
//  MobileTakeHome
//
//  Created by ray williams on 2/5/25.
//

import Foundation

final class InMemoryCache: CacheProtocol {
    
    private var emptyRecipeList: [Recipe] = []
    
    func load() -> [Recipe]? {
        return emptyRecipeList
    }
    
    func save(recipeList: [Recipe]){
        emptyRecipeList = recipeList
    }
}
