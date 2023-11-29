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

//      AsyncImage(
//                  url: drink.imageURL,
//                  transaction: Transaction(animation: .easeInOut)
//              ) { phase in
//                  switch phase {
//                  case .empty:
//                    VStack {
//                      Spacer()
//                      ProgressView()
//                      Spacer()
//                    }
//                  case .success(let image):
//                      image
//                          .resizable()
//                          .transition(.scale(scale: 0.9)) //.scale(scale: 0.1, anchor: .center))
//                  case .failure:
//                      Image(systemName: "wifi.slash")
//                  @unknown default:
//                      EmptyView()
//                  }
//              }

      DrinkImageView(drink: drink)

//      AsyncImage(url: drink.imageURL) { image in
//        image.resizable()
//        
//      } placeholder: {
//        ProgressView()
//      }
//      .aspectRatio(contentMode: .fit)
      
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
