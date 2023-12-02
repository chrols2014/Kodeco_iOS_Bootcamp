//
//  DrinkDetailView.swift
//  BevvyTest
//
//  Created by Chris Olsen on 2023-11-23.
//

import SwiftUI

struct DrinkDetailView: View {
  @State private var animate = false
  @ObservedObject var drinkStore: DrinkStore
  @Environment(NetworkMonitor.self) private var networkMonitor
  @State private var showingAlert = false
  var drink: Drink

  var body: some View {


    ScrollView(.vertical, showsIndicators: true) {
      
        DrinkImageView(drink: drink)
          .scaledToFit()
          .frame(height: 300)
          .cornerRadius(3.0)



      VStack(alignment: .center, spacing: 10) {
        Text(drink.drinkName.capitalized)
          .font(.title)
          .foregroundStyle(.accent)
        Button {
          animate.toggle()
          drinkStore.toggleFavourite(drink: drink)
        } label: {
          Image(systemName: drinkStore.isFavourite(drink: drink) ? "star.fill" : "star")
            .symbolEffect(.bounce, value: animate)
            .contentTransition(.symbolEffect(.replace))
            .foregroundStyle(.yellow)
        }

        .buttonStyle(BorderlessButtonStyle())

        Text(drink.glass?.capitalized ?? "")
          .font(.subheadline)
          .foregroundStyle(.purple)
Text("Ingredients")
          .font(.title3)
          .foregroundStyle(.accent)
        HStack {
          VStack(spacing:1) {
            ForEach(drink.ingredientArray.indices) {
              Text(self.drink.ingredientArray[$0])
                .foregroundStyle(.accent)
            }
          }

          VStack(spacing:1) {
            ForEach(drink.measurementsArray.indices) {
              Text(self.drink.measurementsArray[$0])
                .foregroundStyle(.purple)
            }
          }
        }


          Text("Directions")
          .foregroundStyle(.accent)
          .font(.title3)
          .padding(.top, 20)

        Text(drink.instructions ?? "No instructions available.")
          .foregroundStyle(.accent)
          .padding(.horizontal, 30)
      }
      .padding(.bottom, 50)

      Spacer()
        .navigationBarTitleDisplayMode(.inline)

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
            .symbolEffect(.bounce.down, options: .speed(0.2).repeat(3), value: animate)
            .foregroundColor(.pink)
            .padding(.trailing, 10)
            .onTapGesture {
              showingAlert = true
            }
            .onAppear {
              animate = true
            }
            .onDisappear {
              animate = false
            }

        }
      }
    }
    .onAppear {
      drinkStore.setRecentlyViewed(drink: drink)
      print("Ingredients: \(drink.ingredientArray.count)")
    }
  }
    }


#Preview {
  DrinkDetailView(drinkStore: DrinkStore(), drink: MockData().mockDrink)
    .environment(NetworkMonitor())
}
