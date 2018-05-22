//
//  MovieWebReviewViewController.swift
//  NYTimesDVDReviews
//
//  Created by Morales, Angel (MX - Mexico) on 22/05/18.
//  Copyright © 2018 TheKairuz. All rights reserved.
//

import UIKit
import WebKit

class MovieWebReviewViewController: UIViewController {

    @IBOutlet weak var webView: WKWebView! {
        didSet {
            webView.navigationDelegate = self
        }
    }
    
    @IBOutlet weak var spinner: UIActivityIndicatorView!
    
    var pageURL : String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        guard let strURL = pageURL else { return }
        guard let url = URL(string: strURL) else { return }
       
        let request = URLRequest(url: url)
        UIApplication.shared.isNetworkActivityIndicatorVisible = true
        webView.load(request)
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(true)
        hideSpinners()
    }
    
    func hideSpinners() {
        spinner.stopAnimating()
        UIApplication.shared.isNetworkActivityIndicatorVisible = false
    }

}

extension MovieWebReviewViewController : WKNavigationDelegate  {
   
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
       hideSpinners()
    }
    
    func webView(_ webView: WKWebView, didFail navigation: WKNavigation!, withError error: Error) {
       hideSpinners()

    }

}
