//
//  PhotoDetailView.swift
//  Homework9
//
//  Created by Chris Olsen on 2023-10-30.
//

import SwiftUI

struct PhotoDetailView: View {
  var photo: Photo
  @Binding var isShowingPhotoDetailView: Bool
  
    var body: some View {
      AsyncImage(url: photo.src.large) { image in
            image
                .resizable()
                .scaledToFit()
        } placeholder: {
            ProgressView()
        }
    }
}

#Preview {
  PhotoDetailView(photo: MockData().samplePhoto, isShowingPhotoDetailView: .constant(false))
}
