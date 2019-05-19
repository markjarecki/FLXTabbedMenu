//
//  CALayer+Extensions.swift
//  FLXTabbedMenu
//
//  Created by Mark Jarecki on 19/5/19.
//  Copyright © 2019 Mark Jarecki. All rights reserved.
//

import Foundation

public extension CALayer {
    
    func rasterize() {
        
        shouldRasterize = true
        rasterizationScale = UIScreen.main.scale
        
    }
    
}
