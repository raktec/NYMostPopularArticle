//
//  ViewController.swift
//  Article
//
//  Created by Rakesh Kumar Sharma on 27/03/19.
//  Copyright © 2019 Rakesh Kumar Sharma. All rights reserved.
//

import UIKit
import QuartzCore

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource,UISearchBarDelegate {
    
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var articleTableView: UITableView!
    var isSearching = false
    var selectedIndex = -1
    var articleArray = [Article]()
    
    var activityIndicator = UIActivityIndicatorView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addActivityIndicator()
        // self.searchBar.showsCancelButton = true
        getArticles()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //Mark: Table View Datasource methods
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //        if isSearching {
        //            return self.filteredArray.count
        //        }
        //        else {
        return self.articleArray.count
        // }
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellIdentifer : String = "cell"
        let cell : ArticleTableViewCell = tableView.dequeueReusableCell(withIdentifier: cellIdentifer, for: indexPath) as! ArticleTableViewCell
        var article = Article()
        
        
        article = self.articleArray[indexPath.row]
        
        cell.articleHeadingLabel.text = article.title
        cell.selectionStyle = UITableViewCell.SelectionStyle.none
        cell.articleAuthorLabel.text = article.byLine
        cell.publishedDateLabel.text = article.publishedDate
        cell.articleThumbnailImageView.downloadImageFromUrl(link: article.thumbnailImageUrl, contentMode: UIView.ContentMode.scaleAspectFit)
        return cell
    }
    
    //Mark: Table View Delegate methods
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 132.0
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedIndex = indexPath.row
        performSegue(withIdentifier: "showArticleDetails", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showArticleDetails" {
            let articleDetailVC = segue.destination as? ArticlesDetailViewController
            
            articleDetailVC?.article = self.articleArray[selectedIndex]
            
        }
    }
    
    
    
    
    
    
    
    
    // Shows activity indicator till the webview loads
    func addActivityIndicator() -> Void {
        self.articleTableView.isHidden = true
        self.activityIndicator = UIActivityIndicatorView.init(style:.gray)
        self.activityIndicator.frame = CGRect(x:self.view.frame.midX,y:self.view.frame.midY,width:30,height:20)
        self.activityIndicator.hidesWhenStopped = true
        self.activityIndicator.isHidden = false
        self.activityIndicator.startAnimating()
        self.view .addSubview(self.activityIndicator)
    }
    
    func getArticles() -> Void {
        DispatchQueue.global(qos: .background).async {
            ApiHandler.getArticlesArrayFromResponse(success: { articles in
                self.articleArray = articles
                DispatchQueue.main.async {
                    self.articleTableView.isHidden = false
                    self.activityIndicator.stopAnimating()
                    self.articleTableView.reloadData()
                }
            }, failure: { error in
                print("Error mesage: \(error.description)")
            })
        }
    }
    
}
