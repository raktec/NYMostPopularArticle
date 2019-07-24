//
//  NSMutableAttributedString+Occurrences.swift
//  NYMostPopularArticle

//  Created by Rakesh Kumar Sharma on 24/07/19.
//  Copyright © 2019 Rakesh Kumar Sharma. All rights reserved.
//


import Foundation
import UIKit

extension NSMutableAttributedString {
    
    func addAttributes(_ attributes: [NSAttributedStringKey: AnyObject]) {
        self.addAttributes(attributes, range: NSRange(location: 0, length: self.length))
    }
    
    func addAttributesBetweenOccurrencesOf(_ string: String, attributes: [NSAttributedStringKey: AnyObject]) {
        let originalString = self.string
        let replaceRanges = originalString.rangesBetweenOccurrencesOf(string)
        for range in replaceRanges {
            self.addAttributes(attributes, range: NSRange(fromRange: range, ofString: originalString))
        }
        let marksRanges = self.string.rangesOfOccurrencesOf(string).reversed()
        for range in marksRanges {
            self.replaceCharacters(in: NSRange(fromRange: range, ofString: originalString), with: "")
        }
    }
}
