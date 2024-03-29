//
//  ArticlesDataLayer.swift
//  Article
//
//  Created by Rakesh Kumar Sharma on 27/03/19.
//  Copyright © 2019 Rakesh Kumar Sharma. All rights reserved.
//

import UIKit

class ArticlesDataLayer: NSObject {
    
    func getArticles(responseObject: AnyObject) -> [Article] {
        var articleArray = [Article]()
            if let responseArray = responseObject["results"] as? [[String:Any]] {
                for articleDictionary in responseArray {
                    let article = Article()
                    if let articleUrl = articleDictionary["url"] as? String {
                        article.url = articleUrl
                    }
                    if let articleTitle = articleDictionary["title"] as? String {
                        article.title = articleTitle
                    }
                    if let adxKeywords = articleDictionary["adx_keywords"] as? String {
                        article.adxkeywords = adxKeywords
                    }
                    if let articlePublishedData = articleDictionary["published_date"] as? String {
                        article.publishedDate = articlePublishedData
                    }
                    if let articleBy = articleDictionary["byline"] as? String {
                        article.byLine = articleBy
                    }
                    if let mediaArray = articleDictionary["media"] as? [[String:Any]] {
                      if let dictionary = mediaArray.first {
                        if let articleCaption = dictionary["caption"] as? String {
                            article.caption = articleCaption
                        }
                        if let articleCopyright = dictionary["copyright"] as? String {
                            article.copyright = articleCopyright
                        }
                        if let imageArray = dictionary["media-metadata"] as? [[String:Any]] {
                            var dictionary = imageArray[1]
                            article.thumbnailImageUrl = dictionary["url"] as! String
                            dictionary = imageArray[2]
                            article.imageUrl = dictionary["url"] as! String
                        }
                      }
                    }
                    articleArray.append(article)
                }
            }
        return articleArray
    }
    
}
