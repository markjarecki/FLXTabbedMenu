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
    
    private var model: FLXTabbedMenuModel? {

        didSet {

            /// Notify delegate of diff

        }

    }
    
    // MARK: Subviews
    
    public private(set) var categorySelector: FLXCategorySelector = FLXCategorySelector()
//    public private(set) var subCategorySelector: UIView = UIView()
    
    // MARK: Inbuilt gesture recognizer
    
    lazy private var pressGestureRecognizer: FLXPressGestureRecognizer = { [unowned self] in
        
        return FLXPressGestureRecognizer(target: self, action: #selector(self.handler(press:)))
    
    }()
    
    // MARK: Overridable default properties
    
    public var useBuiltinGestures: Bool = true
    
    // MARK: Visual properties
    
    /// Dimensions
    public var categorySelectorHeight: CGFloat = 74
    
    /// Spacing
    public var inset: UIEdgeInsets = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
    public var bottomPadding: CGFloat = 48

    // MARK: - Initialisers
    
    public init() {
        
        super.init(frame: .zero)
        
        setUpView()
        setUpGestures()
    
    }
    
    required public init?(coder aDecoder: NSCoder) {
    
        fatalError("init(coder:) has not been implemented")
        
    }
    
    // MARK: - Overrides

    override open func didMoveToSuperview() {
    
        /// Set up constraints when view is added to superview, otherwise invalid safeAreaLayoutGuide
        if let superview = self.superview {
        
            NSLayoutConstraint.activate([
        
                /// Self
                bottomAnchor.constraint(equalTo: superview.safeAreaLayoutGuide.bottomAnchor, constant: -inset.bottom - bottomPadding),
                heightAnchor.constraint(equalTo: categorySelector.heightAnchor),
                leadingAnchor.constraint(equalTo: superview.safeAreaLayoutGuide.leadingAnchor, constant: inset.left),
                trailingAnchor.constraint(equalTo: superview.safeAreaLayoutGuide.trailingAnchor, constant: -inset.right),
                
                /// Category selectpr
                categorySelector.bottomAnchor.constraint(equalTo: bottomAnchor),
                categorySelector.heightAnchor.constraint(equalToConstant: categorySelectorHeight),
                categorySelector.leadingAnchor.constraint(equalTo: leadingAnchor),
                categorySelector.trailingAnchor.constraint(equalTo: trailingAnchor)
                
            ])
        
        }
    
        super.didMoveToSuperview()

    }
    
    // MARK: - Private methods
    
    private func setUpView() {
        
        /// View properties
//        isOpaque = false
//        backgroundColor = .clear
        backgroundColor = .red

        /// Constraints
        translatesAutoresizingMaskIntoConstraints = false
        categorySelector.translatesAutoresizingMaskIntoConstraints = false
//        subCategorySelector.translatesAutoresizingMaskIntoConstraints = false

        /// Subviews
        addSubview(categorySelector)
//        addSubview(subCategorySelector)
        
    }
    
//    private func setUpConstraints() {
//
//
//
//    }
    
    private func setUpGestures() {
        
        /// Add built-in press gesture recognizer if override flag has not been set
        if useBuiltinGestures {
        
            self.addGestureRecognizer(pressGestureRecognizer)
            
        }
        
    }
    
//    private func setUpMenu() {
//
//        print(delegate)
//
//        guard let numberOfCategories = delegate?.numberOfCategories(in: self) else { return }
//
//        print(numberOfCategories)
//
//
//    }
    
    // MARK: - Private gesture handler
    
    @objc private func handler(press: FLXPressGestureRecognizer) {
    
        print("PRESSED")
    
    }
    
}

// MARK: - Public methods

extension FLXTabbedMenu {
    
    /// Show / hide
    public func show(withSelectedCategoryIndex index: Int) {
    
        
    
    }
    
    public func hide() {
    
        
    
    }
    
    /// Getting menu item views
    public func categoryMenuItem(at index: Int) -> FLXTabbedMenuItem? {
    
        return nil
    
    }
    
    public func subCategoryMenuItem(at indexPath: IndexPath) -> FLXTabbedMenuItem? {
    
        return nil
    
    }
    
    
    /// Highlighting / unhighlighting
    /**
     
        Only need to highlight when engaging from external gesture recognizer.
 
    */
    public func highlightCategory(at index: Int) {
    
        
    
    }
    
    public func highlightSubCategory(at indexPath: IndexPath) {
    
        
    
    }
    
    /// Selecting / deselecting
    /**
     
        Only need to select when engaging from external gesture recognizer.
 
    */
    public func selectCategory(at index: Int) {
    
        
    
    }
    
    public func selectSubCategory(at indexPath: IndexPath) {
    
        
    
    }

}
