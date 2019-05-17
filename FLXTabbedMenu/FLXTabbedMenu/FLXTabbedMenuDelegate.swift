//
//  FLXTabbedMenuDelegate.swift
//  FLXTabbedMenu
//
//  Created by Mark Jarecki on 17/5/19.
//  Copyright © 2019 Mark Jarecki. All rights reserved.
//

import UIKit

public protocol FLXTabbedMenuDelegate: class {
    
    /// View requests
    
    func tabbedMenu(_ tabbedMenu: FLXTabbedMenu, mainCategoryButtonViewForId id: String) -> UIView
    func tabbedMenu(_ tabbedMenu: FLXTabbedMenu, subCategoryIconViewForId id: String) -> UIView
    
    /// Highlighting / unhighlighting items
    
    func tabbedMenu(_ tabbedMenu: FLXTabbedMenu, highlightedMainCategoryAtIndex index: FLXTabbedMenuIndexPath) -> Void
    func tabbedMenu(_ tabbedMenu: FLXTabbedMenu, highlightedSubCategoryAtIndex index: FLXTabbedMenuIndexPath) -> Void
    func tabbedMenu(_ tabbedMenu: FLXTabbedMenu, unhighlightedMainCategoryAtIndex index: FLXTabbedMenuIndexPath) -> Void
    func tabbedMenu(_ tabbedMenu: FLXTabbedMenu, unhighlightedSubCategoryAtIndex index: FLXTabbedMenuIndexPath) -> Void

    /// Selecting / deselecting items
    
    func tabbedMenu(_ tabbedMenu: FLXTabbedMenu, selectedMainCategoryAtIndex index: FLXTabbedMenuIndexPath) -> Void
    func tabbedMenu(_ tabbedMenu: FLXTabbedMenu, selectedSubCategoryAtIndex index: FLXTabbedMenuIndexPath) -> Void
    func tabbedMenu(_ tabbedMenu: FLXTabbedMenu, deselectedMainCategoryAtIndex index: FLXTabbedMenuIndexPath) -> Void
    func tabbedMenu(_ tabbedMenu: FLXTabbedMenu, deselectedSubCategoryAtIndex index: FLXTabbedMenuIndexPath) -> Void
    


}

// MARK: - Default implementations

extension FLXTabbedMenuDelegate {
    
    /// View requests
    
    public func tabbedMenu(_ tabbedMenu: FLXTabbedMenu, mainCategoryButtonViewForId id: String) -> UIView {
    
        return UIView()
    
    }
    
    
    public func tabbedMenu(_ tabbedMenu: FLXTabbedMenu, subCategoryIconViewForId id: String) -> UIView {
    
        return UIView()
    
    }
    
    /// Highlighting / unhighlighting items

    public func tabbedMenu(_ tabbedMenu: FLXTabbedMenu, highlightedMainCategoryAtIndex index: FLXTabbedMenuIndexPath) -> Void {}
    public func tabbedMenu(_ tabbedMenu: FLXTabbedMenu, highlightedSubCategoryAtIndex index: FLXTabbedMenuIndexPath) -> Void {}
    public func tabbedMenu(_ tabbedMenu: FLXTabbedMenu, unhighlightedMainCategoryAtIndex index: FLXTabbedMenuIndexPath) -> Void {}
    public func tabbedMenu(_ tabbedMenu: FLXTabbedMenu, unhighlightedSubCategoryAtIndex index: FLXTabbedMenuIndexPath) -> Void {}
    
    /// Selecting / deselecting items

    public func tabbedMenu(_ tabbedMenu: FLXTabbedMenu, selectedMainCategoryAtIndex index: FLXTabbedMenuIndexPath) -> Void {}
    public func tabbedMenu(_ tabbedMenu: FLXTabbedMenu, selectedSubCategoryAtIndex index: FLXTabbedMenuIndexPath) -> Void {}
    public func tabbedMenu(_ tabbedMenu: FLXTabbedMenu, deselectedMainCategoryAtIndex index: FLXTabbedMenuIndexPath) -> Void {}
    public func tabbedMenu(_ tabbedMenu: FLXTabbedMenu, deselectedSubCategoryAtIndex index: FLXTabbedMenuIndexPath) -> Void {}
    
}
