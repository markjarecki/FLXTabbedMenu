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
    let items: [MenuItem]
    
}

struct MenuItem {
    
    let image: UIImage?
    let text: String
    
}

func model() -> [MenuCategory] {

    let accountsCategory = MenuCategory(
                                image: nil,
                                text: "Accounts",
                                items: [
                                     MenuItem(image: nil, text: "Item 1"),
                                     MenuItem(image: nil, text: "Item 2"),
                                     MenuItem(image: nil, text: "Item 3"),
                                     MenuItem(image: nil, text: "Item 4")
                            ])
    
    let investmentsCategory = MenuCategory(
                                image: nil,
                                text: "Investments",
                                items: [
                                     MenuItem(image: nil, text: "Item 1"),
                                     MenuItem(image: nil, text: "Item 2"),
                                     MenuItem(image: nil, text: "Item 3"),
                                     MenuItem(image: nil, text: "Item 4"),
                                     MenuItem(image: nil, text: "Item 5")
                            ])
    
    let transfersCategory = MenuCategory(
                                image: nil,
                                text: "Transfers",
                                items: [
                                     MenuItem(image: nil, text: "Item 1")
                            ])
    
    let communicationsCategory = MenuCategory(
                                image: nil,
                                text: "Communications",
                                items: [
                                     MenuItem(image: nil, text: "Item 1"),
                                     MenuItem(image: nil, text: "Item 2"),
                                     MenuItem(image: nil, text: "Item 3"),
                                     MenuItem(image: nil, text: "Item 4"),
                                     MenuItem(image: nil, text: "Item 5"),
                                     MenuItem(image: nil, text: "Item 6")
                            ])
    
    
    let settingsCategory = MenuCategory(
                                image: nil,
                                text: "Settings",
                                items: [
                                     MenuItem(image: nil, text: "Item 1"),
                                     MenuItem(image: nil, text: "Item 2"),
                                     MenuItem(image: nil, text: "Item 3"),
                                     MenuItem(image: nil, text: "Item 4"),
                                     MenuItem(image: nil, text: "Item 5"),
                                     MenuItem(image: nil, text: "Item 6")
                            ])

    return [accountsCategory, investmentsCategory, transfersCategory, communicationsCategory, settingsCategory]

}
