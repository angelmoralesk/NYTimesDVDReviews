//
//  MovieTableViewCell.swift
//  NYTimesDVDReviews
//
//  Created by Morales, Angel (MX - Mexico) on 21/05/18.
//  Copyright © 2018 TheKairuz. All rights reserved.
//

import UIKit
import Alamofire
import AlamofireImage

class MovieTableViewCell: UITableViewCell {

    @IBOutlet weak var movieImageView: UIImageView!
    @IBOutlet weak var movieTitle: UILabel!
    @IBOutlet weak var reviewLabel: UILabel!
    @IBOutlet weak var releaseDate: UILabel!
    
    var review : MovieResult! {
        didSet {
            configure()
        }
    }
    
    func configure() {
        
        Alamofire.request(review.multimedia.src).responseImage { [weak self] response in
            if let image = response.result.value {
                print("image downloaded: \(image)")
                self?.movieImageView.image = image
                self?.movieImageView.contentMode = .scaleAspectFit
            }
        }
        
        movieTitle.text = review.title
        reviewLabel.text = review.headline
        releaseDate.text = "Release date: \(review.publicationDate)"
    }
}
