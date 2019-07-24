//
//  HomeViewAdaptor.swift
//  NYMostPopularArticle

//  Created by Rakesh Kumar Sharma on 24/07/19.
//  Copyright © 2019 Rakesh Kumar Sharma. All rights reserved.
//

import Foundation

protocol ArticlesViewAdaptor: class {
    func showError(message: String)
    func reloadNYTimesArticles()
}
