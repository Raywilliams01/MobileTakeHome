//
//  Recipe.swift
//  MobileTakeHome
//
//  Created by ray williams on 2/3/25.
//

import Foundation

// do not include Identifiable becaus eof UUID
struct Recipe: Codable, Identifiable {
    var id: UUID { UUID() }
    var cuisine: String
    var name: String
    var photo_url_large: String?
    var photo_url_small: String?
    var source_url: String?
    var uuid: String
    var youtube_url: String?
    
}
