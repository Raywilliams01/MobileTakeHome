//
//  RecipeDetail.swift
//  MobileTakeHome
//
//  Created by ray williams on 2/4/25.
//

import SwiftUI

struct RecipeDetail: View {
    @Environment(\.dismiss) var dismiss
    @State private var showingSheet = false
    let recipe: Recipe
    
    var body: some View {
        VStack {
            HStack {
                VStack {
                    Text(recipe.cuisine)
                    Text(recipe.name)
                }
            }
            
            if let urlImage = recipe.photo_url_large {
                VStack {
                    ImageComponent(
                        urlImage: urlImage,
                        imageSize: .large,
                        imageId: recipe.uuid
                    )
                    HStack {
                        Text("Play")
                        Image(systemName: "play")
                            .resizable()
                            .frame(width: 20, height: 20)
                    }
                }.onTapGesture {
                    showingSheet.toggle()
                }
            }
            
        }.sheet(isPresented: $showingSheet){
            VStack {
                if let youtubeVideo = recipe.youtube_url {
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
    }
}

//#Preview {
//    let recipe = Recipe(
//        cuisine: "Malaysian",
//        name: "Apam Balik",
//        photo_url_large: "https://d3jbb8n5wk0qxi.cloudfront.net/photos/b9ab0071-b281-4bee-b361-ec340d405320/large.jpg",
//        photo_url_small: "https://d3jbb8n5wk0qxi.cloudfront.net/photos/b9ab0071-b281-4bee-b361-ec340d405320/small.jpg",
//        source_url: "https://www.nyonyacooking.com/recipes/apam-balik~SJ5WuvsDf9WQ",
//        uuid: "0c6ca6e7-e32a-4053-b824-1dbf749910d8",
//        youtube_url: "https://www.youtube.com/watch?v=LmJ0lsPLHDc"
//    )
//    RecipeDetail(recipe: recipe)
//}
