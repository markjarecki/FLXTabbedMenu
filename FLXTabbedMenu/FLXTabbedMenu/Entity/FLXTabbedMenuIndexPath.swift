//
//  FLXTabbedMenuIndexPath.swift
//  FLXTabbedMenu
//
//  Created by Mark Jarecki on 17/5/19.
//  Copyright © 2019 Mark Jarecki. All rights reserved.
//

import Foundation

public struct FLXTabbedMenuIndexPath {

    public let mainCategory: Int
    public let subCategory: Int?
    
    public init(mainCategory: Int, subCategory: Int?) {
    
        self.mainCategory = mainCategory
        self.subCategory = subCategory
    
    }

}
