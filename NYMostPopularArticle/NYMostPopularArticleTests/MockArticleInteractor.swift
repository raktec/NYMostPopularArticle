//
//  MockArticleInteractor
//  NYMostPopularArticle

//  Created by Rakesh Kumar Sharma on 24/07/19.
//  Copyright © 2019 Rakesh Kumar Sharma. All rights reserved.
//

import Foundation
import XCTest

@testable import  NYMostPopularArticle

class MockArticleInteractor: ArticleInteractor {

    private typealias JSONDictionary = [String: Any]
    private let service: MockNYTimesArticleService
    
    init(service: MockNYTimesArticleService) {
        self.service = service
    }
    
    func numberOfArticles() -> Int {
        return prepareMockArticle().count
    }
    
    func article(at index: Int) -> NYTimesArticle {
        return self.prepareMockArticle()[index]
    }
    
    func getArticles(completion: @escaping (Bool, String?) -> Void ){
        self.service.searchMostViewedArticle(duration: "7") { (response, errorMessage) in
            if errorMessage != nil {
                completion(false, errorMessage)
                return
            }
            completion(true,nil)
        }
    }

    private func prepareMockArticle() -> [NYTimesArticle] {
        let mockArticle1 =  NYTimesArticle(id: 1002345,
                                           title: "Newyork times most viewed News Test1",
                                           author: "BY A. James & H. Rashi",
                                           publishedDate: "12-08-08",
                                           aritcleImageURL: URL(string:"https://static01.nyt.com/images/2018/11/06/us/elections/results-senate-forecast-static/results-senate-forecast-static-sfSpan.jpg"))
        let mockArticle2 =  NYTimesArticle(id: 1002346,
                                           title: "Newyork times most viewed News Test2",
                                           author: "BY  James franklin & Huma Aqbar",
                                           publishedDate: "12-08-08",
                                           aritcleImageURL: URL(string:"https://static01.nyt.com/images/2018/11/05/us/elections/election-promo-housemap/election-promo-housemap-thumbStandard-v154.jpg"))

        return [mockArticle1, mockArticle2]
    }
}
