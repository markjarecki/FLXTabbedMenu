//
//  FLXItemContainer.swift
//  FLXTabbedMenu
//
//  Created by Mark Jarecki on 18/5/19.
//  Copyright © 2019 Mark Jarecki. All rights reserved.
//

import UIKit

public typealias ItemContainerViewModel = (category: String, items: [ CategoryViewModel ])

class FLXItemContainer: UIView {
    
    // MARK: - Properties
    
    // MARK:  Overridable default properties
    
    var _backgroundColor: UIColor = .clear
    var _padding: CGFloat = 12
    
    // MARK: Subviews
    
    let label = UILabel()
    var menuItems: [FLXMenuItem] = []
    
    // MARK: Guides
    
    let topGuide = UILayoutGuide()

    // MARK: - Initialisers
    
    override init(frame: CGRect) {

        super.init(frame: frame)
        
        setupView()
    
    }
    
    required init?(coder aDecoder: NSCoder) {
    
        fatalError("init(coder:) has not been implemented")
        
    }
    
    // MARK: - Internal interface

    func update(withViewModel viewModel: ItemContainerViewModel) {
        
        let count = CGFloat(viewModel.items.count)
        let itemHeight: CGFloat = 54
        
        /// Layout top guide item
        NSLayoutConstraint.activate([
            
            topGuide.topAnchor.constraint(equalTo: bottomAnchor, constant: -(count * itemHeight) - _padding)
//            ,
//            topGuide.bottomAnchor.constraint(equalTo: bottomAnchor),
//            topGuide.widthAnchor.constraint(equalTo: widthAnchor),
//            topGuide.heightAnchor.constraint(equalTo: heightAnchor),
            
        ])
        
        /// Build and layout the menu items
        for viewModel in viewModel.items.enumerated() {
            
            let index = CGFloat(viewModel.offset)
            
            let menuItem = makeMenuItem(withViewModel: viewModel.element)
            
            menuItem.corner = menuItem.corner(forIndex: index, count: count)
            
            /// Retain and add
            menuItems.append(menuItem)
            addSubview(menuItem)
            
            let offset = yOffest(forIndex: index, count: count, itemHeight: itemHeight)
            
            /// Layout menu item
            NSLayoutConstraint.activate([
                
                menuItem.heightAnchor.constraint(equalToConstant: itemHeight),
                menuItem.widthAnchor.constraint(equalTo: widthAnchor),
                menuItem.leadingAnchor.constraint(equalTo: leadingAnchor),
                menuItem.topAnchor.constraint(equalTo: topGuide.topAnchor, constant: offset)
                
            ])
            
        }
        
        /// Update label text
        label.text = viewModel.category
        
        /// Layout label
        NSLayoutConstraint.activate([
        
            label.heightAnchor.constraint(equalToConstant: label.intrinsicContentSize.height),
            label.widthAnchor.constraint(equalTo: widthAnchor),
            label.leadingAnchor.constraint(equalTo: leadingAnchor, constant: _padding),
            label.bottomAnchor.constraint(equalTo: menuItems.first != nil ? menuItems.first!.topAnchor : self.bottomAnchor, constant: -_padding)
            
        ])
        
    }
    
    // MARK: - Private methods
    
    private func setupView() {
        
        /// View properties
        isOpaque = true
        backgroundColor = _backgroundColor
        
        /// Constraints
        label.translatesAutoresizingMaskIntoConstraints = false
        
        /// Label
        label.font = UIFont.systemFont(ofSize: 32, weight: .bold)
        label.textColor = .white
        
        /// Subviews
        addSubview(label)
        
        /// Guides
        addLayoutGuide(topGuide)
        
    }
    
    private func makeMenuItem(withViewModel viewModel: CategoryViewModel) -> FLXMenuItem {
        
        let menuItem = FLXMenuItem()
        
        /// Menu item
        menuItem.backgroundColor = .white
        
        /// Label
        menuItem.label.text = viewModel.category
        menuItem.label.font = UIFont.systemFont(ofSize: 18, weight: .medium)
        menuItem.label.textColor = .black
        
        /// Image
        menuItem.image.image = viewModel.image
        
        /// Constraints
        menuItem.translatesAutoresizingMaskIntoConstraints = false
        
        return menuItem
        
    }
    
    private func yOffest(forIndex index: CGFloat, count: CGFloat, itemHeight: CGFloat) -> CGFloat {
        
        let initialValue: CGFloat = 0.0
        let offsetStep: CGFloat = itemHeight * index
        
        return floor(initialValue + offsetStep)
        
    }
    
}
