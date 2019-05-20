//
//  FLXCategoryMenuItem.swift
//  FLXTabbedMenu
//
//  Created by Mark Jarecki on 19/5/19.
//  Copyright © 2019 Mark Jarecki. All rights reserved.
//

import UIKit

public class FLXCategoryMenuItem: FLXMenuItemBase {
    
    var isSelected = false {
        
        didSet {
            
            if isSelected {
                
                backgroundColor = .red
                
            } else {
                
                backgroundColor = .black
                
            }
            
        }
        
    }
    
    var isHighlighted = false {
        
        didSet {
            
             /// Nothing 
            
        }
        
    }
    
    // MARK: - Initialisers
    
    override init(frame: CGRect) {
        
        super.init(frame: frame)
        
        setupView()
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        
        fatalError("init(coder:) has not been implemented")
        
    }
    
    // MARK: - Private methods
    
    private func setupView() {
        
        /// LABELS NOT BEING USED IN THIS DESIGN
        label.font = UIFont.systemFont(ofSize: 11, weight: .bold)
        label.textColor = .black
        
        /// Add subviews
        addSubview(label)
        addSubview(image)
        
        /// Constraints
        label.translatesAutoresizingMaskIntoConstraints = false
        image.translatesAutoresizingMaskIntoConstraints = false
        
        /// Update the constraints
        NSLayoutConstraint.activate([
            
            /// Image
            image.heightAnchor.constraint(equalTo: heightAnchor),
            image.widthAnchor.constraint(equalTo: heightAnchor),
            image.centerXAnchor.constraint(equalTo: centerXAnchor),
            image.centerYAnchor.constraint(equalTo: centerYAnchor)
            
        ])
        
    }
    
    // MARK: - Override view lifecycle methods
    
    override public func layoutSubviews() {
        
        super.layoutSubviews()
        
        /// Layer properties
        
        /// Make it round
        layer.cornerRadius = frame.height / 2
        layer.rasterize()
        
    }
    
}

