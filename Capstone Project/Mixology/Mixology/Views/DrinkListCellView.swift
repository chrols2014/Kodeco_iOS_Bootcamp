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
//        AsyncImage(url: drink.imageURL) { image in
//          image.image?.resizable().scaledToFit()
//            .frame(height: 70)
//            .cornerRadius(3.0)
        //FetchedImage(url: drink.imageURL)
        DrinkImageView(drink: drink)
          .scaledToFit()
          .frame(height: 60)
          .cornerRadius(3.0)

//        if let image =
//
//          .frame(height: 70)


        //}
        
        VStack(alignment: .leading, spacing: 8) {
          Text(drink.drinkName)
            .fontWeight(.semibold)
            .lineLimit(2)
            .minimumScaleFactor(0.5)
          
          Text(drink.glass ?? "")
            .font(.subheadline)
          
//          HStack {
//           
//            ForEach(drink.tagsArray, id: \.self) { tag in
//              
//              TagCapsuleView(tag: tag)
//            }
           
            
//            Text(drink.tags ?? "")
//              .font(.subheadline)
            
          //}
          
          
        }
      }
    }
}

#Preview {
  DrinkListCellView(drink: MockData().mockDrink)
}
