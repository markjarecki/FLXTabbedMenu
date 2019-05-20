//
//  FLXTabbedMenuDelegate.swift
//  FLXTabbedMenu
//
//  Created by Mark Jarecki on 17/5/19.
//  Copyright © 2019 Mark Jarecki. All rights reserved.
//

import UIKit

public protocol FLXTabbedMenuDelegate: class {
    
    /// Properties
    func categoryViewModels(forTabbedMenu tabbedMenu: FLXTabbedMenu) -> [CategoryViewModel]
    func tabbedMenu(_ tabbedMenu: FLXTabbedMenu, itemContainerViewModelAtIndex index: Int) -> ItemContainerViewModel

    /// Highlighting / unhighlighting items
    func tabbedMenu(_ tabbedMenu: FLXTabbedMenu, didHighlightCategoryAtIndex index: Int)
    func tabbedMenu(_ tabbedMenu: FLXTabbedMenu, didUnhighlightCategoryAtIndex index: Int)
    func tabbedMenu(_ tabbedMenu: FLXTabbedMenu, didHighlightItemAtIndexPath indexPath: IndexPath)
    func tabbedMenu(_ tabbedMenu: FLXTabbedMenu, didUnhighlightItemAtIndexPath indexPath: IndexPath)

    /// Selecting / deselecting items
    func tabbedMenu(_ tabbedMenu: FLXTabbedMenu, didSelectCategoryAtIndex index: Int)
    func tabbedMenu(_ tabbedMenu: FLXTabbedMenu, didDeselectCategoryAtIndex index: Int)
    func tabbedMenu(_ tabbedMenu: FLXTabbedMenu, didSelectItemAtIndexPath indexPath: IndexPath)
    func tabbedMenu(_ tabbedMenu: FLXTabbedMenu, didDeselectitemAtIndexPath indexPath: IndexPath)

}

// MARK: - Default implementations

extension FLXTabbedMenuDelegate {
    
    /// View models
    public func categoryViewModels(forTabbedMenu tabbedMenu: FLXTabbedMenu) -> [CategoryViewModel] { return [] }
    public func tabbedMenu(_ tabbedMenu: FLXTabbedMenu, itemContainerViewModelAtIndex index: Int) -> ItemContainerViewModel {
        
        return (category: "Override this value", items: [])
    
    }
    
    /// Highlighting / unhighlighting items
    public func tabbedMenu(_ tabbedMenu: FLXTabbedMenu, didHighlightCategoryAtIndex index: Int) {}
    public func tabbedMenu(_ tabbedMenu: FLXTabbedMenu, didUnhighlightCategoryAtIndex index: Int) {}
    public func tabbedMenu(_ tabbedMenu: FLXTabbedMenu, didHighlightItemAtIndexPath indexPath: IndexPath) {}
    public func tabbedMenu(_ tabbedMenu: FLXTabbedMenu, didUnhighlightItemAtIndexPath indexPath: IndexPath) {}

    /// Selecting / deselecting items
    public func tabbedMenu(_ tabbedMenu: FLXTabbedMenu, didSelectCategoryAtIndex index: Int) {}
    public func tabbedMenu(_ tabbedMenu: FLXTabbedMenu, didDeselectCategoryAtIndex index: Int) {}
    public func tabbedMenu(_ tabbedMenu: FLXTabbedMenu, didSelectItemAtIndexPath indexPath: IndexPath)  {}
    public func tabbedMenu(_ tabbedMenu: FLXTabbedMenu, didDeselectitemAtIndexPath indexPath: IndexPath) {}
    
}
