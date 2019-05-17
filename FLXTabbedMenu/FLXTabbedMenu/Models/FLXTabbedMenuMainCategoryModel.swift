//
//  FLXTabbedMenuMainCategoryModel.swift
//  FLXTabbedMenu
//
//  Created by Mark Jarecki on 17/5/19.
//  Copyright © 2019 Mark Jarecki. All rights reserved.
//

import Foundation

public struct FLXTabbedMenuMainCategoryModel {

    // MARK: - Properties

    public let id: String
    public let shortLabel: String
    public let longLabel: String

    // MARK: - Initialiser
    
    public init(id: String, shortLabel: String, longLabel: String) {
    
        self.id = id
        self.shortLabel = shortLabel
        self.longLabel = longLabel

    }

}

// MARK: - Equatable conformance

extension FLXTabbedMenuMainCategoryModel: Equatable {

    public static func == (lhs: FLXTabbedMenuMainCategoryModel, rhs: FLXTabbedMenuMainCategoryModel) -> Bool {
    
        return  lhs.id == rhs.id &&
                lhs.shortLabel == rhs.shortLabel &&
                lhs.longLabel == rhs.longLabel
    
    }

}

// MARK: - Hashable conformance

extension FLXTabbedMenuMainCategoryModel: Hashable {

    public func hash(into hasher: inout Hasher) {
    
        hasher.combine(id)
        hasher.combine(shortLabel)
        hasher.combine(longLabel)

    }

}
