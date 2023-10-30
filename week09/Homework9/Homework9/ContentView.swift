//
//  ContentView.swift
//  Homework9
//
//  Created by Chris Olsen on 2023-10-30.
//

import SwiftUI

struct ContentView: View {
  @ObservedObject var photoStore: PhotoStore
  // @State var searchTerm = ""
  
  let columns: [GridItem] = [GridItem(.flexible()),
                             GridItem(.flexible()),
                             GridItem(.flexible())]
  
  var body: some View {
    
    NavigationView {
      ScrollView {
        
       
        
      if !photoStore.loadedAPIData.photos.isEmpty {
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
        
        if photoStore.loadedAPIData.photos.isEmpty {
          Spacer()
          ContentUnavailableView("Start by entering a search term", systemImage: "magnifyingglass.circle.fill")
            .symbolRenderingMode(.multicolor)
            .symbolEffect(.pulse)
            .font(.caption)
          Spacer()
        }
        
        
        
       
        //.searchable(text: $photoStore.searchTerm)
      }
      .searchable(text: $photoStore.searchTerm)
      .onSubmit(of: .search) {
        Task {
          do {
            try await photoStore.fetchAPIData()
            print("fetched remote data")
          } catch CustomErrors.invalidAPIURL {
            print("InvalidAPIURL")
            // apiStore.isFetchingData = false
          } catch CustomErrors.invalidAPIResponse {
            print("Invalid Reponse")
            //apiStore.isFetchingData = false
          } catch CustomErrors.invalidAPIData {
            print("Invalid Data")
            //apiStore.isFetchingData = false
          } catch {
            print("Unexpected Error")
          }
        }
      }
      .navigationTitle("Pexel Search")
      
    }
    
    //      .sheet(isPresented: $photoStore.isShowingPhotoDetailView) {
    //        PhotoDetailView(photo: photoStore.selectedPhoto ?? MockData().samplePhoto,
    //                              isShowingPhotoDetailView: $photoStore.isShowingPhotoDetailView)
    //      }
    .fullScreenCover(isPresented: $photoStore.isShowingPhotoDetailView, content: {            // show safari view based on bound variable.
      PhotoDetailView(photo: photoStore.selectedPhoto ?? MockData().samplePhoto,
                      isShowingPhotoDetailView: $photoStore.isShowingPhotoDetailView)
    })
    
    
    
    
    
    //        VStack {
    //            Image(systemName: "globe")
    //                .imageScale(.large)
    //                .foregroundStyle(.tint)
    //          Button(action: {
    //                          Task {
    //                            do {
    //                             try await photoStore.fetchAPIData()
    //                              print("fetched remote data")
    //                              print(photoStore.loadedAPIData?.totalResults)
    //                              print(photoStore.loadedAPIData?.photos)
    //                            } catch CustomErrors.invalidAPIURL {
    //                              print("InvalidAPIURL")
    //                             // apiStore.isFetchingData = false
    //                            } catch CustomErrors.invalidAPIResponse {
    //                              print("Invalid Reponse")
    //                              //apiStore.isFetchingData = false
    //                            } catch CustomErrors.invalidAPIData {
    //                              print("Invalid Data")
    //                              //apiStore.isFetchingData = false
    //                            } catch {
    //                              print("Unexpected Error")
    //                            }
    //          }
    //                      }, label: {
    //                          Image(systemName: "hand.thumbsup.fill")
    //                      })
    //
    //
    //
    //        }
    //        .padding()
    //      .task {
    //        do {
    //                                    try await photoStore.fetchAPIData()
    //                                     print("fetched remote data")
    ////                                     print(photoStore.loadedAPIData.totalResults)
    ////                                     print(photoStore.loadedAPIData.photos)
    //                                   } catch CustomErrors.invalidAPIURL {
    //                                     print("InvalidAPIURL")
    //                                    // apiStore.isFetchingData = false
    //                                   } catch CustomErrors.invalidAPIResponse {
    //                                     print("Invalid Reponse")
    //                                     //apiStore.isFetchingData = false
    //                                   } catch CustomErrors.invalidAPIData {
    //                                     print("Invalid Data")
    //                                     //apiStore.isFetchingData = false
    //                                   } catch {
    //                                     print("Unexpected Error")
    //                                   }
    //                 }
    
  }
  
  
  
  
}

#Preview {
  ContentView(photoStore: PhotoStore())
}
