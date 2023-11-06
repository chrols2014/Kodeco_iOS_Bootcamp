//
//  PhotoGridView.swift
//  Homework9
//
//  Created by Chris Olsen on 2023-10-30.
//

import SwiftUI

struct PhotoGridView: View {
  @ObservedObject var photoStore: PhotoStore
  let columns: [GridItem] = [GridItem(.flexible()),
                             GridItem(.flexible()),
                             GridItem(.flexible())]
  
  var body: some View {
    LazyVGrid(columns: columns, spacing: 20) {
      
      
      ForEach(photoStore.loadedAPIData.photos ) { photo in
        GridItemView(size: 120, photo: photo)
          .onTapGesture {
            photoStore.selectedPhoto = photo
          }
      }
    }
    .padding()
  }
}

#Preview {
  PhotoGridView(photoStore: PhotoStore())
}
