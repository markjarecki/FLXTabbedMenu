//
//  FLXTabbedMenuDelegate.swift
//  FLXTabbedMenu
//
//  Created by Mark Jarecki on 17/5/19.
//  Copyright © 2019 Mark Jarecki. All rights reserved.
//

import UIKit

public protocol FLXTabbedMenuDelegate: class {
    
//    /// Category counts
//    func numberOfCategories(in tabbedMenu: FLXTabbedMenu) -> Int
//    func tabbedMenu(_ tabbedMenu: FLXTabbedMenu, numberOfSubcategoriesInCategory category: Int) -> Int
    
    /// Properties
    func categoryViewModels(forTabbedMenu tabbedMenu: FLXTabbedMenu) -> [CategoryViewModel]
    func tabbedMenu(_ tabbedMenu: FLXTabbedMenu, subCategoryViewModelAtIndex index: Int) -> SubCategoryViewModel

    /// Highlighting / unhighlighting items
    func tabbedMenu(_ tabbedMenu: FLXTabbedMenu, didHighlightCategoryAtIndex index: Int)
    func tabbedMenu(_ tabbedMenu: FLXTabbedMenu, didUnhighlightCategoryAtIndex index: Int)
    func tabbedMenu(_ tabbedMenu: FLXTabbedMenu, didHighlightSubCategoryAtIndexPath indexPath: IndexPath)
    func tabbedMenu(_ tabbedMenu: FLXTabbedMenu, didUnhighlightSubCategoryAtIndexPath indexPath: IndexPath)

    /// Selecting / deselecting items
    func tabbedMenu(_ tabbedMenu: FLXTabbedMenu, didSelectCategoryAtIndex index: Int)
    func tabbedMenu(_ tabbedMenu: FLXTabbedMenu, didDeselectCategoryAtIndex index: Int)
    func tabbedMenu(_ tabbedMenu: FLXTabbedMenu, didSelectSubCategoryAtIndexPath indexPath: IndexPath)
    func tabbedMenu(_ tabbedMenu: FLXTabbedMenu, didDeselectSubCategoryAtIndexPath indexPath: IndexPath)

}

// MARK: - Default implementations

extension FLXTabbedMenuDelegate {

//    /// Category counts
//    public func numberOfCategories(in tabbedMenu: FLXTabbedMenu) -> Int { return 0 }
//    public func tabbedMenu(_ tabbedMenu: FLXTabbedMenu, numberOfSubcategoriesInCategory category: Int) -> Int { return 0 }
    
    /// View models
    public func categoryViewModels(forTabbedMenu tabbedMenu: FLXTabbedMenu) -> [CategoryViewModel] { return [] }
    public func tabbedMenu(_ tabbedMenu: FLXTabbedMenu, subCategoryViewModelAtIndex index: Int) -> SubCategoryViewModel {
        
        return (category: "Override this value", subCategories: [])
    
    }
    
    /// Highlighting / unhighlighting items
    public func tabbedMenu(_ tabbedMenu: FLXTabbedMenu, didHighlightCategoryAtIndex index: Int) {}
    public func tabbedMenu(_ tabbedMenu: FLXTabbedMenu, didUnhighlightCategoryAtIndex index: Int) {}
    public func tabbedMenu(_ tabbedMenu: FLXTabbedMenu, didHighlightSubCategoryAtIndexPath indexPath: IndexPath) {}
    public func tabbedMenu(_ tabbedMenu: FLXTabbedMenu, didUnhighlightSubCategoryAtIndexPath indexPath: IndexPath) {}

    /// Selecting / deselecting items
    public func tabbedMenu(_ tabbedMenu: FLXTabbedMenu, didSelectCategoryAtIndex index: Int) {}
    public func tabbedMenu(_ tabbedMenu: FLXTabbedMenu, didDeselectCategoryAtIndex index: Int) {}
    public func tabbedMenu(_ tabbedMenu: FLXTabbedMenu, didSelectSubCategoryAtIndexPath indexPath: IndexPath)  {}
    public func tabbedMenu(_ tabbedMenu: FLXTabbedMenu, didDeselectSubCategoryAtIndexPath indexPath: IndexPath) {}
    
}
