//
//  NetworkManager.swift
//  Mixology
//
//  Created by Chris Olsen on 2023-11-28.
//

import UIKit

class NetworkManager {
  static let instance = NetworkManager()


  let cache = NSCache<NSString, UIImage>()

  private init() { }


  func downloadImage(from urlString: String) async -> UIImage? {

      // convert Swift String to NSString
      let cacheKey = NSString(string: urlString)

      // Attempt to find key (imageurl) in cache and load corresponding image file from there, return if succesful.
      if let image = cache.object(forKey: cacheKey) {
          return image
      }


      // if image not in cache, try to make a URL out of the URLString provided.
      guard let url = URL(string: urlString) else {
          return nil
      }

      // start constructing the network call to get image data. Placed here because of Sean's rationale but could also have been built into network manager.

      do {
          let (data, _) = try await URLSession.shared.data(from: url)
          guard let image = UIImage(data: data) else { return nil }
          cache.setObject(image, forKey: cacheKey)
          return image
      } catch {
          return nil
      }
  }




}
