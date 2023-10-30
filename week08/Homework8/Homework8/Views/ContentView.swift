import SwiftUI

struct ContentView: View {
  @MainActor @ObservedObject var apiStore: APIStore
  
  var body: some View {
    
    NavigationStack {
      VStack {
        if apiStore.isFetchingData {
          ProgressView("Downloading JSON data...")
            .tint(.orange)
        }
        else if !apiStore.isFetchingData && apiStore.loadedAPIData.entries.isEmpty {
          ContentUnavailableView("Missing JSON Data", systemImage: "folder.badge.questionmark")
            .symbolRenderingMode(.multicolor)
            .symbolEffect(.pulse)
        }
      }
      if !apiStore.loadedAPIData.entries.isEmpty {
        List(apiStore.loadedAPIData.entries) { api in
          NavigationLink(value: api) {
            Text(api.api)
          }
          .navigationBarTitle("APIs")
        }
        
        .navigationDestination(for: APIEntry.self) { api in
          APIDetailView(api: $apiStore.loadedAPIData.entries
            .first(where: { $0.id == api.id })!)
        }
      }
    }
    
    
    .alert("Could Not Retrieve Remote or Local JSON", isPresented: $apiStore.showingAPIError) {
      Button("OK", role: .cancel) { }
    }
    .task {
      do {
        try await apiStore.fetchAPIData()
        print("fetched remote data")
        apiStore.isFetchingData = false
      } catch CustomErrors.invalidAPIURL {
        print("InvalidAPIURL")
        apiStore.isFetchingData = false
      } catch CustomErrors.invalidAPIResponse {
        print("Invalid Reponse")
        apiStore.isFetchingData = false
      } catch CustomErrors.invalidAPIData {
        print("Invalid Data")
        apiStore.isFetchingData = false
      } catch {
        print("Unexpected Error")
      }
      
      if apiStore.loadedAPIData.entries.isEmpty {
        apiStore.loadLocalAPIJSON()
      }
    }
    
  }
  
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView(apiStore: APIStore())
  }
}
