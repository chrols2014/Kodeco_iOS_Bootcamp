//
//  GridItemView.swift
//  Homework9
//
//  Created by Chris Olsen on 2023-10-30.
//

import SwiftUI

struct GridItemView: View {
  let size: Double
  let photo: Photo
  
  
  var body: some View {
    ZStack(alignment: .topTrailing) {
      AsyncImage(url: photo.src.small) { image in
        image
          .resizable()
          .scaledToFill()
          .clipped()
          .cornerRadius(3.0)
          .padding()
      } placeholder: {
        ProgressView()
      }
      .frame(width: size, height: size)
      
    }
  }
}


struct GridItemView_Previews: PreviewProvider {
  static var previews: some View {
    GridItemView(size: 50, photo: MockData().samplePhoto)
  }
}
