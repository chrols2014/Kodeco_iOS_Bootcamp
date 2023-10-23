import Foundation


class APIStore: ObservableObject {
  let apiJSONDocumentsDirURL = URL(fileURLWithPath: "apilist",
                                   relativeTo: FileManager.documentsDirectoryURL).appendingPathExtension("json")
  
  let apiJSONBundleDirURL = URL(fileURLWithPath: "apilist",
                                relativeTo: FileManager.bundleURL).appendingPathExtension("json")
  
  @Published var loadedAPIData: APIJSONData = APIJSONData(count: 0, entries: [])
  @Published var showingAPIError: Bool = false
  
  init() {
    loadAPIJSON()
    
    if !loadedAPIData.entries.isEmpty {
      saveAPIJSON()
    }
  }
  
  
  private func loadAPIJSON() async {
    var networkManager = NetworkManager()
    var workingDirectory: URL
    
//    if FileManager.default.fileExists(atPath: apiJSONBundleDirURL.path) {
//      print("API file found in bundle")
//      
//      workingDirectory = apiJSONBundleDirURL
//      decodeJSON(url: workingDirectory)
//      
//    } else if FileManager.default.fileExists(atPath: apiJSONDocumentsDirURL.path) {
//      print("API file not in bundle but found in documents directory")
//      
//      workingDirectory = apiJSONDocumentsDirURL
//      decodeJSON(url: workingDirectory)
//      
//    } else {
//      print("API file not found in either directory")
//      showingAPIError = true
//    }
    
    loadedAPIData = networkManager.getAPIData()
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
  
  
  func decodeJSON(url: URL) {
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
