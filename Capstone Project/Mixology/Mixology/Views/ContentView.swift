//
//  ContentView.swift
//  BevvyTest
//
//  Created by Chris Olsen on 2023-11-20.
//

import SwiftUI



struct ContentView: View {
  @ObservedObject var drinkStore: DrinkStore
  
  var body: some View {
    VStack {
      NavigationStack {
        
        TabView{
         
          Text("HomeScreen")
            .tabItem {
              Label("Home", systemImage: "wineglass")
                
        }
            
          
          BrowseView(drinkStore: drinkStore)
            .tabItem {
              Label("Browse", systemImage: "list.dash")
                .navigationBarTitle("Browse")
        }
          
          Text("FavouritesScreen")
            .tabItem {
              Label("Favourites", systemImage: "star")
          
        }
      }
        .navigationBarTitle("Bevvy")
        
        //.font(.largeTitle)
        
      }
      
      
      //.searchable(text: <#T##Binding<String>#>)
      
      
      
      
      
      
//            if !drinkStore.loadedDrinkData.drinks.isEmpty {
//              Text(drinkStore.loadedDrinkData.drinks.first!.drinkName)
//              AsyncImage(url: drinkStore.loadedDrinkData.drinks.first?.imageURL)
//              Text((drinkStore.loadedDrinkData.drinks.first?.instructions)!)
//        }
//                Spacer()
      
      
//                Button {
//                  Task {
//                    do {
//                      try await drinkStore.fetchAPIData()
//                      print("fetched remote data")
//                      print(drinkStore.loadedDrinkData.drinks.first!.tagsArray.count)
//                     // apiStore.isFetchingData = false
//                    } catch CustomErrors.invalidAPIURL {
//                      print("InvalidAPIURL")
//                      //apiStore.isFetchingData = false
//                    } catch CustomErrors.invalidAPIResponse {
//                      print("Invalid Reponse")
//                      //apiStore.isFetchingData = false
//                    } catch CustomErrors.invalidAPIData {
//                      print("Invalid Data")
//                      //apiStore.isFetchingData = false
//                    } catch {
//                      print("Unexpected Error")
//                    }
//                  }
//                } label: {
//                  Text("Test")
//                }
//      
//              }
//              .padding()
    }
  }
}

#Preview {
  ContentView(drinkStore: DrinkStore())
}
