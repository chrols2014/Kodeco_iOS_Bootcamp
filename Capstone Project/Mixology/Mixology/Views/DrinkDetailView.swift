//
//  DrinkDetailView.swift
//  BevvyTest
//
//  Created by Chris Olsen on 2023-11-23.
//

import SwiftUI

struct DrinkDetailView: View {
  
  var drink: Drink
  //@State var image: UIImage
  let placeHolderImage = Images.placeholder

  var body: some View {


    ScrollView(.vertical, showsIndicators: true) {
//      AsyncImage(url: drink.imageURL) { image in
//        image.image?.resizable()
//          .aspectRatio(contentMode: .fit)
//          .clipShape(.rect(cornerRadius: 10), style: FillStyle())
//          .padding()
//
//      }

     // Image(uiImage: image)
      DrinkImageView(drink: drink)
        .scaledToFit()
        .frame(height: 250)
        .cornerRadius(3.0)



      VStack(spacing: 10) {
        Text(drink.drinkName.capitalized)
          .font(.title)

        Text(drink.glass?.capitalized ?? "")
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
        .navigationBarTitleDisplayMode(.inline)
      //.toolbar(.hidden)
    }

    .task {
      do {

        //image = await NetworkManager.instance.downloadImage(from: drink.imageURL.absoluteString)
       // image = Images.placeholder!
      } catch let error {
        print("unexpected error \(error)")

      }

      //image = await NetworkManager.shared.downloadImage(from: url) ?? placeHolderImage

    }
  }
    }


#Preview {
  DrinkDetailView(drink: MockData().mockDrink)
}
