//
//  HomeScreenView.swift
//  Mixology
//
//  Created by Chris Olsen on 2023-11-27.
//

import SwiftUI

struct HomeScreenView: View {
  @ObservedObject var drinkStore: DrinkStore
  var body: some View {

      ScrollView(.vertical, showsIndicators: false) {
        VStack(spacing: 30) {
          if drinkStore.recentlyViewedDrinkData.drinks != [] {
            DrinkCarouselView(drinks: drinkStore.recentlyViewedDrinkData.drinks, title: "Recently Viewed Drinks")
          }
          DrinkCarouselView(drinks: drinkStore.popularDrinkData.drinks, title: "Popular Drinks")
          DrinkCarouselView(drinks: drinkStore.randomDrinkData.drinks, title: "Ten Random Drinks")

       
        }.padding(.top, 30)
      }

    .navigationBarTitleDisplayMode(.inline)
    .toolbar {
      ToolbarItem(placement: .principal) {
        LogoNavBarItemView()

      }
    }
  }
}

#Preview {
  HomeScreenView(drinkStore: DrinkStore())
    
}
