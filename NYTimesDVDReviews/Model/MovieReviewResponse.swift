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
    let author : String
    let summary : String
    let link : Link
    
    enum MovieResultKeys : String, CodingKey {
        case displayTitle = "display_title"
        case headline
        case publicationDate = "publication_date"
        case multimedia
        case author = "byline"
        case summary = "summary_short"
        case link
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: MovieResultKeys.self)
        title = try container.decode(String.self, forKey: MovieResultKeys.displayTitle)
        headline = try container.decode(String.self, forKey: MovieResultKeys.headline)
        publicationDate = try container.decode(String.self, forKey: MovieResultKeys.publicationDate)
        multimedia = try container.decode(Multimedia.self, forKey: MovieResultKeys.multimedia)
        author = try container.decode(String.self, forKey: MovieResultKeys.author)
        summary = try container.decode(String.self, forKey: MovieResultKeys.summary)
        link = try container.decode(Link.self, forKey: MovieResultKeys.link)
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

struct Link : Decodable {
    let url : String
    let type : String
    let suggestedText : String
    
    enum LinkKeys : String, CodingKey {
        case type
        case url
        case suggestedText = "suggested_link_text"
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: LinkKeys.self)
        url = try container.decode(String.self, forKey: LinkKeys.url)
        type = try container.decode(String.self, forKey: LinkKeys.type)
        suggestedText = try container.decode(String.self, forKey: LinkKeys.suggestedText)
    }
}
