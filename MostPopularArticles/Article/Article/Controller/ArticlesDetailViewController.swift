//
//  ArticlesDetailViewController.swift
//  Article
//
//  Created by Rakesh Kumar Sharma on 27/03/19.
//  Copyright © 2019 Rakesh Kumar Sharma. All rights reserved.
//

import UIKit

class ArticlesDetailViewController: UIViewController,UIWebViewDelegate {
    var article = Article()
    var activityIndicator : UIActivityIndicatorView = UIActivityIndicatorView()
    
    @IBOutlet weak var articleCaptionLabel: UILabel!
    @IBOutlet weak var adxKeywordsTextView: UITextView!
    @IBOutlet weak var imageView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
       
        self.imageView.downloadImageFromUrl(link: article.imageUrl, contentMode: .scaleToFill)
        if let articleCaption = article.caption as String? {
        self.articleCaptionLabel.text = articleCaption
        }
        if let adxKeywords = article.adxkeywords as String? {
            self.adxKeywordsTextView.text = adxKeywords
        }
      
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    //MARK: Webview delegate method
    
   
    
   
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
