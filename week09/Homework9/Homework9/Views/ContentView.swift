//
//  ContentView.swift
//  Homework9
//
//  Created by Chris Olsen on 2023-10-30.
//

import SwiftUI

struct ContentView: View {
  @ObservedObject var photoStore: PhotoStore
  
  var body: some View {
    
    NavigationView {
      ScrollView {
        
        if !photoStore.loadedAPIData.photos.isEmpty {
          PhotoGridView(photoStore: photoStore)
        } else if photoStore.loadedAPIData.photos.isEmpty {
          EmptyStateView()
        }
      }
      .searchable(text: $photoStore.searchTerm)
      .onSubmit(of: .search) {
        Task {
          do {
            try await photoStore.fetchAPIData()
            print("fetched remote data")
          } catch CustomErrors.invalidAPIURL {
            print("InvalidAPIURL")
          } catch CustomErrors.invalidAPIResponse {
            print("Invalid Reponse")
          } catch CustomErrors.invalidAPIData {
            print("Invalid Data")
          } catch {
            print("Unexpected Error")
          }
        }
      }
      .navigationTitle("Pexel Search")
    }
    .fullScreenCover(isPresented: $photoStore.isShowingPhotoDetailView, content: {
      PhotoDetailView(photo: photoStore.selectedPhoto ?? MockData().samplePhoto, photoStore: photoStore,
                      isShowingPhotoDetailView: $photoStore.isShowingPhotoDetailView)
    })
  }
  
  
  
  
}

#Preview {
  ContentView(photoStore: PhotoStore())
}
