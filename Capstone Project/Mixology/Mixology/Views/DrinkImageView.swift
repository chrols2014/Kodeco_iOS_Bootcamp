//
//  DrinkImageView.swift
//  Mixology
//
//  Created by Chris Olsen on 2023-11-28.
//

import SwiftUI

struct DrinkImageView: View {

  var drink: Drink

  @StateObject private var imageFetcher = ImageFetcher()

  var body: some View {
    VStack {
      if let uiImage = imageFetcher.fetchedImage {
        Image(uiImage: uiImage)
          .resizable()
      } else {
        VStack {
          Spacer()
          ProgressView()
          Spacer()
        }
      }
    }
    .onAppear() {
      Task {
        do {
          try await imageFetcher.fetchImage(drink.imageURL)
        } catch {
          print("Unexpected Error")
        }
      }
    }
  }
}



#Preview {
  DrinkImageView(drink: MockData().mockDrink)

}
