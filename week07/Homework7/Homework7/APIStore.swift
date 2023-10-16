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
  
  // private func loadJSONAPIEntries
  private func loadAPIJSON() {
    let decoder = JSONDecoder()
    
     print(apiJSONDocumentsDirURL)
    
    
    
//    if FileManager.fileExists(atPath: apiJSONBundleDirURL.path()) {
//      print("file found in bundle")
//    } else {
//      print("file not found in bundle")
//    }
//    
//    if FileManager.default.fileExists(atPath: apiJSONDocumentsDirURL.path()) {
//      print("file found in documents directory")
//    } else {
//      print("file not found in documents directory")
//    }
    
    do {
      let apiData = try Data(contentsOf: apiJSONBundleDirURL)
      loadedAPIData = try decoder.decode(APIJSONData.self, from: apiData)
    } catch let error {
      print(error)
      showingError = true
    }
    
  }
  
  
  
  
  
  func saveAPIJSON() {
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
  
}
