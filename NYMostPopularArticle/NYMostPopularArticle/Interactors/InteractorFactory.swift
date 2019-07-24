//
//  InteractorFactory.swift
//  NYMostPopularArticle

//  Created by Rakesh Kumar Sharma on 24/07/19.
//  Copyright © 2019 Rakesh Kumar Sharma. All rights reserved.
//

import Foundation

class InteractorFactory {
    static let sharedInstance = InteractorFactory()
    
    func articleService() -> NYTimesArticleService {
        return NYTimesArticleServiceImpl()
    }
    
    func articleScreenInteractor() -> ArticleInteractor {
        return ArticleInteractorImpl(service: self.articleService())
    }
    
    func downloadService(delegate: URLSessionDelegate) -> DownloadImageService {
        return DownloadImageServiceImpl(delegate: delegate)
    }
    
    func downloadInteractor(delegate: URLSessionDelegate) -> DownloadImageInteractor {
        let service = self.downloadService(delegate: delegate)
        return DownloadImageInteractorImpl(downloadService: service)
    }
    
}
