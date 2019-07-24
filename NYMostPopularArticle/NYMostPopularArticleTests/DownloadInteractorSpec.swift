//
//  DownloadImageInteractorSpec.swift
//  NYMostPopularArticle

//  Created by Rakesh Kumar Sharma on 24/07/19.
//  Copyright © 2019 Rakesh Kumar Sharma. All rights reserved.
//

import Foundation
import XCTest
@testable import NYMostPopularArticle

class DownloadImageInteractorSpec: XCTestCase {
    
    var interactor: MockDownloadImageInteractor!
    var mockArticle: NYTimesArticle!
    
    override func setUp() {
        super.setUp()
        let downloadService = MockDownloadImageService()
        interactor = MockDownloadImageInteractor(service: downloadService)
        mockArticle =  NYTimesArticle(id: 1002345,
                                           title: "Newyork times most viewed News Test1",
                                           author: "BY A. James & H. Rashi",
                                           publishedDate: "12-08-08",
                                           aritcleImageURL: URL(string:"https://static01.nyt.com/images/2018/11/06/us/elections/results-senate-forecast-static/results-senate-forecast-static-sfSpan.jpg"))
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
        interactor = nil
        mockArticle = nil
    }
    
    /*
     Spec the negative case
     */
    func testCachedImage() {
        let image = self.interactor.getImage(key: URL(string: "https://static01.nyt.com/images/2018/11/06/us/elections/results-senate-forecast-static/results-senate-forecast-static-sfSpan.jpg")!)
        // Expecting Nil
        XCTAssertNil(image)
    }

    /*
     Spec the download property
     */
    func testActiveDownload() {
        self.interactor.startDownload(self.mockArticle)
        let activeDownload = self.interactor.activeDownload(key: self.mockArticle.aritcleImageURL!)
        // Expecting NotNil
        XCTAssertNotNil(activeDownload?.article)
        // Download should begin and should return true
        XCTAssertTrue(activeDownload!.isDownloading)
    }
}
