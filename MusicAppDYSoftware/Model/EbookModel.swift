
import Foundation




// MARK: - Items
struct EbookItem : Item {
    var results: [ItemResult]
    
    
    init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            self.results = try container.decode([EbookResult].self, forKey: .results)
        }

        private enum CodingKeys: String, CodingKey {
            case results
        }
    
    
}

// MARK: - Result
struct EbookResult :  ItemResult {
    var secondImage: String?
    
    var description: String?
    
    var itemSecondImg: String?
    
    
    var imageUrl: String?
    
    var itemName: String?
    
    var itemPrice: Double?
    
    var releaseDate: String?
    
    private enum CodingKeys : String , CodingKey {
        case imageUrl = "artworkUrl100"
        case itemName = "trackCensoredName"
        case itemPrice = "formattedPrice"
        
    }
    
}



