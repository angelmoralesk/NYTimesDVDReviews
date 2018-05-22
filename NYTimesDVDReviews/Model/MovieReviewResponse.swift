//
//  MovieReviewResponse.swift
//  NYTimesDVDReviews
//
//  Created by Morales, Angel (MX - Mexico) on 21/05/18.
//  Copyright © 2018 TheKairuz. All rights reserved.
//

import Foundation

struct MovieReviewResponse : Decodable {
    
    let status : String
    let results : [MovieResult]
    
    enum MovieReviewResponseKey : String, CodingKey {
        case status
        case results
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: MovieReviewResponseKey.self)
        status = try container.decode(String.self, forKey: MovieReviewResponseKey.status)
        results = try container.decode([MovieResult].self, forKey: MovieReviewResponseKey.results)
    }
    
}

struct MovieResult : Decodable {
    
    let title : String
    let headline : String
    let publicationDate : String
    let multimedia : Multimedia
    
    enum MovieResultKeys : String, CodingKey {
        case displayTitle = "display_title"
        case headline
        case publicationDate = "publication_date"
        case multimedia
        
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: MovieResultKeys.self)
        title = try container.decode(String.self, forKey: MovieResultKeys.displayTitle)
        headline = try container.decode(String.self, forKey: MovieResultKeys.headline)
        publicationDate = try container.decode(String.self, forKey: MovieResultKeys.publicationDate)
        multimedia = try container.decode(Multimedia.self, forKey: MovieResultKeys.multimedia)
    }
    
}

struct Multimedia : Decodable {
    let src : String
    
    enum MultimediaKey : String, CodingKey {
        case src
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: MultimediaKey.self)
        src = try container.decode(String.self, forKey: MultimediaKey.src)
    }

}
