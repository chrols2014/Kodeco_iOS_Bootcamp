//
//  ImageFetcher.swift
//  Mixology
//
//  Created by Chris Olsen on 2023-11-28.
//

import Foundation
import UIKit
import SwiftUI

enum NetworkError: Error {
    case badRequest
    case unsupportedImage
    case badUrl
}

@MainActor
class ImageFetcher: ObservableObject {

    @Published var fetchedImage: UIImage?
  @Published var sImage: Image?
    private static let cache = NSCache<NSString, UIImage>()

    func fetchImage(_ url: URL?) async throws {

        guard let url = url else {
            throw NetworkError.badUrl
        }

        let request = URLRequest(url: url)

    
        if let cachedImage = Self.cache.object(forKey: url.absoluteString as NSString) {
            fetchedImage = cachedImage
        } else {

            let (data, response) = try await URLSession.shared.data(for: request)
            guard let httpResponse = response as? HTTPURLResponse,
                  httpResponse.statusCode == 200 else {
                      throw NetworkError.badRequest
                  }

            guard let image = UIImage(data: data) else {
                throw NetworkError.unsupportedImage
            }


            Self.cache.setObject(image, forKey: url.absoluteString as NSString)
            fetchedImage = image
            sImage = Image(uiImage: image)

        }




    }

}
