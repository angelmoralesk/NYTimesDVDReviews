//
//  NYTimeDVDMovieAPI.swift
//  NYTimesDVDReviews
//
//  Created by Morales, Angel (MX - Mexico) on 21/05/18.
//  Copyright © 2018 TheKairuz. All rights reserved.
//

import Foundation

enum Result<T,S> {
    case success(T)
    case failure(S)
}

protocol NYTimeDVDMovieAPI {
    
    func fetchMovieReviews(completion: @escaping (_ response : Result<MovieReviewResponse, String>) -> Void )
    
}
