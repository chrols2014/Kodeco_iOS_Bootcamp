//
//  PhotoStore.swift
//  Homework9
//
//  Created by Chris Olsen on 2023-10-30.
//

import SwiftUI


class PhotoStore: ObservableObject {
  @Published var loadedAPIData: PexelsResponseModel = PexelsResponseModel(totalResults: 0, page: 0, perPage: 0, photos: [], nextPage: "")
  @Published var searchTerm = ""
  @Published var isShowingPhotoDetailView = false
  
  
  
  var selectedPhoto: Photo? {
      didSet {
        isShowingPhotoDetailView = true
      }
  }
  
  func fetchAPIData() async throws {
    //    await MainActor.run {
    //      isFetchingData = true
    //    }
    
    guard let url = URL(string: "https://api.pexels.com/v1/search?query=\(searchTerm)&per_page=50") else {
      throw CustomErrors.invalidAPIURL
    }
    
    var urlRequest = URLRequest(url: url)
    
    urlRequest.setValue("gAIpMsfSoNCZozGzPmEnFLRk3E3pbWedlHm2zIRzkMVGy2IxSdu2U9Oj", forHTTPHeaderField: "Authorization")
    
    
    let (data, response) = try await URLSession.shared.data(for: urlRequest)
    
    guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
      throw CustomErrors.invalidAPIResponse
    }
    
    do {
      let decoder = JSONDecoder()
      try await MainActor.run {
        loadedAPIData = try decoder.decode(PexelsResponseModel.self, from: data)
        //        saveAPIJSON()
        //        isFetchingData = false
        //print(data)
      }
    } catch {
      throw CustomErrors.invalidAPIData
      
    }
  }
  
  @MainActor func downloadDetailedImage(at url: URL, progress: Binding<Float>) async throws {
    let (asyncBytes, response) = try await URLSession.shared.bytes(from: url)
    
    let contentLength = Float(response.expectedContentLength)
    var data = Data(capacity: Int(contentLength))
    
    for try await byte in asyncBytes {
      data.append(byte)
      
      progress.wrappedValue = Float(data.count) / Float(contentLength)
    }
    
  }
  
  
}




enum CustomErrors: Error {
  case invalidAPIURL
  case invalidAPIResponse
  case invalidAPIData
}



