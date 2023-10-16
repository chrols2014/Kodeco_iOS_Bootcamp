import Foundation


struct APIJSONData: Codable {
    let count: Int
    var entries: [APIEntry]
}

