//
//  Download.swift
//  NYMostPopularArticle

//  Created by Rakesh Kumar Sharma on 24/07/19.
//  Copyright © 2019 Rakesh Kumar Sharma. All rights reserved.
//

import Foundation

class Download {
    var article: NYTimesArticle
    var task: URLSessionDownloadTask?
    var isDownloading = false
    
    init(article: NYTimesArticle) {
        self.article = article
    }
}
