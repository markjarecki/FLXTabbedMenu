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

