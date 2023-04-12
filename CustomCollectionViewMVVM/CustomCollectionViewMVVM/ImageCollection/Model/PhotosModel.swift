//
//  PhotosModel.swift
//  CustomCollectionViewMVVM
//
//  Created by Manoj Kumar on 11/04/23.
//

import Foundation
// MARK: - Photos
struct PhotosModel: Codable {
    var page, perPage: Int?
    var photos: [Photo]?
    var totalResults: Int?
    var nextPage: String?

    enum CodingKeys: String, CodingKey {
        case page
        case perPage = "per_page"
        case photos
        case totalResults = "total_results"
        case nextPage = "next_page"
    }
}

// MARK: - Photo
struct Photo: Codable {
    var id, width, height: Int?
    var url: String?
    var photographer: String?
    var photographerURL: String?
    var photographerID: Int?
    var avgColor: String?
    var src: Src?
    var liked: Bool?

    enum CodingKeys: String, CodingKey {
        case id, width, height, url, photographer
        case photographerURL = "photographer_url"
        case photographerID = "photographer_id"
        case avgColor = "avg_color"
        case src, liked
    }
}


// MARK: - Src
struct Src: Codable {
    var original, large2X, large, medium: String?
    var small, portrait, landscape, tiny: String?

    enum CodingKeys: String, CodingKey {
        case original
        case large2X = "large2x"
        case large, medium, small, portrait, landscape, tiny
    }
}


