
import Foundation

struct UserJSONData: Codable {
    let results: [User]
    let info: Info
}

struct Info: Codable {
    let seed: String
    let results, page: Int
    let version: String
}
