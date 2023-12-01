//
//  DrinkListView.swift
//  Mixology
//
//  Created by Chris Olsen on 2023-11-30.
//

import SwiftUI

struct DrinkListView: View {
 // @ObservedObject var drinkStore: DrinkStore
  @Binding var drinkList: [Drink]
   var sectionTitle: String
  var body: some View {
  
    List() {
      Section(header: Text(sectionTitle).foregroundStyle(.pink)) {
        ForEach(drinkList) { drink in
          NavigationLink(value: drink) {
            DrinkListCellView(drink: drink)
          }
        }

      }
      .headerProminence(.increased)
    }
    .listStyle(.automatic)


    }
}

#Preview {
  DrinkListView(drinkList: .constant(DrinkStore().loadedDrinkData.drinks), sectionTitle: "TestTitle")
}
