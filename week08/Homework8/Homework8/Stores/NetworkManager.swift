import Foundation


class NetworkManager {
  
  func getAPIData() async throws -> APIJSONData {
    
    guard let url = URL(string: "https://api.publicapis.org/entries") else {
      throw CustomErrors.invalidAPIURL
    }
    
    let (data, response) = try await URLSession.shared.data(from: url)
    
    guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
      throw CustomErrors.invalidAPIResponse
    }
    
    do {
      let decoder = JSONDecoder()
      return try decoder.decode(APIJSONData.self, from: data)
    } catch {
      throw CustomErrors.invalidAPIData
    }
  }
}






enum CustomErrors: Error {
  case invalidAPIURL
  case invalidAPIResponse
  case invalidAPIData
}
