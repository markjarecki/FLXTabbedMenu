//
//  FLXTabbedMenuIndexPath.swift
//  FLXTabbedMenu
//
//  Created by Mark Jarecki on 17/5/19.
//  Copyright © 2019 Mark Jarecki. All rights reserved.
//

import Foundation

public struct FLXTabbedMenuIndexPath {

    public let selectedMainCategory: Int
    public let selectedSubCategory: Int?
    public let highlightedMainCategory: Int?
    public let highlightedSubCategory: Int?
    
    public init(selectedMainCategory: Int, selectedSubCategory: Int?, highlightedMainCategory: Int?, highlightedSubCategory: Int?) {
    
        self.selectedMainCategory = selectedMainCategory
        self.selectedSubCategory = selectedSubCategory
        self.highlightedMainCategory = highlightedMainCategory
        self.highlightedSubCategory = highlightedSubCategory

    }
    
    public func newDiffed(newIndexPath: FLXTabbedMenuIndexPath) -> (indexPath: FLXTabbedMenuIndexPath, diff: Any) {
    
        let indexPath: FLXTabbedMenuIndexPath
        let diff: Any
    
        return (indexPath: indexPath, diff: diff)
    
    }

}
