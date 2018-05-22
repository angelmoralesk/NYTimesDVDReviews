//
//  TableViewHeader.swift
//  NYTimesDVDReviews
//
//  Created by Morales, Angel (MX - Mexico) on 21/05/18.
//  Copyright © 2018 TheKairuz. All rights reserved.
//

import UIKit
import Alamofire
import AlamofireImage
class TableViewHeader: UITableViewHeaderFooterView {

    @IBOutlet weak var movieImageView: UIImageView!
    
    var imageURL : String! {
        didSet {
            configure()
        }
    }
    
    func configure() {
        
        Alamofire.request(imageURL).responseImage { [weak self] response in
            if let image = response.result.value {
                self?.movieImageView.image = image
                self?.movieImageView.contentMode = .scaleAspectFit
            }
        }
    }
    
}
