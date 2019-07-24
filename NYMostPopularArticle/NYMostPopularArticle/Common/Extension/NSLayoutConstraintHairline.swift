//
//  NSLayoutConstraintHairline.swift
//  NYMostPopularArticle

//  Created by Rakesh Kumar Sharma on 24/07/19.
//  Copyright © 2019 Rakesh Kumar Sharma. All rights reserved.
//


import UIKit

class NSLayoutConstraintHairline: NSLayoutConstraint {
    internal class func width() -> CGFloat {
        return 1 / UIScreen.main.scale
    }

    internal class func borderWidth() -> CGFloat {
        return 1.0
    }

    override func awakeFromNib() {
        super.awakeFromNib()

        if self.constant == 1 {
            self.constant = NSLayoutConstraintHairline.width()
        }
    }
}
