//
//  FLXMenuItemBase.swift
//  FLXTabbedMenu
//
//  Created by Mark Jarecki on 18/5/19.
//  Copyright © 2019 Mark Jarecki. All rights reserved.
//

import UIKit

public class FLXMenuItemBase: UIView {

    // MARK: - Properties
    
    // MARK: Subviews
    
    public let label = UILabel()
    public let image = UIImageView()
    
    // MARK: Mutable
    
    public var highlighted: Bool = false
    public var selected: Bool = false
    
}
