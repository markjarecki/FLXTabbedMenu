//
//  FLXTabbedMenuModel.swift
//  FLXTabbedMenu
//
//  Created by Mark Jarecki on 18/5/19.
//  Copyright © 2019 Mark Jarecki. All rights reserved.
//

import Foundation

struct FLXTabbedMenuModel {

    let selectedCategory: Int
    let selectedSubCategory: IndexPath?
    let highlightedCategory: Int?
    let highlightedSubCategory: IndexPath?
    
    init(selectedCategory: Int, selectedSubCategory: IndexPath?, highlightedCategory: Int?, highlightedSubCategory: IndexPath?) {
    
        self.selectedCategory = selectedCategory
        self.selectedSubCategory = selectedSubCategory
        self.highlightedCategory = highlightedCategory
        self.highlightedSubCategory = highlightedSubCategory

    }

}

// MARK: - Equatable conformance

extension FLXTabbedMenuModel: Equatable {
    
    static func ==(lhs: FLXTabbedMenuModel, rhs: FLXTabbedMenuModel) -> Bool {
        
        return
                lhs.selectedCategory == rhs.selectedCategory &&
                lhs.selectedSubCategory == rhs.selectedSubCategory &&
                lhs.highlightedCategory == rhs.highlightedCategory &&
                lhs.highlightedSubCategory == rhs.highlightedSubCategory
        
    }
    
}
