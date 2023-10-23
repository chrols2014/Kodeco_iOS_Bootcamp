import Foundation

class APIStore: ObservableObject {
  let apiJSONDocumentsDirURL = URL(fileURLWithPath: "apilist",
                                   relativeTo: FileManager.documentsDirectoryURL).appendingPathExtension("json")
  
  let apiJSONBundleDirURL = URL(fileURLWithPath: "apilist",
                                relativeTo: FileManager.bundleURL).appendingPathExtension("json")
  
  @Published var loadedAPIData: APIJSONData = APIJSONData(count: 0, entries: [])
  @Published var showingAPIError: Bool = false
  @Published var isFetchingData: Bool = true
  
  init() {}
  
  
  func loadLocalAPIJSON()  {
    var workingDirectory: URL
    
    if FileManager.default.fileExists(atPath: apiJSONBundleDirURL.path) {
      print("API file found in bundle")
      
      workingDirectory = apiJSONBundleDirURL
      decodeLocalJSON(url: workingDirectory)
      
    } else if FileManager.default.fileExists(atPath: apiJSONDocumentsDirURL.path) {
      print("API file not in bundle but found in documents directory")
      
      workingDirectory = apiJSONDocumentsDirURL
      decodeLocalJSON(url: workingDirectory)
      
    } else {
      print("API file not found in either directory")
      showingAPIError = true
    }
  }
  
  
  func fetchAPIData() async throws {
    await MainActor.run {
      isFetchingData = true
    }
    
    guard let url = URL(string: "https://api.publicapis.org/entries") else {
      throw CustomErrors.invalidAPIURL
    }
    
    let (data, response) = try await URLSession.shared.data(from: url)
    
    guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
      throw CustomErrors.invalidAPIResponse
    }
    
    do {
      let decoder = JSONDecoder()
      try await MainActor.run {
        loadedAPIData = try decoder.decode(APIJSONData.self, from: data)
        saveAPIJSON()
        isFetchingData = false
      }
    } catch {
      throw CustomErrors.invalidAPIData
      
    }
  }
  
  
  private func saveAPIJSON() {
    let encoder = JSONEncoder()
    
    do {
      let apiData = try encoder.encode(loadedAPIData)
      let apiJSONURL = URL(fileURLWithPath: "apilist",
                           relativeTo: FileManager.documentsDirectoryURL).appendingPathExtension("json")
      
      try apiData.write(to: apiJSONURL, options: .atomicWrite)
    } catch let error {
      print(error)
      
    }
  }
  
  
  func decodeLocalJSON(url: URL) {
    let decoder = JSONDecoder()
    do {
      let apiData = try Data(contentsOf: url)
      loadedAPIData = try decoder.decode(APIJSONData.self, from: apiData)
    } catch let error {
      print(error)
      showingAPIError = true
    }
    
  }
}


enum CustomErrors: Error {
  case invalidAPIURL
  case invalidAPIResponse
  case invalidAPIData
}
