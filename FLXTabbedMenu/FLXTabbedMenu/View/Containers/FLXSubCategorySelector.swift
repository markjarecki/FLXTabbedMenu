//
//  FLXSubCategorySelector.swift
//  FLXTabbedMenu
//
//  Created by Mark Jarecki on 18/5/19.
//  Copyright © 2019 Mark Jarecki. All rights reserved.
//

import UIKit

public class FLXSubCategorySelector: UIView {
    
    // MARK: - Properties
    
    // MARK: Subviews
    
    let categoryLabel = UILabel()

    // MARK: - Initialisers
    
    override public init(frame: CGRect) {

        super.init(frame: frame)
        
        setupView()
        setupConstraints()
    
    }
    
    required public init?(coder aDecoder: NSCoder) {
    
        fatalError("init(coder:) has not been implemented")
        
    }
    
    
    // MARK: - Internal methods

    internal func addItem(withImage: UIImage?, text: String) -> Void {
    
        /// Adds menu items to the view
    
    }
    
    // MARK: - Private methods
    
    private func setupView() {
    
        /// View properties
        isOpaque = false
        backgroundColor = .clear
        translatesAutoresizingMaskIntoConstraints = false
    
    }
    
    private func setupConstraints() {
    
        
    
    }

}
