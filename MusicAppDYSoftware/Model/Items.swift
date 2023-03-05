
import Foundation

struct Items: Codable {
    let resultCount: Int
    let results: [Result]
}

// MARK: - Result
struct Result: Codable {
    
    let shortDescription: String?
    let longDescription: String
    let hasITunesExtras: Bool?

  
}
