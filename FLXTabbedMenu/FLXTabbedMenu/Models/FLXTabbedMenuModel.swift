//
//  FLXTabbedMenuModel.swift
//  FLXTabbedMenu
//
//  Created by Mark Jarecki on 17/5/19.
//  Copyright © 2019 Mark Jarecki. All rights reserved.
//

import Foundation

public struct FLXTabbedMenuModel: FLXTabbedMenuModelType {

    public let model: [FLXTabbedMenuMainCategoryModel: [FLXTabbedMenuSubCategoryModel]]
    
    public init(_ model: [FLXTabbedMenuMainCategoryModel: [FLXTabbedMenuSubCategoryModel]]) {
    
        self.model = model
    
    }

}
