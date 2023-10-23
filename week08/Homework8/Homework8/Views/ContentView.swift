import SwiftUI

struct ContentView: View {
 @MainActor @ObservedObject var apiStore: APIStore
  
  var body: some View {
    NavigationStack {
      if apiStore.loadedAPIData.entries.isEmpty {
        VStack {
          Spacer()
          Text("No API JSON file found")
          Spacer()
        }
      }
      List(apiStore.loadedAPIData.entries) { api in
        NavigationLink(value: api) {
          Text(api.api)
        }
      }
      .navigationBarTitle("APIs")
      .navigationDestination(for: APIEntry.self) { api in
        APIDetailView(api: $apiStore.loadedAPIData.entries
          .first(where: { $0.id == api.id })!)
      }
    }
    
    .alert("No API JSON File Found", isPresented: $apiStore.showingAPIError) {
      Button("OK", role: .cancel) { }
    }
    .task {
      do {
        try await apiStore.fetchAPIData()
        print("fetched remote data")
      } catch CustomErrors.invalidAPIURL {
        print("InvalidAPIURL")
      } catch CustomErrors.invalidAPIResponse {
        print("Invalid Reponse")
      } catch CustomErrors.invalidAPIData {
        print("Invalid Data")
      } catch {
        print("Unexpected Error")
      }
    }
  }
    
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView(apiStore: APIStore())
  }
}
