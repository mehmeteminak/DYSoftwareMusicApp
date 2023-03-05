//
//  PodcastModel.swift
//  MusicAppDYSoftware
//
//  Created by Macbook Air on 5.03.2023.
//

import Foundation

struct PodcastItem :  Item {
    var results: [ItemResult]
    
    
    init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            self.results = try container.decode([PodcastResult].self, forKey: .results)
        }

        private enum CodingKeys: String, CodingKey {
            case results
        }
    
}
struct PodcastResult : ItemResult  {
    
    var description: String?
    
    var releaseDate: String?
    
    
    var imageUrl: String?
    
    var itemName: String?
    
    var itemPrice: Double?
    
    

    private enum CodingKeys : String , CodingKey {
        case releaseDate = "releaseDate"
        case itemName = "trackName"
        case imageUrl = "artworkUrl600"
        case itemPrice = "collectionPrice"
        case description = "primaryGenreName"
    }
    
}
