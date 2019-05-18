//
//  MenuModel.swift
//  FLXTabbedMenuExample
//
//  Created by Mark Jarecki on 18/5/19.
//  Copyright © 2019 Mark Jarecki. All rights reserved.
//

import UIKit

struct MenuCategory {
    
    let image: UIImage?
    let text: String
    let subCategories: [MenuSubCategory]
    
}

struct MenuSubCategory {
    
    let image: UIImage?
    let text: String
    
}

func model() -> [MenuCategory] {

    let accountsCategory = MenuCategory(
                                image: nil,
                                text: "Accounts",
                                subCategories: [
                                     MenuSubCategory(image: nil, text: "Home 1"),
                                     MenuSubCategory(image: nil, text: "Home 2"),
                                     MenuSubCategory(image: nil, text: "Home 3")
                            ])
    
    let anotherCategory = MenuCategory(
                                image: nil,
                                text: "Another",
                                subCategories: [
                                     MenuSubCategory(image: nil, text: "Home 1"),
                                     MenuSubCategory(image: nil, text: "Home 2"),
                                     MenuSubCategory(image: nil, text: "Home 3"),
                                     MenuSubCategory(image: nil, text: "Home 4"),
                                     MenuSubCategory(image: nil, text: "Home 5")
                            ])
    
    let transfersCategory = MenuCategory(
                                image: nil,
                                text: "Transfers",
                                subCategories: [
                                     MenuSubCategory(image: nil, text: "Home 1")
                            ])

    return [accountsCategory, anotherCategory, transfersCategory]

}
