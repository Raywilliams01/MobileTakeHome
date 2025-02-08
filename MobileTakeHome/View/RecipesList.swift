//
//  ContentView.swift
//  MobileTakeHome
//
//  Created by ray williams on 2/3/25.
//

import SwiftUI

struct RecipesList: View {
    
    @StateObject var recipeListViewModel = RecipeListViewModel(apiService: APIService())
    @Environment(\.dismiss) var dismiss
    @State private var showingSheet = false
    @State private var selectedRecipe: Recipe?
    
    var body: some View {
        NavigationView {
            List {
                ForEach(recipeListViewModel.listOfRecipe){ recipe in
                    NavigationLink {
                        RecipeDetail(recipe: recipe)
                    } label : {
                        RecipeCard(recipe: recipe)
                    }
                }
            }
        }
        .sheet(isPresented: $showingSheet){
            VStack {
                if let selectedRecipe = selectedRecipe, let youtubeVideo = selectedRecipe.youtube_url {
                    YoutubeView(videoUrl: youtubeVideo)
                }else {
                    VStack(alignment: .center){
                        Image(systemName: "photo.on.rectangle.angled")
                        Text("Sorry this does not have any video to play")
                    }
                }
                Button("Press to dismiss") {
                    showingSheet.toggle()
                    dismiss()
                }
                
            }
        }
        .overlay{
            if recipeListViewModel.isLoading {
                progressView
            } else if recipeListViewModel.showAlert {
                ErrorMessage(errorMessage: recipeListViewModel.errorMessage)
            } else if recipeListViewModel.listOfRecipe.isEmpty {
                empty
            }
        }
        .onAppear {
            Task {
                await recipeListViewModel.fetchRecipe()
            }
        }
    }
    
    private var empty: some View {
        VStack {
            Image(systemName: "list.bullet.clipboard.fill")
                .font(.largeTitle)
            Text("Sorry the current Recipe List is Empty")
        }
    }
    
    private var progressView: some View {
        ProgressView()
            .progressViewStyle(CircularProgressViewStyle(tint: .purple))
            .scaleEffect(3)
    }
    
    
}

#Preview {
    RecipesList()
}
