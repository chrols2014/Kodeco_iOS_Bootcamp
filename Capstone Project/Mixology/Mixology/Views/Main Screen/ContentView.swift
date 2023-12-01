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
          BrowseView(drinkStore: drinkStore, searchTerm: $drinkStore.searchTerm)
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
      .onAppear {
        URLCache.shared.memoryCapacity = 1024 * 1024 * 512
      }
      .task {
        drinkStore.loadLocalRecentsJSON()
        drinkStore.loadLocalFavouritesJSON()
        do {
          if networkMonitor.isConnected {

            try await drinkStore.fetchPopularDrinkAPIData()
            try await drinkStore.fetchRandomDrinkAPIData()
            try await drinkStore.fetchAllDrinks()

          }
        } catch CustomErrors.invalidAPIURL {
          print("Invalid API")
        } catch CustomErrors.invalidAPIResponse {
          print("Invalid APIResponse")
        }  catch CustomErrors.invalidAPIData {
          print("Invalid APIData")
        } catch {
          print("unexpected error")
        }
      }
    } else {
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
