//
//  FLXCategoryContainer.swift
//  FLXTabbedMenu
//
//  Created by Mark Jarecki on 18/5/19.
//  Copyright © 2019 Mark Jarecki. All rights reserved.
//

import UIKit

public typealias CategoryViewModel = (category: String, image: UIImage?)

class FLXCategoryContainer: UIView {

    // MARK: - Properties

    // MARK:  Overridable default properties
    
    var cornerRadius: CGFloat = 10
    var padding: CGFloat = 12
    
    // MARK: Subviews
    
    var menuItems: [FLXCategoryMenuItem] = []

    // MARK: - Initialisers
    
    override init(frame: CGRect) {

        super.init(frame: frame)
        
        setupView()
    
    }
    
    required init?(coder aDecoder: NSCoder) {
    
        fatalError("init(coder:) has not been implemented")
        
    }
    
    // MARK: - Override view lifecycle methods

    override func layoutSubviews() {

        super.layoutSubviews()
        
        /// Layer properties
        layer.cornerRadius = cornerRadius
        layer.rasterize()

    }
    
    // MARK: - Internal inteface
    
    func update(withViewModels viewModels: [CategoryViewModel]) {
        
        let count = CGFloat(viewModels.count)
        
        for viewModel in viewModels.enumerated() {
            
            let menuItem = makeMenuItem(withViewModel: viewModel.element)
            menuItems.append(menuItem)
            
            addSubview(menuItem)
            
            let containerWidth: CGFloat = bounds.width
            let index = CGFloat(viewModel.offset)
            
            let centerXOffset = centerXOffest(forIndex: index, count: count, containerWidth: containerWidth, containerPadding: padding)
            
            /// Layout menu item
            NSLayoutConstraint.activate([
                
                /// Menu item
                menuItem.heightAnchor.constraint(equalTo: heightAnchor, constant: -padding * 2),
                menuItem.widthAnchor.constraint(equalTo: menuItem.heightAnchor),
                menuItem.centerXAnchor.constraint(equalTo: leadingAnchor, constant: centerXOffset),
                menuItem.centerYAnchor.constraint(equalTo: centerYAnchor)
                
            ])
            
        }
    
    }
    
    // MARK: - Private methods
    
    private func setupView() {
    
        /// View properties
        backgroundColor = .white
    
    }
    
    private func makeMenuItem(withViewModel viewModel: CategoryViewModel) -> FLXCategoryMenuItem {
    
        let menuItem = FLXCategoryMenuItem()
        
        /// Menu item
        menuItem.backgroundColor = .black
        
        /// Label
        menuItem.label.text = viewModel.category
        
        /// LABELS NOT BEING USED IN THIS DESIGN
        menuItem.label.isHidden = true
        
        /// Image
        menuItem.image.image = viewModel.image
        
        /// Constraints
        menuItem.translatesAutoresizingMaskIntoConstraints = false
    
        return menuItem
    
    }
    
    private func centerXOffest(forIndex index: CGFloat, count: CGFloat, containerWidth: CGFloat, containerPadding: CGFloat) -> CGFloat {
        
        let widthMinusPadding = containerWidth - (containerPadding * 2)
        let sectionWidth = widthMinusPadding / count
        let initialValue = (sectionWidth / 2) + containerPadding
        let offsetStep = sectionWidth * index

        return floor(initialValue + offsetStep)
        
    }

}
