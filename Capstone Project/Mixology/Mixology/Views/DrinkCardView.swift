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
    VStack {
      AsyncImage(url: drink.imageURL) { image in
        image.resizable()
        
      } placeholder: {
        ProgressView()
      }
      .aspectRatio(contentMode: .fit)
      
      Spacer()
      Text(drink.drinkName.capitalized)

        .tint(.black)
      Spacer()
    }
    .frame(width: 160, height: 200)
    .background(.gray)
    .cornerRadius(5)
  }
}

#Preview {
  DrinkCardView(drink: MockData().mockDrink)
}
