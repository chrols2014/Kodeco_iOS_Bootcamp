import SwiftUI

struct ContentView: View {
  @ObservedObject var apiStore: APIStore
  var body: some View {
    NavigationStack {
      List(apiStore.loadedAPIData.entries) { api in
        NavigationLink(value: api) {
          Text(api.api)
          
        }
        
//        ForEach(apiStore.loadedAPIData.entries) { index in
//          Text(index.api)
        //}
      }
      //.listStyle( GroupedListStyle() )
      .navigationBarTitle("APIs")
      
      .navigationDestination(for: APIEntry.self) { api in
        APIDetailView(api: $apiStore.loadedAPIData.entries
          .first(where: { $0.id == api.id })!)
    }
    
    }
  
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView(apiStore: APIStore())
  }
}
