//
//  PexelsResponceModel.swift
//  Homework9
//
//  Created by Chris Olsen on 2023-10-30.
//

import Foundation

struct PexelsResponseModel: Codable {
    let totalResults, page, perPage: Int
    var photos: [Photo]
    let nextPage: String

    enum CodingKeys: String, CodingKey {
        case totalResults = "total_results"
        case page
        case perPage = "per_page"
        case photos
        case nextPage = "next_page"
    }
}



