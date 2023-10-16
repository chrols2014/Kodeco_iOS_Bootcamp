import SwiftUI

struct APIDetailView: View {
  @Binding var api: APIEntry
  
    var body: some View {
      VStack {
        Form {
          
//          TextField("Name", text: $api.api)
          Text(api.api)
          Text(api.description)
          Text(api.auth)
          Text(api.https.description)
          Text(api.cors)
          Text(api.link)
          Text(api.category)
          
        }
        
      }
    }
}

#Preview {
  APIDetailView(api: .constant(APIEntry(api: "test", description: "test", auth: "test", https: false, cors: "test", link: "test", category: "test")))
}
