//
//  NSRange.swift
//  NYMostPopularArticle

//  Created by Rakesh Kumar Sharma on 24/07/19.
//  Copyright © 2019 Rakesh Kumar Sharma. All rights reserved.
//

import Foundation

extension NSRange {
    init(fromRange range: Range<String.Index>, ofString string: String) {
        let start = string.distance(from: string.startIndex, to: range.lowerBound)
        let length = string.distance(from: range.lowerBound, to: range.upperBound)

        self.init(location: start, length: length)
    }
}
