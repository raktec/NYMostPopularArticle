//
//  UIViewController.swift
//  NYMostPopularArticle

//  Created by Rakesh Kumar Sharma on 24/07/19.
//  Copyright © 2019 Rakesh Kumar Sharma. All rights reserved.
//


import Foundation
import UIKit


extension UIViewController {
    
    class func instantiateFromStoryboard() -> Self {
        return self.instantiateFromStoryboard(self)
    }
    
    private class func instantiateFromStoryboard<T>(_ type: T.Type) -> T {
        let name = String(describing: self).replacingOccurrences(of: "ViewController", with: "")
        let storyboard = UIStoryboard(name: name+"Storyboard", bundle: nil)
        guard let viewController = storyboard.instantiateViewController(withIdentifier: name) as? T  else {
            fatalError("ViewController could not be instantiated")
        }
        return viewController
    }
    
}


extension UIViewController {
    
    func showPopUp(_ inNavigationController: UINavigationController) {
        let navVC = UINavigationController()
        navVC.viewControllers = [self]
        navVC.modalPresentationStyle = .overFullScreen
        inNavigationController.present(navVC,
                                       animated: true,
                                       completion: nil)
    }
    
    func navigationBarHeight() -> CGFloat {
        guard let navBarHeight = self.navigationController?.navigationBar.bounds.size.height else {
            return 0.0
            
        }
        let statusBarHeight = UIApplication.shared.statusBarFrame.size.height
        return navBarHeight + statusBarHeight
    }
}
