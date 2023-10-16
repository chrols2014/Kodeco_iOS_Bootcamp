import Foundation


class APIStore: ObservableObject {
  let apiJSONDocumentsDirURL = URL(fileURLWithPath: "apilist",
                                   relativeTo: FileManager.documentsDirectoryURL).appendingPathExtension("json")
  
  let apiJSONBundleDirURL = URL(fileURLWithPath: "apilist",
                                relativeTo: FileManager.bundleURL).appendingPathExtension("json")
  
  //let apiJSONBundleDirURL = Bundle.main.url(forResource: "apilist", withExtension: "json")
  
  
  
  @Published var loadedAPIData: APIJSONData = APIJSONData(count: 0, entries: [])  {
    didSet {
      //saveAPIJSON()
    }
  }
  
  @Published var showingError: Bool = false
  
  init() {
    loadAPIJSON()
    saveAPIJSON()
  }
  

  private func loadAPIJSON() {
   
    var workingDirectory: URL
    
    // print(apiJSONDocumentsDirURL)
    // print(apiJSONBundleDirURL)
    
    if FileManager.default.fileExists(atPath: apiJSONBundleDirURL.path) {
      print("file found in bundle")
      
      workingDirectory = apiJSONBundleDirURL
      decodeJSON(url: workingDirectory)
      
    } else if FileManager.default.fileExists(atPath: apiJSONDocumentsDirURL.path) {
      print("file not in bundle but found in documents directory")
      
      workingDirectory = apiJSONDocumentsDirURL
      decodeJSON(url: workingDirectory)
      
    } else {
      print("file not found either directory")
      showingError = true
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
  
  
 private func decodeJSON(url: URL) {
    let decoder = JSONDecoder()
    do {
      let apiData = try Data(contentsOf: url)
      loadedAPIData = try decoder.decode(APIJSONData.self, from: apiData)
    } catch let error {
      print(error)
      showingError = true
    }
    
  }
}
