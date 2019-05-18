//
//  FLXTabbedMenuDelegate.swift
//  FLXTabbedMenu
//
//  Created by Mark Jarecki on 17/5/19.
//  Copyright © 2019 Mark Jarecki. All rights reserved.
//

import UIKit

public protocol FLXTabbedMenuDelegate: class {
    
    /// Category counts
    func numberOfCategories(in tabbedMenu: FLXTabbedMenu) -> Int
    func tabbedMenu(_ tabbedMenu: FLXTabbedMenu, numberOfSubcategoriesInCategory category: Int) -> Int
    
    /// Properties
    func categoryProperties(forTabbedMenu tabbedMenu: FLXTabbedMenu) -> [(image: UIImage?, text: String)]
    func tabbedMenu(_ tabbedMenu: FLXTabbedMenu, subCategoryPropertiesForCategoryAtIndex index: Int) -> [(image: UIImage?, text: String)]

    /// Highlighting / unhighlighting items
    func tabbedMenu(_ tabbedMenu: FLXTabbedMenu, didHighlightCategoryAtIndex index: Int) -> Void
    func tabbedMenu(_ tabbedMenu: FLXTabbedMenu, didUnhighlightCategoryAtIndex index: Int) -> Void
    func tabbedMenu(_ tabbedMenu: FLXTabbedMenu, didHighlightSubCategoryAtIndexPath indexPath: IndexPath) -> Void
    func tabbedMenu(_ tabbedMenu: FLXTabbedMenu, didUnhighlightSubCategoryAtIndexPath indexPath: IndexPath) -> Void

    /// Selecting / deselecting items
    func tabbedMenu(_ tabbedMenu: FLXTabbedMenu, didSelectCategoryAtIndex index: Int) -> Void
    func tabbedMenu(_ tabbedMenu: FLXTabbedMenu, didDeselectCategoryAtIndex index: Int) -> Void
    func tabbedMenu(_ tabbedMenu: FLXTabbedMenu, didSelectSubCategoryAtIndexPath indexPath: IndexPath) -> Void
    func tabbedMenu(_ tabbedMenu: FLXTabbedMenu, didDeselectSubCategoryAtIndexPath indexPath: IndexPath) -> Void

}

// MARK: - Default implementations

extension FLXTabbedMenuDelegate {

    /// Category counts
    public func numberOfCategories(in tabbedMenu: FLXTabbedMenu) -> Int { return 0 }
    public func tabbedMenu(_ tabbedMenu: FLXTabbedMenu, numberOfSubcategoriesInCategory category: Int) -> Int { return 0 }
    
    /// Properties
    public func categoryProperties(forTabbedMenu tabbedMenu: FLXTabbedMenu) -> [(image: UIImage?, text: String)] { return [] }
    public func tabbedMenu(_ tabbedMenu: FLXTabbedMenu, subCategoryPropertiesForCategoryAtIndex index: Int) -> [(image: UIImage?, text: String)] { return [] }
    
    /// Highlighting / unhighlighting items
    public func tabbedMenu(_ tabbedMenu: FLXTabbedMenu, didHighlightCategoryAtIndex index: Int) -> Void {}
    public func tabbedMenu(_ tabbedMenu: FLXTabbedMenu, didUnhighlightCategoryAtIndex index: Int) -> Void {}
    public func tabbedMenu(_ tabbedMenu: FLXTabbedMenu, didHighlightSubCategoryAtIndexPath indexPath: IndexPath) -> Void {}
    public func tabbedMenu(_ tabbedMenu: FLXTabbedMenu, didUnhighlightSubCategoryAtIndexPath indexPath: IndexPath) -> Void {}

    /// Selecting / deselecting items
    public func tabbedMenu(_ tabbedMenu: FLXTabbedMenu, didSelectCategoryAtIndex index: Int) -> Void {}
    public func tabbedMenu(_ tabbedMenu: FLXTabbedMenu, didDeselectCategoryAtIndex index: Int) -> Void {}
    public func tabbedMenu(_ tabbedMenu: FLXTabbedMenu, didSelectSubCategoryAtIndexPath indexPath: IndexPath) -> Void {}
    public func tabbedMenu(_ tabbedMenu: FLXTabbedMenu, didDeselectSubCategoryAtIndexPath indexPath: IndexPath) -> Void {}
    
}
