//
//  NYTimeDVDMovieProvider.swift
//  NYTimesDVDReviews
//
//  Created by Morales, Angel (MX - Mexico) on 21/05/18.
//  Copyright © 2018 TheKairuz. All rights reserved.
//

import Foundation
import Alamofire


class NYTimeDVDMovieProvider : NYTimeDVDMovieAPI {
    
    
    func fetchMovieReviewsAtIndex(_ index : Int, completion:@escaping (_ response : Result<MovieReviewResponse, String>) -> Void ) {
        let url = "http://api.nytimes.com/svc/movies/v2/reviews/dvd-picks.json?offset=\(index)&api-key=1e73df4e96b248d799a4cab2e82350fd"
        
        Alamofire.request(url, method: .get, parameters: nil, encoding: URLEncoding.default, headers: nil).responseJSON { (response) in
            print("Servicio invocado")
            switch response.result {
                case .success(_):
                    do {
                        let response = try JSONDecoder().decode(MovieReviewResponse.self, from: response.data!)
                        completion(Result.success(response))
                        print("Exito \(response)")
                    } catch {
                      print("Hubo un error en el parseo")
                        completion(Result.failure("Hubo un error en el parseo"))
                    }
                break
                
                case .failure(_):
                    completion(Result.failure("Error en el consumo del Web service"))
                break
            }
        }
    }
}
