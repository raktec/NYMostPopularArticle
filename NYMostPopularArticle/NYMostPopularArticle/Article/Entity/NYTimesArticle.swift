//
//  NYTimesArticle.swift
//  NYMostPopularArticle

//  Created by Rakesh Kumar Sharma on 24/07/19.
//  Copyright © 2019 Rakesh Kumar Sharma. All rights reserved.
//


import Foundation

struct NYTimesArticle {
    
    var id: Int
    var title: String
    var publishedDate: String
    var author: String
    var aritcleImageURL: URL?
    
    //Helper
    var index: Int?
    var isImageDownloaded = false
    
    init(id: Int,
         title: String,
         author: String,
         publishedDate: String,
         aritcleImageURL: URL?) {
        
        self.id = id
        self.title = title
        self.publishedDate = publishedDate
        self.author = author
        self.aritcleImageURL = aritcleImageURL
    }
}
