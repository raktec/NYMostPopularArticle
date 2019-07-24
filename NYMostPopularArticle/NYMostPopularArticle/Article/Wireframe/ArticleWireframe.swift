//
//  HomeWireframe.swift
//  NYMostPopularArticle

//  Created by Rakesh Kumar Sharma on 24/07/19.
//  Copyright © 2019 Rakesh Kumar Sharma. All rights reserved.
//

import Foundation
import UIKit

protocol ArticleWireframe {
    
}

class ArticleWireframeImpl: Wireframe, ArticleWireframe {
    
    static func showRoot(navigationController: UINavigationController) {
        let wireframe = ArticleWireframeImpl(navigationController: navigationController)
        let view = ArticleViewController.instantiateFromStoryboard()
        let interactor = InteractorFactory.sharedInstance.articleScreenInteractor()
        let downloadInteractor = InteractorFactory.sharedInstance.downloadInteractor(delegate: view)
        let presenter = ArticlesPresenter(view: view,
                                      wireframe: wireframe,
                                      interactor: interactor,
                                      downloadInteractor: downloadInteractor)
        view.presenter = presenter
        navigationController.viewControllers = [view]
    }
}
