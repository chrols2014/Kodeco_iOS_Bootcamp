import SwiftUI

struct UserDetailView: View {
  var user: User
  
  var body: some View {
    NavigationView {
      Form {
        Section(header: Text("Name")) {
          Text("\(user.name.first)" + " " + "\(user.name.last)")
        }
        
        
        Section(header: Text("Email")) {
          Text("\(user.email)")
        }
        
        
        Section(header: Text("Phone Number")) {
          Text("\(user.phone)")
        }
        
        
        Section(header: Text("Login")) {
          Text("\(user.login.username)")
        }
        
      }
      .navigationBarTitle("User Details")
    }
  }
}


//
//#Preview {
//  UserDetailView(user: .constant(User))
//}
