//
//  FLXTabbedMenuSubCategoryModel.swift
//  FLXTabbedMenu
//
//  Created by Mark Jarecki on 17/5/19.
//  Copyright © 2019 Mark Jarecki. All rights reserved.
//

import Foundation

public struct FLXTabbedMenuSubCategoryModel {

    // MARK: - Properties

    public let id: String
    public let label: String

    // MARK: - Initialiser

    public init(id: String, label: String) {
    
        self.id = id
        self.label = label

    }

}

// MARK: - Equatable conformance

extension FLXTabbedMenuSubCategoryModel: Equatable {

    public static func == (lhs: FLXTabbedMenuSubCategoryModel, rhs: FLXTabbedMenuSubCategoryModel) -> Bool {
    
        return  lhs.id == rhs.id &&
                lhs.label == rhs.label
    
    }

}
