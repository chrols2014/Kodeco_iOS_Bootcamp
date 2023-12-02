//
//  FavouritesScreen.swift
//  Mixology
//
//  Created by Chris Olsen on 2023-11-30.
//

import SwiftUI

struct FavouritesScreen: View {
  @ObservedObject var drinkStore: DrinkStore
  @State private var isAnimating = false
  @State private var showingAlert = false
  @Environment(NetworkMonitor.self) private var networkMonitor

  var body: some View {

    ZStack {
    if !drinkStore.favouriteDrinkData.drinks.isEmpty {
      DrinkListView(drinkStore: drinkStore, drinkList: drinkStore.favouriteDrinkData.drinks, sectionTitle: "Favourite Drinks")
    } else {
      withAnimation {
        ContentUnavailableView("No Favourites Yet",
                               systemImage: "star.slash",
                               description: Text("Start marking drinks as your favourites to see them here and have them available offline."))
        .symbolRenderingMode(.monochrome)
        .foregroundStyle(.pink)
        .symbolEffect(.pulse)
      }
    }
  }
      .navigationBarTitleDisplayMode(.inline)
      .toolbar {
        ToolbarItem(placement: .principal) {
          LogoNavBarItemView()
        }
        if !networkMonitor.isConnected {
          ToolbarItem(placement: .topBarTrailing) {


            Image(systemName: "wifi.exclamationmark")
              .renderingMode(.original)
              .foregroundStyle(.pink, .pink)
              .symbolEffect(.bounce.down, options: .speed(0.2).repeat(3), value: isAnimating)
              .foregroundColor(.pink)
              .padding(.trailing, 10)
              .onTapGesture {
                showingAlert = true
              }
              .onAppear {
                isAnimating = true
              }
              .onDisappear {
                isAnimating = false
              }

          }
        }
      }
      .alert("You're not connected to the internet, only your favourites are available.", isPresented: $showingAlert) {
                  Button("OK", role: .cancel) { }
              }

  }
  

}

#Preview {
  FavouritesScreen(drinkStore: DrinkStore())
    .environment(NetworkMonitor())
}
