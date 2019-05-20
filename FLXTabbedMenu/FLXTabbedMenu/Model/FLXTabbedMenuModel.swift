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
    let selectedItem: IndexPath?
    let highlightedCategory: Int?
    let highlightedItem: IndexPath?
    
    init(selectedCategory: Int, selectedItem: IndexPath?, highlightedCategory: Int?, highlightedItem: IndexPath?) {
    
        self.selectedCategory = selectedCategory
        self.selectedItem = selectedItem
        self.highlightedCategory = highlightedCategory
        self.highlightedItem = highlightedItem

    }

}

// MARK: - Alternate initialisers

extension FLXTabbedMenuModel {
    
    func model(forSelectedCategory selectedCategory: Int) -> FLXTabbedMenuModel {
        
        return FLXTabbedMenuModel(selectedCategory: selectedCategory, selectedItem: self.selectedItem, highlightedCategory: self.highlightedCategory, highlightedItem: self.highlightedItem)
        
    }
    
    func model(forSelectedItem selectedItem: IndexPath?) -> FLXTabbedMenuModel {
        
        return FLXTabbedMenuModel(selectedCategory: self.selectedCategory, selectedItem: selectedItem, highlightedCategory: self.highlightedCategory, highlightedItem: self.highlightedItem)
        
    }
    
    func model(forHighlightedCategory highlightedCategory: Int?) -> FLXTabbedMenuModel {
        
        return FLXTabbedMenuModel(selectedCategory: self.selectedCategory, selectedItem: self.selectedItem, highlightedCategory: highlightedCategory, highlightedItem: self.highlightedItem)
        
    }
    
    func model(forHighlightedItem highlightedItem: IndexPath?) -> FLXTabbedMenuModel {
        
        return FLXTabbedMenuModel(selectedCategory: self.selectedCategory, selectedItem: self.selectedItem, highlightedCategory: self.highlightedCategory, highlightedItem: highlightedItem)
        
    }
    
    func model(forHighlightedCategory category: Int?, item: IndexPath?) -> FLXTabbedMenuModel {
        
        return FLXTabbedMenuModel(selectedCategory: self.selectedCategory, selectedItem: self.selectedItem, highlightedCategory: category, highlightedItem: item)
        
    }
    
}

// MARK: - Equatable conformance

extension FLXTabbedMenuModel: Equatable {
    
    static func ==(lhs: FLXTabbedMenuModel, rhs: FLXTabbedMenuModel) -> Bool {
        
        return
                lhs.selectedCategory == rhs.selectedCategory &&
                lhs.selectedItem == rhs.selectedItem &&
                lhs.highlightedCategory == rhs.highlightedCategory &&
                lhs.highlightedItem == rhs.highlightedItem
        
    }
    
}
