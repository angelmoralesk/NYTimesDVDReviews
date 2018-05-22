//
//  DetailMovieReviewViewController.swift
//  NYTimesDVDReviews
//
//  Created by Morales, Angel (MX - Mexico) on 21/05/18.
//  Copyright © 2018 TheKairuz. All rights reserved.
//

import UIKit

class DetailMovieReviewViewController: UIViewController {

    var model : [String] = []
    
    var review : MovieResult! {
        didSet {
            configure()
        }
    }
    
    @IBOutlet weak var tableView: UITableView! {
        didSet {
            
            let nib = UINib(nibName: "TableViewHeader", bundle: nil)
            tableView.register(nib, forHeaderFooterViewReuseIdentifier: "header")

            tableView.dataSource = self
            tableView.delegate = self
            
            tableView.reloadData()
        }
    }
    
    func configure() {
        model.append(review.title)
        model.append(review.headline)
        model.append(review.author)
        model.append(review.summary)
        model.append("Release date: \(review.publicationDate)")
        model.append("\(review.link.suggestedText) >>")
    }
    
    func isLastCell(index : Int) -> Bool {
        return index == model.count - 1
    }
    
    func isFirstCell(index : Int) -> Bool {
        return index == 0
    }
    
}


extension DetailMovieReviewViewController : UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 6
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "InfoCell")!
        if isFirstCell(index: indexPath.row) {
            cell.textLabel?.font = UIFont.boldSystemFont(ofSize: 22.0)
            cell.textLabel?.textColor = UIColor.black
        } else if isLastCell(index: indexPath.row) {
            cell.textLabel?.font = UIFont.systemFont(ofSize: 20.0)
            cell.textLabel?.textColor = UIColor(red: 0.0, green: 122.0/255.0, blue: 1.0, alpha: 1.0)            
        } else {
            cell.textLabel?.font = UIFont.systemFont(ofSize: 20.0)
            cell.textLabel?.textColor = UIColor.black
        }
        cell.textLabel?.numberOfLines = 0
        cell.textLabel?.text = model[indexPath.row]
        cell.textLabel?.sizeToFit()
        return cell
    }
}

extension DetailMovieReviewViewController : UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        guard let header = tableView.dequeueReusableHeaderFooterView(withIdentifier: "header") as? TableViewHeader else {
            return nil
        }
        let src = review.multimedia.src
        header.imageURL = src
        return header
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 250
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if isLastCell(index: indexPath.row) {
            let storyboard = UIStoryboard(name: "Web", bundle: nil)
            guard let webVC = storyboard.instantiateInitialViewController() as? MovieWebReviewViewController else {
                return
            }
            webVC.pageURL = review.link.url
            navigationController?.pushViewController(webVC, animated: true)
        }
    }
}
