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
    
    @IBOutlet weak var tableView: UITableView! {
        didSet {
            tableView.dataSource = self
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let service = NYTimeDVDMovieServices()
        service.fetchMovieReviews { [weak self] (response) in
            switch response {
                case .success(let data):
                    print("Exito - \(data)")
                    self?.reviews.removeAll()
                    self?.reviews.append(contentsOf: data.results)
                    self?.tableView.reloadData()
                    
                break
                
                case .failure(let error):
                    print("Exito - \(error)")
                break
            }
        }
        // Do any additional setup after loading the view, typically from a nib.
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

}


        
        










        
        
        

