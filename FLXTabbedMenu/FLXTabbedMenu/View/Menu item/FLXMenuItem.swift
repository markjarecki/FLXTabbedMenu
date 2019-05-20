//
//  FLXMenuItem.swift
//  FLXTabbedMenu
//
//  Created by Mark Jarecki on 19/5/19.
//  Copyright © 2019 Mark Jarecki. All rights reserved.
//

import UIKit

public class FLXMenuItem: FLXMenuItemBase {
    
    // MARK: - Properties
    
    var isSelected = false {
        
        didSet {
            
            /// Nothing 
            
        }
        
    }
    
    var isHighlighted = false {
        
        didSet {
            
            if isHighlighted {
                
                backgroundColor = .red
                
            } else {
                
                backgroundColor = .white
                
            }
            
        }
        
    }
    
    var cornerRadius: CGFloat = 10
    var corner: Corner = .roundBoth
    
    /// Layer
    let topBorder = CALayer()
    
    /// Enumeration
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
    
    // MARK: - Initialisers
    
    override init(frame: CGRect) {
        
        super.init(frame: frame)
        
        setupView()
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        
        fatalError("init(coder:) has not been implemented")
        
    }
    
    
    // MARK: - Override view lifecycle methods
    
    override public func layoutSubviews() {
        
        super.layoutSubviews()
        
        /// Corners
        layer.cornerRadius = cornerRadius
        layer.maskedCorners = corner.mask
        
        /// Round image masks
        image.layer.cornerRadius = image.frame.width / 2
        image.layer.maskedCorners = CACornerMask(arrayLiteral: [.layerMaxXMinYCorner, .layerMinXMinYCorner, .layerMaxXMaxYCorner, .layerMinXMaxYCorner])
        
        /// Border
        topBorder.frame = CGRect(x: 0, y: 0, width: bounds.width, height: 0.5)
        topBorder.backgroundColor = UIColor.init(white: 150/255, alpha: 1).cgColor

        /// Rasterise
        layer.rasterize()
        image.layer.rasterize()
        
    }
    
    // MARK: - Internal interface
    
    func corner(forIndex index: CGFloat, count: CGFloat) -> Corner {
        
        if count == 1 {
            
            return .roundBoth
            
        } else {
            
            /// Rendering top -> bottom
            switch index {
                
                case 0:
                    
                    topBorder.isHidden = true
                    
                    return .roundTop
                
                case count-1: return .roundBottom
                
                default:  return .noRound
                
            }
            
        }
        
    }
    
    // MARK: - Private methods
    
    private func setupView() {
        
        /// Self
        backgroundColor = .white
        
        /// Layers
        layer.addSublayer(topBorder)
        
        /// Subviews
        image.backgroundColor = .black
        label.font = UIFont.systemFont(ofSize: 18, weight: .medium)
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
            image.heightAnchor.constraint(equalTo: heightAnchor, constant: -12),
            image.widthAnchor.constraint(equalTo: heightAnchor, constant: -12),
            image.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 24),
            image.centerYAnchor.constraint(equalTo: centerYAnchor),
            
            /// Label
            label.heightAnchor.constraint(equalTo: heightAnchor),
            label.widthAnchor.constraint(equalTo: widthAnchor),
            label.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 90),
            label.centerYAnchor.constraint(equalTo: centerYAnchor)
            
        ])
        
    }
    
}

