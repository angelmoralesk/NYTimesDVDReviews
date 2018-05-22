//
//  ApplicationManager.swift
//  NYTimesDVDReviews
//
//  Created by Morales, Angel (MX - Mexico) on 21/05/18.
//  Copyright © 2018 TheKairuz. All rights reserved.
//

import Foundation

class ApplicationManager {
    
    static let sharedInstance = ApplicationManager()
    private init() { }
    
    let nyTimeProvider = NYTimeDVDMovieProvider()
    
}
