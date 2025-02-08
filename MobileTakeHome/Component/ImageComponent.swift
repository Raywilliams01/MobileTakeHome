//
//  ImageComponent.swift
//  MobileTakeHome
//
//  Created by ray williams on 2/4/25.
//

import SwiftUI

enum ImageSize: Hashable {
    case small
    case large
}

struct ImageComponent: View {
    var urlImage: String
    var imageSize: ImageSize
    var imageId: String
    
    private var maxWidth: CGFloat = 0
    private var maxHeight: CGFloat = 0
    
    init(urlImage: String, imageSize: ImageSize, imageId: String) {
        self.urlImage = urlImage
        self.imageSize = imageSize
        self.imageId = imageId
        
        switch imageSize {
        case .small:
            maxWidth = 60
            maxHeight = 60
        case .large:
            maxWidth = 120
            maxHeight = 120
        }
    }
    
    var body: some View {
        AsyncImage(url: URL(string: urlImage)){ phase in
            if let image = phase.image {
                image.resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(maxWidth: maxWidth, maxHeight: maxHeight)
                    .clipShape(.circle)
            } else if phase.error != nil {
                Image(systemName: "photo.on.rectangle.angled")
                    .frame(maxWidth: maxWidth, maxHeight: maxHeight)
                    .clipShape(.circle)
            } else {
                ProgressView()
            }
        }.id(imageId)
    }
}

#Preview {
    ImageComponent(
        urlImage: "https://d3jbb8n5wk0qxi.cloudfront.net/photos/b9ab0071-b281-4bee-b361-ec340d405320/small.jpg",
        imageSize: .large,
        imageId: "0c6ca6e7-e32a-4053-b824-1dbf749910d8"
    )
}
