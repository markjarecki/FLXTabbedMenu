//
//  FLXTabbedMenuModelType.swift
//  FLXTabbedMenu
//
//  Created by Mark Jarecki on 17/5/19.
//  Copyright © 2019 Mark Jarecki. All rights reserved.
//

import Foundation

public protocol FLXTabbedMenuModelType {

    var model: [FLXTabbedMenuMainCategoryModel: [FLXTabbedMenuSubCategoryModel]] { get }

    init(_ model: [FLXTabbedMenuMainCategoryModel: [FLXTabbedMenuSubCategoryModel]])
    
}
