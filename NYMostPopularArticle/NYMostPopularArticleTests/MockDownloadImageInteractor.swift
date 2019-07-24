//
//  MockDownloadImageInteractor.swift
//  NYMostPopularArticle

//  Created by Rakesh Kumar Sharma on 24/07/19.
//  Copyright © 2019 Rakesh Kumar Sharma. All rights reserved.
//

import Foundation
import XCTest

@testable import  NYMostPopularArticle

class MockDownloadImageInteractor: DownloadImageInteractor {
    
    private let service: MockDownloadImageService
    
    init(service: MockDownloadImageService) {
        self.service = service
    }
    
    func startDownload(_ article: NYTimesArticle) {
        self.service.startDownload(article)
    }
    func getImage(key: URL) -> UIImage?{
       return nil
    }
    
    func saveDownload(sourceURL: URL, downloadingTo location: URL) {
        print("Save the downloaded image")
    }
    
    func activeDownload(key: URL) -> Download? {
       return self.service.getActiveDownloads()[key]
    }

}
