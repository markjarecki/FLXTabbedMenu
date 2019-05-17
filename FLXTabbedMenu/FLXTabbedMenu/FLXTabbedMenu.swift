//
//  FLXTabbedMenu.swift
//  FLXTabbedMenu
//
//  Created by Mark Jarecki on 17/5/19.
//  Copyright © 2019 Mark Jarecki. All rights reserved.
//

import UIKit

open class FLXTabbedMenu: UIView {

    // MARK: - Properties
    
    // MARK: Architecture
    
    weak public var delegate: FLXTabbedMenuDelegate?
    
    // MARK: Model
    
    public let model: FLXTabbedMenuModelType
    
    // MARK: Index paths
    
    internal(set) public var indexPath: FLXTabbedMenuIndexPath? {
    
        didSet {
        
            /// Notify delegate of diff
        
        }
    
    }
    
    // MARK: Subviews
    
    public var mainCategorySelector: UIView = UIView()
    public var subCategoryList: UIView = UIView()
    
    // MARK: Inbuilt gesture recognizer
    
    lazy var pressGestureRecognizer: FLXPressGestureRecognizer = { [unowned self] in
        
        return FLXPressGestureRecognizer(target: self, action: #selector(self.handler(press:)))
    
    }()
    
    // MARK: Overridable default properties
    
    public var useBuiltinGestures: Bool = true
    
    /// Main category
    public var mainCategoryLargeLabelFontColour: UIColor = .black
    public var mainCategoryBackgroundFontSize: CGFloat = 32
    public var mainCategoryBackgroundColour: UIColor = .white
    public var mainCategoryBorderWidth: CGFloat = 1
    public var mainCategoryBorderColour: UIColor = UIColor(white: 150, alpha: 1)
    public var mainCategoryBackgroundCornerRadius: CGFloat = 10
    
    /// Sub category
    public var subCategoryLargeLabelFontColour: UIColor = .black
    public var subCategoryLargeLabelFontSize: CGFloat = 18
    public var subCategoryBackgroundColour: UIColor = .white
    public var subCategorySelectedBackgroundColour: UIColor = UIColor(white: 195, alpha: 1)
    public var subCategoryBorderWidth: CGFloat = 1
    public var subCategoryBorderColour: UIColor = UIColor(white: 150, alpha: 1)
    public var subCategoryBackgroundCornerRadius: CGFloat = 10

    
    // MARK: - Initialisers
    
    public init(model: FLXTabbedMenuModelType) {
    
        self.model = model
        
        super.init(frame: .zero)
        
        setUpView()
        setUpGestures()
    
    }
    
    required public init?(coder aDecoder: NSCoder) {
    
        fatalError("init(coder:) has not been implemented")
        
    }
    
    // MARK: - Override view lifecycle methods
    
    
    
    // MARK: - Public methods
    
    /// Highlighting / unhighlighting
    
    /**
     
        Only need to highlight when engaging from Gesture recognizer.
 
    */
    
    public func highlightMainCategory(withId id: String) {
    
        
    
    }
    
    public func highlightSubCategory(withId id: String) {
    
        
    
    }
    
    /// Selecting / deselecting
    
    /**
     
        Only need to select when engaging from Gesture recognizer.
 
    */
    
    public func selectMainCategory(withId id: String) {
    
        
    
    }
    
    public func selectSubCategory(withId id: String) {
    
        
    
    }
    
//    public func viewForItem(at indexPath: FLXTabbedMenuIndexPath) -> UIView {
//
//        return UIView()
//
//    }
    
    // MARK: - Private methods
    
    private func setUpView() {
        
        isOpaque = false
        backgroundColor = .clear
        alpha = 0
        
    }
    
    private func setUpGestures() {
        
        if useBuiltinGestures {
        
            self.addGestureRecognizer(pressGestureRecognizer)
            
        }
        
    }
    
     // MARK: - Private gesture handler
    
    @objc private func handler(press: FLXPressGestureRecognizer) {
    
    
    
    }
    
}
