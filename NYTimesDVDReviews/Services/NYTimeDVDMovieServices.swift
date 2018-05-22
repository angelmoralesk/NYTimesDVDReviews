//
//  NYTimeDVDServices.swift
//  NYTimesDVDReviews
//
//  Created by Morales, Angel (MX - Mexico) on 21/05/18.
//  Copyright © 2018 TheKairuz. All rights reserved.
//

import Foundation

class NYTimeDVDMovieServices {
    
    func fetchMovieReviews(completion: @escaping(_ response : Result<MovieReviewResponse, String> ) -> Void ) {
        
        ApplicationManager.sharedInstance.nyTimeProvider.fetchMovieReviews { (response) in
            switch response {
                case .success(let data):
                    completion(Result.success(data))
                break
                
                case .failure(let error):
                     completion(Result.failure(error))
                break
            }
        }
    }
}
