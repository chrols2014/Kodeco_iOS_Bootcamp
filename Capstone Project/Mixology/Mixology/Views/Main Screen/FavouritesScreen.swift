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
  @Environment(NetworkMonitor.self) private var networkMonitor

  var body: some View {

    DrinkListView(drinkList: $drinkStore.favouriteDrinkData.drinks, sectionTitle: "Favourite Drinks")

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
              .onAppear {
                isAnimating = true
              }
              .onDisappear {
                isAnimating = false
              }

          }
        }
      }

  }

}

#Preview {
  FavouritesScreen(drinkStore: DrinkStore())
    .environment(NetworkMonitor())
}
