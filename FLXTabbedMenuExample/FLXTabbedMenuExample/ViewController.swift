//
//  ViewController.swift
//  FLXTabbedMenuExample
//
//  Created by Mark Jarecki on 17/5/19.
//  Copyright © 2019 Mark Jarecki. All rights reserved.
//

import UIKit
import FLXTabbedMenu

final class MainViewController: UIViewController {

    // MARK: - Properties

    // MARK: Subviews

    let menu = FLXTabbedMenu()

    // MARK: - Lifecycle overrides

    override func viewDidLoad() {
    
        super.viewDidLoad()
        
        /// View properties
        view.backgroundColor = .gray

        /// Add the menu
        menu.delegate = self
        view.addSubview(menu)
        
        /// Show the menu
        menu.show(withSelectedCategoryIndex: 0)

    }

}

// MARK: - FLXTabbedMenuDelegate conformance

extension MainViewController: FLXTabbedMenuDelegate {

    func numberOfCategories(in tabbedMenu: FLXTabbedMenu) -> Int {
    
        return model().count
    
    }

}
