//
//  ViewController.swift
//  NYTimesDVDReviews
//
//  Created by Morales, Angel (MX - Mexico) on 21/05/18.
//  Copyright © 2018 TheKairuz. All rights reserved.
//

import UIKit

class NYTDVDMovieListViewController: UIViewController {

    var reviews : [MovieResult] = []
    var pageIndex = 0
    
    @IBOutlet weak var spinner: UIActivityIndicatorView!
    
    @IBOutlet weak var tableView: UITableView! {
        didSet {
            tableView.dataSource = self
            tableView.delegate = self
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchReviewsAtIndex(index: pageIndex)
    }

    func fetchReviewsAtIndex(index : Int)  {
        let service = NYTimeDVDMovieServices()
        UIApplication.shared.isNetworkActivityIndicatorVisible = true
        service.fetchMovieReviewsAtIndex(pageIndex) { [weak self] (response) in
            UIApplication.shared.isNetworkActivityIndicatorVisible = false

            self?.spinner.stopAnimating()
            
            switch response {
            case .success(let data):
                print("Exito - \(data)")
                self?.reviews.append(contentsOf: data.results)
                self?.tableView.reloadData()
                self?.pageIndex += 1
                break
                
            case .failure(let error):
                print("Exito - \(error)")
            
                break
            }
        }
    }

}
extension NYTDVDMovieListViewController : UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return reviews.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! MovieTableViewCell
        let review = reviews[indexPath.row]
        cell.review = review
        return cell
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if isReachingTopResults(index: indexPath.row) {
            fetchReviewsAtIndex(index: pageIndex)
        }
    }

    func isReachingTopResults(index : Int) -> Bool {
        let isLastResult = reviews.count - 1 == index
        return isLastResult
    }
}

extension NYTDVDMovieListViewController : UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let movieCell = tableView.cellForRow(at: indexPath) as? MovieTableViewCell else {
            return
        }
        let review = movieCell.review
        
        let storyboard = UIStoryboard(name: "Detail", bundle: nil)
        guard let detailVC = storyboard.instantiateInitialViewController() as? DetailMovieReviewViewController else {
            return
        }
        detailVC.review = review
        self.navigationController?.pushViewController(detailVC, animated: true)
    }
}

        
        










        
        
        

