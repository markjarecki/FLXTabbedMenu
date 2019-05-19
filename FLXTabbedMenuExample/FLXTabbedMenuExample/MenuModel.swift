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
                                     MenuSubCategory(image: nil, text: "Sub category 1"),
                                     MenuSubCategory(image: nil, text: "Sub category 2"),
                                     MenuSubCategory(image: nil, text: "Sub category 3"),
                                     MenuSubCategory(image: nil, text: "Sub category 4")
                            ])
    
    let investmentsCategory = MenuCategory(
                                image: nil,
                                text: "Investments",
                                subCategories: [
                                     MenuSubCategory(image: nil, text: "Sub category 1"),
                                     MenuSubCategory(image: nil, text: "Sub category 2"),
                                     MenuSubCategory(image: nil, text: "Sub category 3"),
                                     MenuSubCategory(image: nil, text: "Sub category 4"),
                                     MenuSubCategory(image: nil, text: "Sub category 5")
                            ])
    
    let transfersCategory = MenuCategory(
                                image: nil,
                                text: "Transfers",
                                subCategories: [
                                     MenuSubCategory(image: nil, text: "Sub category 1")
                            ])
    
    let communicationsCategory = MenuCategory(
                                image: nil,
                                text: "Communications",
                                subCategories: [
                                     MenuSubCategory(image: nil, text: "Sub category 1"),
                                     MenuSubCategory(image: nil, text: "Sub category 2"),
                                     MenuSubCategory(image: nil, text: "Sub category 3"),
                                     MenuSubCategory(image: nil, text: "Sub category 4"),
                                     MenuSubCategory(image: nil, text: "Sub category 5"),
                                     MenuSubCategory(image: nil, text: "Sub category 6")
                            ])
    
    
    let settingsCategory = MenuCategory(
                                image: nil,
                                text: "Settings",
                                subCategories: [
                                     MenuSubCategory(image: nil, text: "Sub category 1"),
                                     MenuSubCategory(image: nil, text: "Sub category 2"),
                                     MenuSubCategory(image: nil, text: "Sub category 3"),
                                     MenuSubCategory(image: nil, text: "Sub category 4"),
                                     MenuSubCategory(image: nil, text: "Sub category 5"),
                                     MenuSubCategory(image: nil, text: "Sub category 6")
                            ])

    return [accountsCategory, investmentsCategory, transfersCategory, communicationsCategory, settingsCategory]

}
