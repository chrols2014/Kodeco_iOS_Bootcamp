//
//  DrinkListCellView.swift
//  BevvyTest
//
//  Created by Chris Olsen on 2023-11-22.
//

import SwiftUI

struct DrinkListCellView: View {
  
  var drink: Drink
  
    var body: some View {
      HStack {
        DrinkImageView(drink: drink)
          .scaledToFit()
          .frame(width: 60, height: 60)
          .cornerRadius(3.0)
          .background(.clear)

        
        VStack(alignment: .leading, spacing: 8) {
          Text(drink.drinkName)
            .fontWeight(.semibold)
            .lineLimit(2)
            .minimumScaleFactor(0.5)
          
          Text(drink.glass ?? "")
            .font(.subheadline)
          
          
          
        }
      }
    }
}

#Preview {
  DrinkListCellView(drink: MockData().mockDrink)
}
