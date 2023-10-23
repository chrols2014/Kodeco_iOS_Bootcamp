import SwiftUI

struct ContentView: View {
  @ObservedObject var apiStore: APIStore
  @ObservedObject var userStore: UserStore
  
  var body: some View {
    
    TabView {
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
      .tabItem {
        Label("APIs", systemImage: "network")
      }
      
      VStack {
        if userStore.loadedUserData.results.isEmpty {
          Text("No User Data Found")
        } else {
          UserDetailView(user: userStore.loadedUserData.results[0])
        }
      }

      .tabItem {
        Label("User Details", systemImage: "person")
      }
    }
    .alert("No API JSON File Found", isPresented: $apiStore.showingAPIError) {
      Button("OK", role: .cancel) { }
    }
    .alert("No UserInfo JSON File Found", isPresented: $userStore.showingUserError) {
      Button("OK", role: .cancel) { }
    }
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView(apiStore: APIStore(), userStore: UserStore())
  }
}
