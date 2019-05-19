//
//  FLXSubCategoryMenuItem.swift
//  FLXTabbedMenu
//
//  Created by Mark Jarecki on 19/5/19.
//  Copyright © 2019 Mark Jarecki. All rights reserved.
//

import UIKit

class FLXSubCategoryMenuItem: FLXTabbedMenuItem {
    
    // MARK: - Properties
    
    var _cornerRadius: CGFloat = 10
    var corner: Corner = .roundBoth
    
    enum Corner {
        
        case roundTop
        case roundBottom
        case roundBoth
        case noRound

        var mask: CACornerMask {
            
            switch self {
                
                case .noRound: return CACornerMask(arrayLiteral: [])
                case .roundTop: return  CACornerMask(arrayLiteral: [.layerMaxXMinYCorner, .layerMinXMinYCorner])
                case .roundBottom: return  CACornerMask(arrayLiteral: [.layerMinXMaxYCorner, .layerMaxXMaxYCorner])
                case .roundBoth: return  CACornerMask(arrayLiteral: [.layerMaxXMinYCorner, .layerMinXMinYCorner, .layerMaxXMaxYCorner, .layerMinXMaxYCorner])
                
            }
            
        }
        
    }
    
    // MARK: - Override view lifecycle methods
    
    override open func layoutSubviews() {
        
        super.layoutSubviews()
        
        /// Layer properties
        
        /// Make it round
        layer.cornerRadius = _cornerRadius
        layer.maskedCorners = corner.mask        
        
        layer.rasterize()
        
    }
    
}

