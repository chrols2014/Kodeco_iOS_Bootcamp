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
          .font(.headline)
          .foregroundStyle(.pink)
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
  }
}

#Preview {
  DrinkCarouselView(drinks: [], title: "TestTitle")
}
