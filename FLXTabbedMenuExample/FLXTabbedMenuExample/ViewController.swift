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
        view.backgroundColor = UIColor.init(white: 94/255, alpha: 1)

        /// Add the menu
        menu.delegate = self
        view.addSubview(menu)
        
        /// Simulate event after rendering RVC
        DispatchQueue.main.async { [weak self] in
            
            /// Show the menu
            self?.menu.show(withSelectedCategoryIndex: 0)
            
        }

    }

}

// MARK: - FLXTabbedMenuDelegate conformance

extension MainViewController: FLXTabbedMenuDelegate {
    
    func categoryViewModels(forTabbedMenu tabbedMenu: FLXTabbedMenu) -> [CategoryViewModel] {
        
        return model().map{ (category: $0.text, image: $0.image) }
        
    }
    
    func tabbedMenu(_ tabbedMenu: FLXTabbedMenu, itemContainerViewModelAtIndex index: Int) -> ItemContainerViewModel {
        
        let category = model()[index]
        let items = category.items.map{ (category: $0.text, image: $0.image) }
        
        return (category: category.text, items: items)
        
    }
    
}
