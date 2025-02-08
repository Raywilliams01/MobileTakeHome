//
//  RecipeCard.swift
//  MobileTakeHome
//
//  Created by ray williams on 2/4/25.
//

import SwiftUI

struct RecipeCard: View {
    
    let recipe: Recipe
    
    @ViewBuilder
    var body: some View {
        HStack {
            HStack {
                VStack(alignment: .leading) {
                    if let urlImage = recipe.photo_url_small {
                        ImageComponent(
                            urlImage: urlImage,
                            imageSize: .small,
                            imageId: recipe.uuid
                        )
                    } else {
                        Image(systemName: "photo.on.rectangle.angled")
                    }
                }
                VStack(alignment: .leading) {
                    Text(recipe.name)
                    Text(recipe.cuisine)
                }
            }
            Spacer()
            VStack(alignment: .trailing){
                Image(systemName: "link.circle.fill")
                    .font(.largeTitle)
                    .foregroundColor(Color.blue)
                    
            }
        }.id(recipe.id)
    }
}


#Preview{
    let recipe = Recipe(
        cuisine: "Malaysian",
        name: "Apam Balik",
        photo_url_large: "https://d3jbb8n5wk0qxi.cloudfront.net/photos/b9ab0071-b281-4bee-b361-ec340d405320/large.jpg",
        photo_url_small: "https://d3jbb8n5wk0qxi.cloudfront.net/photos/b9ab0071-b281-4bee-b361-ec340d405320/small.jpg",
        source_url: "https://www.nyonyacooking.com/recipes/apam-balik~SJ5WuvsDf9WQ",
        uuid: "0c6ca6e7-e32a-4053-b824-1dbf749910d8",
        youtube_url: "https://www.youtube.com/watch?v=6R8ffRRJcrg"
    )
    
    RecipeCard(recipe: recipe)
}
