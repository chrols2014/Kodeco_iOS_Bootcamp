//
//  BrowseView.swift
//  BevvyTest
//
//  Created by Chris Olsen on 2023-11-22.
//

import SwiftUI

struct BrowseView: View {
  @ObservedObject var drinkStore: DrinkStore
  @Binding var searchTerm: String

  var filteredDrinks: [Drink] {
    if searchTerm.isEmpty {
      return drinkStore.allDrinksData.drinks
    } else {
      return drinkStore.allDrinksData.drinks.filter {
        $0.drinkName.contains(searchTerm)
      }
    }
  }

  var body: some View {
    DrinkListView(drinkStore: drinkStore, drinkList: filteredDrinks,
                    sectionTitle: "Browse Drinks")


      .searchable(text: $drinkStore.searchTerm)
      .onSubmit(of: .search) {
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
  BrowseView(drinkStore: DrinkStore(), searchTerm: .constant(""))
}
