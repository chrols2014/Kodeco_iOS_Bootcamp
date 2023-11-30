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
    ZStack {
//      RadialGradient(colors: [.pink.opacity(0.7), Color.black.opacity(1), Color.black.opacity(1)], startPoint: .topLeading, endPoint: .bottomTrailing)
      //RadialGradient(colors: [.purple.opacity(0.7), .black.opacity(1)], center: .top, startRadius: 1, endRadius: 300)
       
        //.ignoresSafeArea()
      ScrollView(.vertical, showsIndicators: false) {
        VStack(spacing: 30) {
          DrinkCarouselView(drinks: drinkStore.popularDrinkData.drinks, title: "Popular Drinks")
          DrinkCarouselView(drinks: drinkStore.randomDrinkData.drinks, title: "Random")
          //DrinkCarouselView(title: "Popular")
        }
      }
    }
  }
}

#Preview {
  HomeScreenView(drinkStore: DrinkStore())
    
}
