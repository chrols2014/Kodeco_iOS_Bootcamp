import Foundation


class APIStore: ObservableObject {
  let apiJSONDocumentsDirURL = URL(fileURLWithPath: "apilist",
                                   relativeTo: FileManager.documentsDirectoryURL).appendingPathExtension("json")
  
  let apiJSONBundleDirURL = Bundle.main.url(forResource: "apilist", withExtension: "json")
  
  
  
  @Published var loadedAPIData: APIJSONData = APIJSONData(count: 0, entries: [])  {
    didSet {
      //saveJSONPrioritizedTask()
    }
  }
  
  init() {
    loadAPIJSON()
  }
  
  // private func loadJSONAPIEntries
  private func loadAPIJSON() {
    let decoder = JSONDecoder()
    
    do {
      let apiData = try Data(contentsOf: apiJSONBundleDirURL!)
      loadedAPIData = try decoder.decode(APIJSONData.self, from: apiData)
    } catch let error {
      print(error)
    }
    
  }
}





// private func saveJSONAPIEntries


