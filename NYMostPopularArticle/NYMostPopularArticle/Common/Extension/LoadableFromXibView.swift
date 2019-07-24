//
//  LoadableFromXibView.swift
//  NYMostPopularArticle

//  Created by Rakesh Kumar Sharma on 24/07/19.
//  Copyright © 2019 Rakesh Kumar Sharma. All rights reserved.
//


import UIKit

@IBDesignable class LoadableFromXibView: UIView, NibLoadableView {
    // swiftlint:disable private_outlet
    @IBOutlet weak var contentView: UIView!
    // swiftlint:enable private_outlet
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.xibSetup()
        self.onInit()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.xibSetup()
        self.onInit()
    }

    convenience init() {
        self.init(frame: CGRect.zero)
    }

    func xibSetup() {
        guard let subView = self.loadViewFromXib()
            else { return }
        self.contentView = subView
        self.addSubview(self.contentView)
        self.contentView.fillSuperview()
    }

    private func loadViewFromXib() -> UIView? {
        let bundle = Bundle(for: type(of: self))
        let nib = UINib(nibName: type(of: self).nibName, bundle: bundle)
        return nib.instantiate(withOwner: self, options: nil).first as? UIView
    }

    func onInit() {
    }

}
