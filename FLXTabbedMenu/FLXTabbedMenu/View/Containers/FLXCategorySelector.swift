//
//  FLXCategorySelector.swift
//  FLXTabbedMenu
//
//  Created by Mark Jarecki on 18/5/19.
//  Copyright © 2019 Mark Jarecki. All rights reserved.
//

import UIKit

public class FLXCategorySelector: UIView {

    // MARK: - Properties

    // MARK:  Overridable default properties
    
    public var _backgroundColor: UIColor = .white
    public var _cornerRadius: CGFloat = 10

    // MARK: - Initialisers
    
    override public init(frame: CGRect) {

        super.init(frame: frame)
        
        setupView()
    
    }
    
    required public init?(coder aDecoder: NSCoder) {
    
        fatalError("init(coder:) has not been implemented")
        
    }
    
    // MARK: - Override view lifecycle methods

    override open func layoutSubviews() {

        super.layoutSubviews()
        
        /// Layer properties
        layer.cornerRadius = _cornerRadius

    }
    
    // MARK: - Internal methods

    internal func addItem(withImage: UIImage?, text: String) -> Void {
    
        /// Adds menu items to the view
    
    }
    
    // MARK: - Private methods
    
    private func setupView() {
    
        /// View properties
        backgroundColor = _backgroundColor
    
    }

}
