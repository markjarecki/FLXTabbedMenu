//
//  FLXCategoryMenuItem.swift
//  FLXTabbedMenu
//
//  Created by Mark Jarecki on 19/5/19.
//  Copyright © 2019 Mark Jarecki. All rights reserved.
//

import UIKit

class FLXCategoryMenuItem: FLXTabbedMenuItem {
    
    // MARK: - Override view lifecycle methods
    
    override open func layoutSubviews() {
        
        super.layoutSubviews()
        
        /// Layer properties
        
        /// Make it round
        layer.cornerRadius = frame.height / 2
        layer.rasterize()
        
    }
    
}

