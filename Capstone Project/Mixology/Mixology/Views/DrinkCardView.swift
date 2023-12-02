//
//  DrinkCardView.swift
//  BevvyTest
//
//  Created by Chris Olsen on 2023-11-21.
//

import SwiftUI

struct DrinkCardView: View {
  let drink: Drink
  
  var body: some View {
    VStack(alignment: .leading) {

      DrinkImageView(drink: drink)


        Spacer()
        Text(drink.drinkName.capitalized)
          .padding(.horizontal, 7)
          .minimumScaleFactor(0.7)
          .lineLimit(1)
          .foregroundStyle(.pink)
        Text(drink.glass?.capitalized ?? "")
          .font(.caption)
          .foregroundStyle(.purple.opacity(0.8))
          .padding(.horizontal, 7)
        Spacer()

    }
    .frame(width: 160, height: 200)
    .background(.ultraThinMaterial)
    .cornerRadius(5)
  }
}

#Preview {
  DrinkCardView(drink: MockData().mockDrink)
}
