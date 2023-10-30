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
      NavigationView {
        AsyncImage(url: photo.src.large) { image in
          image
            .resizable()
            .scaledToFit()
        } placeholder: {
          ProgressView()
        }
//        .onTapGesture {
//          isShowingPhotoDetailView = false
//        }
        
        //Text("\(photo.alt)")
        .toolbar {
          ToolbarItem(placement: .topBarLeading) {
            Button("Back", systemImage: "arrowshape.backward") {
              isShowingPhotoDetailView = false
            }.tint(.black)
          }
        }
      }
     
    }
}

#Preview {
  PhotoDetailView(photo: MockData().samplePhoto, isShowingPhotoDetailView: .constant(false))
}
