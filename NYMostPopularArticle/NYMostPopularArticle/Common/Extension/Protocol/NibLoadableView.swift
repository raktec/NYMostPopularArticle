//
//  NibLoadableView.swift
//  NYMostPopularArticle

//  Created by Rakesh Kumar Sharma on 24/07/19.
//  Copyright © 2019 Rakesh Kumar Sharma. All rights reserved.
//


import Foundation
import UIKit

protocol NibLoadableView: class { }

extension NibLoadableView where Self: UIView {

    static var nibName: String {
        return String(describing: self)
    }

}
