//
//  HomeInteractorSpec.swift
//  NYMostPopularArticle

//  Created by Rakesh Kumar Sharma on 24/07/19.
//  Copyright © 2019 Rakesh Kumar Sharma. All rights reserved.
//

import Foundation
import XCTest
@testable import NYMostPopularArticle

class HomeInteractorSpec: XCTestCase {
    
    var interactor: MockArticleInteractor!
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
        let service = MockNYTimesArticleService()
        interactor =  MockArticleInteractor(service: service)
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
        interactor = nil
    }
    /*
     Here we spec the negative cases
    */
    func testSearchArticle() {
        let expectation = self.expectation(description: "NY Most viewed Articles")
        self.interactor.getArticles { (success, errorMessage) in
            XCTAssertFalse(success)
            XCTAssertNotNil(errorMessage)
            expectation.fulfill()
        }
        waitForExpectations(timeout: 2, handler: nil)
    }

    /*
     Spec the article and its properties
     */
    func testArticle() {
        let articles = self.interactor.numberOfArticles()
        let article = self.interactor.article(at: articles - 1 )
        XCTAssertNotNil(article)
        XCTAssertNotNil(article.title)
        XCTAssertNotNil(article.id)
        XCTAssertNotNil(article.author)
        XCTAssertNotNil(article.publishedDate)
        XCTAssertNotNil(article.aritcleImageURL)
    }
}

