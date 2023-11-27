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

        DrinkCarouselView(drinks: drinkStore.popularDrinkData.drinks, title: "Popular Drinks")
        DrinkCarouselView(drinks: drinkStore.randomDrinkData.drinks, title: "Random")
        //DrinkCarouselView(title: "Popular")


      }
    }
  }
}

#Preview {
  HomeScreenView(drinkStore: DrinkStore())
}
