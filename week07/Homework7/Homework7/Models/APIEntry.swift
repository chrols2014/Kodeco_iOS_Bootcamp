import Foundation

struct APIEntry: Identifiable, Hashable, Codable {
  let id = UUID()
  var api: String
  var description: String
  var auth: String
  var https: Bool
  var cors: String
  var link: String
  var category: String
  
  enum CodingKeys: String, CodingKey {
    case api = "API"
    case description = "Description"
    case auth = "Auth"
    case https = "HTTPS"
    case cors = "Cors"
    case link = "Link"
    case category = "Category"
  }
}
