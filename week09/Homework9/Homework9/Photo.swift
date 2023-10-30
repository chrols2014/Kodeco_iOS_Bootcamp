//
//  Photo.swift
//  Homework9
//
//  Created by Chris Olsen on 2023-10-30.
//

import Foundation


struct Photo: Codable, Identifiable {
 
    let id, width, height: Int
    let url: URL
    let photographer: String
    let photographerURL: String
    let photographerID: Int
    let avgColor: String
    let src: Src
    let liked: Bool
    let alt: String

    enum CodingKeys: String, CodingKey {
        case id, width, height, url, photographer
        case photographerURL = "photographer_url"
        case photographerID = "photographer_id"
        case avgColor = "avg_color"
        case src, liked, alt
    }
}


struct Src: Codable {
    let original, large2X, large, medium: URL
    let small, portrait, landscape, tiny: URL

    enum CodingKeys: String, CodingKey {
        case original
        case large2X = "large2x"
        case large, medium, small, portrait, landscape, tiny
    }
}



struct MockData {
  
   let samplePhoto = Photo(id: 12879014,
                                 width: 4000,
                                 height: 6000,
                                 url: URL(string: "https://www.pexels.com/photo/close-up-photograph-of-green-leaves-12879014/")!,
                                 photographer: "Sean Valentine",
                                 photographerURL: "https://www.pexels.com/@seanrvalentine",
                                 photographerID: 1694877,
                                 avgColor: "#4B6A40",
                                 src: Src(original: URL(string: "https://images.pexels.com/photos/12879014/pexels-photo-12879014.jpeg")!,
                                          large2X: URL(string: "https://images.pexels.com/photos/12879014/pexels-photo-12879014.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940")!,
                                          large: URL(string: "https://images.pexels.com/photos/12879014/pexels-photo-12879014.jpeg?auto=compress&cs=tinysrgb&h=650&w=940")!,
                                          medium: URL(string: "https://images.pexels.com/photos/12879014/pexels-photo-12879014.jpeg?auto=compress&cs=tinysrgb&h=350")!,
                                          small: URL(string: "https://images.pexels.com/photos/12879014/pexels-photo-12879014.jpeg?auto=compress&cs=tinysrgb&h=130")!,
                                          portrait: URL(string: "https://images.pexels.com/photos/12879014/pexels-photo-12879014.jpeg?auto=compress&cs=tinysrgb&fit=crop&h=1200&w=800")!,
                                          landscape: URL(string: "https://images.pexels.com/photos/12879014/pexels-photo-12879014.jpeg?auto=compress&cs=tinysrgb&fit=crop&h=627&w=1200")!,
                                          tiny: URL(string: "https://images.pexels.com/photos/12879014/pexels-photo-12879014.jpeg?auto=compress&cs=tinysrgb&dpr=1&fit=crop&h=200&w=280)")!),
                                 liked: false,
                                 alt: "Close-Up Photograph of Green Leaves")
  
  
}
