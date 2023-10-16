import Foundation


class UserStore: ObservableObject {
  let userJSONDocumentsDirURL = URL(fileURLWithPath: "userinfo",
                                   relativeTo: FileManager.documentsDirectoryURL).appendingPathExtension("json")
  
  let userJSONBundleDirURL = URL(fileURLWithPath: "userinfo",
                                relativeTo: FileManager.bundleURL).appendingPathExtension("json")
  
  //let apiJSONBundleDirURL = Bundle.main.url(forResource: "apilist", withExtension: "json")
  
  
  
  @Published var loadedUserData: UserJSONData = UserJSONData(results: [], info: Info(seed: "", results: 0, page: 0, version: "")) {
    didSet {
      //saveAPIJSON()
    }
  }
  
  @Published var showingUserError: Bool = false
  
  init() {
    loadUserJSON()
    
    if !loadedUserData.results.isEmpty {
      saveUserJSON()
    }
  }
  

  private func loadUserJSON() {
   
    var workingDirectory: URL
    
     //print(userJSONDocumentsDirURL)
    // print(apiJSONBundleDirURL)
    
    if FileManager.default.fileExists(atPath: userJSONBundleDirURL.path) {
      print("user file found in bundle")
      
      workingDirectory = userJSONBundleDirURL
      decodeJSON(url: workingDirectory)
      
    } else if FileManager.default.fileExists(atPath: userJSONDocumentsDirURL.path) {
      print("user file not in bundle but found in documents directory")
      
      workingDirectory = userJSONDocumentsDirURL
      decodeJSON(url: workingDirectory)
      
    } else {
      print("user file not found in either directory")
      showingUserError = true
    }
  }
  
  
 private func saveUserJSON() {
    let encoder = JSONEncoder()
    
    do {
      let userData = try encoder.encode(loadedUserData)
      let userJSONURL = URL(fileURLWithPath: "userinfo",
                           relativeTo: FileManager.documentsDirectoryURL).appendingPathExtension("json")
      
      try userData.write(to: userJSONURL, options: .atomicWrite)
    } catch let error {
      print(error)
      
    }
  }
  
  
 private func decodeJSON(url: URL) {
    let decoder = JSONDecoder()
    do {
      let userData = try Data(contentsOf: url)
      loadedUserData = try decoder.decode(UserJSONData.self, from: userData)
    } catch let error {
      print(error)
      showingUserError = true
    }
    
  }
}
