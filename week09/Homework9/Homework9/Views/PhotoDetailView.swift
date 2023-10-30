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
        
        if !isDownloading && photoStore.detailedImageDownloadLocation != nil {
          AsyncImage(url: photoStore.detailedImageDownloadLocation) { phase in
            
            if let image = phase.image {
              image 
                .resizable()
                .scaledToFit()
            }
          }
        }
        
        if isDownloading {
          ProgressView(value: downloadProgress)
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
      
    }
    .task {
      isDownloading = true
      defer {
        isDownloading = false
      }
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
