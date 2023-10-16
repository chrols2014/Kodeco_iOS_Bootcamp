import SwiftUI

struct APIDetailView: View {
  @Binding var api: APIEntry
  
    var body: some View {
      VStack {
        Form {
          
//          TextField("Name", text: $api.api)
          Section(header: Text("API Name")) {
            Text(api.api)
          }
          
          Section(header: Text("API Description")) {
            Text(api.description)
          }
         
          Section(header: Text("Authentication")) {
            Text(api.auth)
          }
          
          Section(header: Text("HTTPS Support")) {
            Text(api.https.description)
          }
          
          Section(header: Text("Cross-Origin Resource Sharing")) {
            Text(api.cors)
          }
          Section(header: Text("Link")) {
            Text(api.link)
          }
          Section(header: Text("Category")) {
            Text(api.category)
          }
        
   
        
          
          
          
        }
        .navigationBarTitleDisplayMode(.inline)
        
      }
    }
}

#Preview {
  APIDetailView(api: .constant(APIEntry(api: "name", description: "description", auth: "auth", https: false, cors: "cors", link: "link", category: "category")))
}
