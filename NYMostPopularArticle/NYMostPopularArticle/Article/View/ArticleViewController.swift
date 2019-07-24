//
//  ArticleViewController.swift
//  NYMostPopularArticle

//  Created by Rakesh Kumar Sharma on 24/07/19.
//  Copyright © 2019 Rakesh Kumar Sharma. All rights reserved.
//

import Foundation
import UIKit

class ArticleViewController: UIViewController {
    
    @IBOutlet weak var articlesTable: UITableView!
    @IBOutlet weak var errorMessageLabel: UILabel!
    
    var presenter: ArticlesPresenter!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.articlesTable.separatorStyle = .singleLine
        self.articlesTable.tableFooterView = UIView()
        let navBarColor = UIColor(displayP3Red: 55.0/255.0, green: 226/255.0, blue: 181/255.0, alpha: 1.0)
        self.navigationController?.navigationBar.barTintColor = navBarColor
        let navbarAtrributes = [NSAttributedStringKey.font: UIFont.systemFont(ofSize: 20, weight: .heavy), NSAttributedStringKey.foregroundColor: UIColor.white]
        self.navigationController?.navigationBar.titleTextAttributes = navbarAtrributes
        self.title = "NY Most Popular Articles"
        
        self.articlesTable.separatorStyle = .none
        self.articlesTable.estimatedRowHeight = 100
        self.articlesTable.rowHeight = UITableViewAutomaticDimension
        self.articlesTable.tableFooterView = UIView()
        self.articlesTable.register(ArticleTableViewCell.self)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.presenter.viewWillAppear()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}

extension ArticleViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.presenter.numberOfArticles()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: ArticleTableViewCell = tableView.dequeueReusableCell(forIndexPath: indexPath)
        let article = self.presenter.article(at: indexPath.row)
        if let imagrURL = article.aritcleImageURL,
            let savedImage = self.presenter.getImage(key: imagrURL) {
            cell.updateArticle(thumbnail: savedImage)
        } else {
            self.presenter.download(article: article)
        }
        cell.configure(article: article)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }
}

extension ArticleViewController: ArticlesViewAdaptor {
    
    func reloadNYTimesArticles() {
        DispatchQueue.main.async {
            self.articlesTable.isHidden = false
            self.errorMessageLabel.isHidden = true
            self.articlesTable.reloadData()
        }
    }
    
    func showError(message: String) {
        DispatchQueue.main.async {
            self.articlesTable.isHidden = true
            self.errorMessageLabel.isHidden = false
            self.errorMessageLabel.text = message
        }
    }
}
