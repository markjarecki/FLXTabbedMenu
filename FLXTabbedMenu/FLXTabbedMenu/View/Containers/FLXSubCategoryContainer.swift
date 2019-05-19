//
//  FLXSubCategoryContainer.swift
//  FLXTabbedMenu
//
//  Created by Mark Jarecki on 18/5/19.
//  Copyright © 2019 Mark Jarecki. All rights reserved.
//

import UIKit

public typealias SubCategoryViewModel = (category: String, subCategories: [ CategoryViewModel ])

class FLXSubCategoryContainer: UIView {
    
    // MARK: - Properties
    
    // MARK:  Overridable default properties
    
    var _backgroundColor: UIColor = .green
    var _padding: CGFloat = 12
    
    // MARK: Subviews
    
    let label = UILabel()
    var menuItems: [FLXCategoryMenuItem] = []

    // MARK: - Initialisers
    
    override init(frame: CGRect) {

        super.init(frame: frame)
        
        setupView()
    
    }
    
    required init?(coder aDecoder: NSCoder) {
    
        fatalError("init(coder:) has not been implemented")
        
    }
    
    // MARK: - Internal interface

    func update(withViewModel viewModel: SubCategoryViewModel) {
        
        label.text = viewModel.category
        
//        let count = CGFloat(viewModels.count)
//
//        for viewModel in viewModels.enumerated() {
//
//            let menuItem = makeCategoryItem(withViewModel: viewModel.element)
//
//            addSubview(menuItem)
//
//            let containerWidth: CGFloat = bounds.width
//            let index = CGFloat(viewModel.offset)
//
//            let centerXOffset = centerXOffest(forIndex: index, count: count, containerWidth: containerWidth, containerPadding: _padding)
//
            /// Update the constraints
            NSLayoutConstraint.activate([

//                menuItem.heightAnchor.constraint(equalTo: heightAnchor, constant: -(_padding*2)),
//                menuItem.widthAnchor.constraint(equalTo: menuItem.heightAnchor),
//                menuItem.centerXAnchor.constraint(equalTo: leadingAnchor, constant: centerXOffset),
//                menuItem.centerYAnchor.constraint(equalTo: centerYAnchor)

            ])
//
//        }
        
    }
    
    // MARK: - Private methods
    
    private func setupView() {
        
        /// View properties
        backgroundColor = _backgroundColor
        
        /// Constraints
        translatesAutoresizingMaskIntoConstraints = false
        label.translatesAutoresizingMaskIntoConstraints = false
        
        /// Label
        label.font = UIFont.systemFont(ofSize: 32, weight: .bold)
        label.textColor = .white
        
        /// Subviews
        addSubview(label)
        
    }

}
