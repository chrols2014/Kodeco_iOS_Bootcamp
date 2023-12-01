//
//  DrinkCarouselView.swift
//  Mixology
//
//  Created by Chris Olsen on 2023-11-27.
//

import SwiftUI

struct DrinkCarouselView: View {
  var drinks: [Drink]
  var title: String
  var body: some View {
    VStack {
      HStack {
        Text(title)
          .font(.callout)
        Spacer()
      }
      ScrollView(.horizontal, showsIndicators: false) {

        HStack {
          ForEach(drinks) { drink in
            NavigationLink(value: drink) {
              DrinkCardView(drink: drink)
            }


          }

        }

      }
    }
    .padding(.leading, 20)
//    .navigationDestination(for: Drink.self) { drink in
//      DrinkDetailView(drink: drinks
//        .first(where: { $0.id == drink.id })!)
//    }
  }
}

#Preview {
  DrinkCarouselView(drinks: [], title: "TestTitle")
}
