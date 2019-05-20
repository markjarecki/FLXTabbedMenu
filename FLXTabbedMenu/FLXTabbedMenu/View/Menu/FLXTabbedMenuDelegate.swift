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
    
    /// Selection
    func tabbedMenu(_ tabbedMenu: FLXTabbedMenu, didSelectItemAtIndexPath indexPath: IndexPath)
    
    /// Dismissal
    func didDismiss(_ tabbedMenu: FLXTabbedMenu)

}

// MARK: - Default implementations

extension FLXTabbedMenuDelegate {
    
    /// View models
    public func categoryViewModels(forTabbedMenu tabbedMenu: FLXTabbedMenu) -> [CategoryViewModel] { return [] }
    public func tabbedMenu(_ tabbedMenu: FLXTabbedMenu, itemContainerViewModelAtIndex index: Int) -> ItemContainerViewModel {
        
        return (category: "Override this value", items: [])
    
    }
    
    /// Selection
    public func tabbedMenu(_ tabbedMenu: FLXTabbedMenu, didDeselectCategoryAtIndex index: Int) {}
    
    /// Dismissal
    public func didDismiss(_ tabbedMenu: FLXTabbedMenu) {}
    
}
