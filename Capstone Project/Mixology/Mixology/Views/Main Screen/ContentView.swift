//
//  ContentView.swift
//  BevvyTest
//
//  Created by Chris Olsen on 2023-11-20.
//

import SwiftUI



struct ContentView: View {
  @ObservedObject var drinkStore: DrinkStore
  @Environment(NetworkMonitor.self) private var networkMonitor

  var body: some View {

    if networkMonitor.isConnected {

      TabView {

        NavigationStack {
          HomeScreenView(drinkStore: drinkStore)
            .navigationDestination(for: Drink.self) { drink in
              DrinkDetailView(drinkStore: drinkStore, drink: drink)
            }
        }
        .tabItem {
          Label("Home", systemImage: "wineglass")
        }

        NavigationStack {
          BrowseView(drinkStore: drinkStore)
            .navigationDestination(for: Drink.self) { drink in
              DrinkDetailView(drinkStore: drinkStore, drink: drink)
            }
            
        }
        .tabItem {
          Label("Browse", systemImage: "list.dash")
        }
        NavigationStack {
        FavouritesScreen(drinkStore: drinkStore)
          .navigationDestination(for: Drink.self) { drink in
            DrinkDetailView(drinkStore: drinkStore, drink: drink)
          }
      }
          .tabItem {
            Label("Favourites", systemImage: "star")
          }
      }


      //.searchable(text: <#T##Binding<String>#>)




      .task {
        do {
          if networkMonitor.isConnected {
            try await drinkStore.fetchPopularDrinkAPIData()
            try await drinkStore.fetchRandomDrinkAPIData()
            try await drinkStore.fetchAPIData()

          }
        } catch CustomErrors.invalidAPIURL {
        } catch CustomErrors.invalidAPIResponse {
        }  catch CustomErrors.invalidAPIData {
        } catch {
          print("unexpected error")

        }
        drinkStore.loadLocalFavouritesJSON()

      }
    } else {
//      ContentUnavailableView(
//        "No Internet Connection",
//        systemImage: "wifi.exclamationmark",
//        description: Text("Please check your connection and try again.")
//      )

      TabView {
        NavigationStack {
        FavouritesScreen(drinkStore: drinkStore)
          .navigationDestination(for: Drink.self) { drink in
            DrinkDetailView(drinkStore: drinkStore, drink: drink)
          }
      }
          .tabItem {
            Label("Favourites", systemImage: "star")
          }
      }
      .task {
        drinkStore.loadLocalFavouritesJSON()
      }
    }

  }




}

#Preview {
  ContentView(drinkStore: DrinkStore())
    .environment(NetworkMonitor())
}
