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
          VStack {
            HomeScreenView(drinkStore: drinkStore)
          }
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
        .navigationBarTitle("Mixology")

        //.font(.largeTitle)
        .navigationDestination(for: Drink.self) { drink in
          DrinkDetailView(drink: drink)
            //.first(where: { $0.id == drink.id })!)
        }
      }
      


      
      //.searchable(text: <#T##Binding<String>#>)
      
      
    
    }
    .task {
      do {

        try await drinkStore.fetchPopularDrinkAPIData()
        try await drinkStore.fetchRandomDrinkAPIData()
        try await drinkStore.fetchAPIData()
      } catch CustomErrors.invalidAPIURL {
      } catch CustomErrors.invalidAPIResponse {
      }  catch CustomErrors.invalidAPIData {
      } catch {
        print("unexpected error")

      }

    }
  }




}

#Preview {
  ContentView(drinkStore: DrinkStore())
}
