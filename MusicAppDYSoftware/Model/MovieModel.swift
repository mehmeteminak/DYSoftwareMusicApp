//
//  MovieModel.swift
//  MusicAppDYSoftware
//
//  Created by Macbook Air on 5.03.2023.
//

import Foundation

struct MovieItem : Item {
    var results: [ItemResult]
    
    init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            self.results = try container.decode([MovieResult].self, forKey: .results)
        }
    

        private enum CodingKeys: String, CodingKey {
            case results
        }
    
    
}

// MARK: - Result
struct MovieResult :  ItemResult {
    var description: String?
    
    var imageUrl: String?
    
    var itemName: String?
    
    var itemPrice: Double?
    
    var releaseDate: String?
    
    private enum CodingKeys : String , CodingKey {
        case imageUrl = "artworkUrl100"
        case itemName = "trackName"
        case itemPrice = "collectionPrice"
        case description = "longDescription"
        case releaseDate = "releaseDate"
        
    }
    
}
