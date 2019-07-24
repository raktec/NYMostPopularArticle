//
//  MockNYTimesArticleService.swift
//  NYMostPopularArticle

//  Created by Rakesh Kumar Sharma on 24/07/19.
//  Copyright © 2019 Rakesh Kumar Sharma. All rights reserved.
//

import Foundation
import XCTest
@testable import NYMostPopularArticle


class MockNYTimesArticleService: NYTimesArticleService {
    
    init() {
    
    }
    
    func cancelPreviousSearch() {
        print("Cacneled the api call")
    }
    
    func searchMostViewedArticle(duration: String, completion: @escaping QueryResult) {
        completion(nil, "Something went wrong")
    }
}
