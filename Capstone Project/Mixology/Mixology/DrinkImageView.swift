//
//  DrinkImageView.swift
//  Mixology
//
//  Created by Chris Olsen on 2023-11-28.
//

import SwiftUI

class DrinkImageViewModel: ObservableObject {

  @Published var image: UIImage? = nil
  @Published var isLoading: Bool = false

  private let drink: Drink
  init(drink: Drink) {
    getImage()
  }

  private func getImage() {

  }

}


struct DrinkImageView: View {
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

#Preview {
    DrinkImageView()
}
