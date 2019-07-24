//
//  UIView.swift
//  NYMostPopularArticle

//  Created by Rakesh Kumar Sharma on 24/07/19.
//  Copyright © 2019 Rakesh Kumar Sharma. All rights reserved.
//
import Foundation
import UIKit

extension UIView {
    @objc
    internal func didChangeLayoutAttributes() {
    }
}

extension UIView {
    enum Axis: String {
        case vertical = "V"
        case horizontal = "H"
    }

    func fillSuperview(
        priority: UILayoutPriority = UILayoutPriority(rawValue: Float(1_000)),
        overlapMargins: Bool = true
        ) {
        self.fillSuperview(axis: .vertical, priority: priority, overlapMargins: overlapMargins)
        self.fillSuperview(axis: .horizontal, priority: priority, overlapMargins: overlapMargins)
    }

    func fillSuperview(
        axis: Axis,
        priority: UILayoutPriority = UILayoutPriority(rawValue: Float(1_000)),
        overlapMargins: Bool = true
        ) {
        self.translatesAutoresizingMaskIntoConstraints = false

        var visualFormat = "|-[subview]-|"
        if overlapMargins {
            visualFormat = "|[subview]|"
        }

        let constraints = NSLayoutConstraint.constraints(
            withVisualFormat: axis.rawValue+":"+visualFormat,
            options: NSLayoutFormatOptions(),
            metrics: nil,
            views: ["subview": self]
        )

        for constraint in constraints {
            constraint.priority = priority
        }
        self.superview?.addConstraints(constraints)
    }
}

extension UIView {

    func drawImage() -> UIImage? {
        UIGraphicsBeginImageContext(self.bounds.size)
        self.drawHierarchy(in: self.bounds, afterScreenUpdates: true)
        let screenShot = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return screenShot
    }
}
