//
//  MockDownloadImageService.swift
//  NYMostPopularArticle

//  Created by Rakesh Kumar Sharma on 24/07/19.
//  Copyright © 2019 Rakesh Kumar Sharma. All rights reserved.
//

import Foundation
import XCTest
@testable import NYMostPopularArticle

class MockDownloadImageService: DownloadImageService {
    
    private var activeDownloads: [URL: Download] = [:]
    
    func startDownload(_ article: NYTimesArticle){
        let download = Download(article: article)
        download.isDownloading = true
        activeDownloads[article.aritcleImageURL!] = download
    }
    
    func getActiveDownloads() -> [URL: Download]{
        return activeDownloads
    }
}
