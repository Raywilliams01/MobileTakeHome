//
//  RecipeListViewModel.swift
//  MobileTakeHome
//
//  Created by ray williams on 2/4/25.
//

import Foundation

class RecipeListViewModel: ObservableObject {
    @Published var listOfRecipe: [Recipe] {
        didSet {
            cacheRecipe.save(recipeList: listOfRecipe)
        }
    }
    @Published var isLoading = false
    @Published var showAlert = false
    @Published var errorMessage: String?
    
    private var recipeArr: RecipeArr? 
    private var cacheRecipe: CacheProtocol = InMemoryCache()
    private var allRecipeAPI: APIServiceProtocol
    
    init(apiService: APIServiceProtocol) {
        self.listOfRecipe = cacheRecipe.load() ?? []
        self.allRecipeAPI = APIService()
    }
    
    @MainActor
    func fetchRecipe() async {
        isLoading.toggle()
        
        defer {
            isLoading.toggle()
        }
        
        do {
            recipeArr = try await allRecipeAPI.getAllRecipe(urlEndpoint: APIEndpoint.allRecipe.path!)
            if let arr = recipeArr?.recipes {
                listOfRecipe = arr
            } else {
                showAlert.toggle()
                errorMessage = "Error: Please contact developer prop is missing"
            }
        } catch {
            showAlert.toggle()
            errorMessage = error.localizedDescription
        }
    }
}
