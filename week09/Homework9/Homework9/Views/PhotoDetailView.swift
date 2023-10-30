//
//  PhotoDetailView.swift
//  Homework9
//
//  Created by Chris Olsen on 2023-10-30.
//

import SwiftUI

struct PhotoDetailView: View {
  var photo: Photo
  @ObservedObject var photoStore: PhotoStore
  @Binding var isShowingPhotoDetailView: Bool
  @MainActor @State private var downloadProgress: Float = 0.0
  @MainActor @State private var isDownloading = false
  
    var body: some View {
      NavigationView {
        VStack {
          AsyncImage(url: photo.src.large) { image in
            image
              .resizable()
              .scaledToFit()
          } placeholder: {
            ProgressView()
          }
          
          
          Text("\(photo.alt)")
          .toolbar {
            ToolbarItem(placement: .topBarLeading) {
              Button("Back", systemImage: "arrowshape.backward") {
                isShowingPhotoDetailView = false
              }.tint(.black)
            }
          }
        }
        if isDownloading {
          ProgressView(value: downloadProgress)
        }
      }
      .task {
        do {
          try await photoStore.downloadDetailedImage(at: photo.src.large, progress: $downloadProgress)
        } catch {
          print(error)
        }
      }
    }
    
}

#Preview {
  PhotoDetailView(photo: MockData().samplePhoto, photoStore: PhotoStore(), isShowingPhotoDetailView: .constant(false))
}
