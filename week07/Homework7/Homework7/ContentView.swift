import SwiftUI

struct ContentView: View {
  @ObservedObject var apiStore: APIStore
  var body: some View {
    NavigationStack {
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
    .alert("No API JSON File Found", isPresented: $apiStore.showingError) {
                Button("OK", role: .cancel) { }
            }
    //.onAppear { apiStore.saveAPIJSON() }
    
  }
    
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView(apiStore: APIStore())
  }
}
