//
//  BrowseView.swift
//  BevvyTest
//
//  Created by Chris Olsen on 2023-11-22.
//

import SwiftUI

struct BrowseView: View {
  @ObservedObject var drinkStore: DrinkStore
  var body: some View {
   
      //      List(/*@START_MENU_TOKEN@*/0 ..< 5/*@END_MENU_TOKEN@*/){ item in
      //        DrinkListCellView(drink: MockData().mockDrink)
      //      }
      List(drinkStore.loadedDrinkData.drinks) { drink in
        NavigationLink(value: drink) {
          DrinkListCellView(drink: drink)
        }
      }
//      Button {
//        Task {
//          do {
//            try await drinkStore.fetchAPIData()
//            print("fetched remote data")
//            print(drinkStore.loadedDrinkData.drinks.first!.tagsArray.count)
//          } catch CustomErrors.invalidAPIURL {
//            print("InvalidAPIURL")
//          } catch CustomErrors.invalidAPIResponse {
//            print("Invalid Reponse")
//          } catch CustomErrors.invalidAPIData {
//            print("Invalid Data")
//          } catch {
//            print("Unexpected Error")
//          }
//        }
//      } label: {
//        Text("Test")
//      }
//      .navigationDestination(for: Drink.self) { drink in
//        DrinkDetailView(drink: drinkStore.loadedDrinkData.drinks
//          .first(where: { $0.id == drink.id })!)
//      }
      .navigationBarTitle("Browse")

  }
}

#Preview {
  BrowseView(drinkStore: DrinkStore())
}
