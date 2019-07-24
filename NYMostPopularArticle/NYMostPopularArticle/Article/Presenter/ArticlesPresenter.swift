//
//  HomePresenter.swift
//  NYMostPopularArticle

//  Created by Rakesh Kumar Sharma on 24/07/19.
//  Copyright © 2019 Rakesh Kumar Sharma. All rights reserved.
//

import Foundation
import UIKit

class ArticlesPresenter {
    
    let view: ArticlesViewAdaptor?
    let wireframe: ArticleWireframe
    let interactor: ArticleInteractor
    let downloadInteractor: DownloadImageInteractor
    
    init(view: ArticlesViewAdaptor?,
         wireframe: ArticleWireframe,
         interactor: ArticleInteractor,
         downloadInteractor: DownloadImageInteractor) {
        self.view = view
        self.wireframe = wireframe
        self.interactor = interactor
        self.downloadInteractor = downloadInteractor
    }
    
    func viewWillAppear() {
        self.interactor.getArticles { (success, errorMessage) in
            if let message = errorMessage {
                self.view?.showError(message: message)
                return
            }
            self.view?.reloadNYTimesArticles()
        }
    }
    func numberOfArticles() -> Int {
        return self.interactor.numberOfArticles()
    }
    
    func article(at index: Int) -> NYTimesArticle {
        return self.interactor.article(at: index)
    }
    
    func download(article: NYTimesArticle) {
        self.downloadInteractor.startDownload(article)
    }
    
    func getImage(key: URL) -> UIImage? {
        return self.downloadInteractor.getImage(key: key)
    }
    
    func saveDownload(sourceURL: URL, downloadingTo location: URL) {
        self.downloadInteractor.saveDownload(sourceURL: sourceURL, downloadingTo: location)
    }
    
    func activeDownload(key: URL) -> Download? {
        return self.downloadInteractor.activeDownload(key: key)
    }
}

