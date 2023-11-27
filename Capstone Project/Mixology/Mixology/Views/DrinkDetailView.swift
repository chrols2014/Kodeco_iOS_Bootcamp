//
//  DrinkDetailView.swift
//  BevvyTest
//
//  Created by Chris Olsen on 2023-11-23.
//

import SwiftUI

struct DrinkDetailView: View {
  
  var drink: Drink
  
    var body: some View {
      
      
      HStack {
        AsyncImage(url: drink.imageURL) { image in
          image.image?.resizable()
            .aspectRatio(contentMode: .fit)
            .clipShape(.rect(cornerRadius: 10), style: FillStyle())
            .padding()
          
        }
        
        
      }
      
      
      
      VStack(spacing: 10) {
        Text(drink.drinkName)
          .font(.title)
        
        Text(drink.glass ?? "")
          .font(.subheadline)
        
        
        Text("\(drink.ingredientCollection.first!.0 ?? "")  \(drink.ingredientCollection.first!.1 ?? "") ")
//        Text("\(drink.ingredientCollection[1].0 ?? "")  \(drink.ingredientCollection.first!.1 ?? "") ")
//        Text("\(drink.ingredientCollection.first!.0 ?? "")  \(drink.ingredientCollection.first!.1 ?? "") ")
        
        
        HStack {
          if !drink.tagsArray.isEmpty {
            ForEach(drink.tagsArray, id: \.self) { item in
              
              TagCapsuleView(tag: item)
            }
          }
        }
          Text(drink.instructions ?? "No instructions available.")
      }
      
      Spacer()
    }
}

#Preview {
  DrinkDetailView(drink: MockData().mockDrink)
}
