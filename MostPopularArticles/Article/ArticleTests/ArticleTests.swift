//
//  ArticleTests.swift
//  ArticleTests
//
//  Created by Rakesh Kumar Sharma on 27/03/19.
//  Copyright © 2019 Rakesh Kumar Sharma. All rights reserved.
//

import XCTest
@testable import Article

class ArticleTests: XCTestCase {
    var articleArray = [Article]()
    var jsonDictionary = [String: Any]()
    var articleDataLayer = ArticlesDataLayer()

    override func setUp() {
        super.setUp()
        if let path = Bundle.main.path(forResource: "articleData", ofType: "json") {
            do {
                let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
                let jsonResult = try JSONSerialization.jsonObject(with: data, options: .mutableLeaves)
                if jsonResult is Dictionary<String, AnyObject>{
                    jsonDictionary = jsonResult as! [String : Any]
                }
            } catch let error {
                print(error.localizedDescription)
            }
        }
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testArticleResponse() {
        articleArray = articleDataLayer.getArticles(responseObject: jsonDictionary as AnyObject)
        XCTAssertTrue(articleArray.count > 0,"article array is empty" )
        let article = articleArray[0]
        XCTAssertNotNil(article, "article is nil")
    }
    

}
