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
    
    // MARK: Feature
    
    /// Simulating flow to another scene
    var feature: (category: Int, item: Int?)? {
        
        didSet{
            
            /// Don't update labels on first load
            if oldValue != nil {
                
                if let feature = feature {
                    
                    categoryLabel.text = model()[feature.category].text
                    
                    if let item = feature.item {
                        
                        itemLabel.text = model()[feature.category].items[item].text
                        
                    }
                    
                }
                
            }
            
        }
        
    }

    // MARK: Subviews

    let button = UIView()
    let menu = FLXTabbedMenu()
    let categoryLabel = UILabel()
    let itemLabel = UILabel()

    // MARK: - Gesture recognizer
    
    let pressGestureRecognizer = FLXPressGestureRecognizer()

    // MARK: - Lifecycle overrides

    override func viewDidLoad() {
    
        super.viewDidLoad()
        
        /// View properties
        view.backgroundColor = .white

        /// Add the menu
        menu.delegate = self
        
        /// Initial starting simulated feature
        feature = (category: 0, item: nil)
        
        /// Constraints
        categoryLabel.translatesAutoresizingMaskIntoConstraints = false
        itemLabel.translatesAutoresizingMaskIntoConstraints = false
        button.translatesAutoresizingMaskIntoConstraints = false

        /// Add subviews
        view.addSubview(categoryLabel)
        view.addSubview(itemLabel)
        view.addSubview(button)
        view.addSubview(menu)
        
        // Setup button
        button.backgroundColor = .black
        button.layer.cornerRadius = 10
        
        // Setup labels
        categoryLabel.font = UIFont.systemFont(ofSize: 32, weight: .bold)
        categoryLabel.textColor = .black
        
        itemLabel.font = UIFont.systemFont(ofSize: 24, weight: .regular)
        itemLabel.textColor = .black
        
        NSLayoutConstraint.activate([
            
            button.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -12),
            button.widthAnchor.constraint(equalToConstant: 38),
            button.heightAnchor.constraint(equalToConstant: 38),
            button.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            categoryLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 48),
            categoryLabel.widthAnchor.constraint(equalTo: view.widthAnchor, constant: -64),
            categoryLabel.heightAnchor.constraint(equalToConstant: 38),
            categoryLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 32),
            
            itemLabel.topAnchor.constraint(equalTo: categoryLabel.bottomAnchor, constant: 8),
            itemLabel.widthAnchor.constraint(equalTo: view.widthAnchor, constant: -64),
            itemLabel.heightAnchor.constraint(equalToConstant: 30),
            itemLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 32)
            
        ])
        
        // Setup gestures
        pressGestureRecognizer.addTarget(self, action: #selector(handler(press:)))
        button.addGestureRecognizer(pressGestureRecognizer)

        /// Initial text
        categoryLabel.text = "Tabbed menu demo"
        itemLabel.text = "Press below to begin"

    }
    
    // MARK: - Private gesture handler
    
    @objc private func handler(press: FLXPressGestureRecognizer) {
        
        let touchPoint = press.location(in: press.view)
        
        switch press.state {
            
            case .began:
                
                button.backgroundColor = .red
            
            case .changed:
            
                guard let touchView: UIView = press.view!.hitTest(touchPoint, with: nil) else { return }
                
                if touchView != button {
                    
                    button.backgroundColor = .black
                    
                } else {
                    
                    button.backgroundColor = .red
                    
                }
            
            case .cancelled:
            
                button.backgroundColor = .black
            
            case .ended:
            
                button.backgroundColor = .red
            
                guard let feature = feature else { return }
                
                /// Show the menu
                menu.present(withSelectedCategoryIndex: feature.category, andItemIndex: feature.item)
            
            default: print("Unhandled state")
            
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
    
    func tabbedMenu(_ tabbedMenu: FLXTabbedMenu, didSelectItemAtIndexPath indexPath: IndexPath)  {
        
        menu.dismiss()
        
        /// Simulate flow to another scene
        feature = (category: indexPath.section, item: indexPath.item)
        
    }
    
    func didDismiss(_ tabbedMenu: FLXTabbedMenu) {
        
        button.backgroundColor = .black
        
    }

}
