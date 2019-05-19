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
    
    private(set) var categoryContainer: FLXCategoryContainer = FLXCategoryContainer()
    private(set) var subCategoryContainers: [Int: FLXSubCategoryContainer] = [:]

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
                heightAnchor.constraint(equalTo: categoryContainer.heightAnchor),
                leadingAnchor.constraint(equalTo: superview.safeAreaLayoutGuide.leadingAnchor, constant: inset.left),
                trailingAnchor.constraint(equalTo: superview.safeAreaLayoutGuide.trailingAnchor, constant: -inset.right),
                
                /// Category selectpr
                categoryContainer.bottomAnchor.constraint(equalTo: bottomAnchor),
                categoryContainer.heightAnchor.constraint(equalToConstant: categorySelectorHeight),
                categoryContainer.leadingAnchor.constraint(equalTo: leadingAnchor),
                categoryContainer.trailingAnchor.constraint(equalTo: trailingAnchor)
                
            ])
        
        }
    
        super.didMoveToSuperview()

    }
    
    // MARK: - Private methods
    
    private func setUpView() {
        
        /// View properties
        isOpaque = false
        backgroundColor = .clear
        
        /// Initialises hidden
        isHidden = true

        /// Constraints
        translatesAutoresizingMaskIntoConstraints = false
        categoryContainer.translatesAutoresizingMaskIntoConstraints = false

        /// Subviews
        addSubview(categoryContainer)
        
    }
    
    private func setUpGestures() {
        
        /// Add built-in press gesture recognizer if override flag has not been set
        if useBuiltinGestures {
        
            addGestureRecognizer(pressGestureRecognizer)
            
        }
        
    }
    
    private func makeSubCategory(for index: Int) -> FLXSubCategoryContainer {
        
        let subCategory = FLXSubCategoryContainer()
        
        
        
        addSubview(subCategory)
        
        return subCategory
        
    }
    
    // MARK: - Private gesture handler
    
    @objc private func handler(press: FLXPressGestureRecognizer) {
    
        print("PRESSED")
    
    }
    
}

// MARK: - Public methods

extension FLXTabbedMenu {
    
    /// Show / hide
    public func show(withSelectedCategoryIndex index: Int) {
        
        guard let delegate = delegate else { return }
        
        /// If no model, menu was never initialised, build the menu
        if model == nil {
            
            let categoryViewModels = delegate.categoryViewModels(forTabbedMenu: self)
            
            categoryContainer.update(withViewModels: categoryViewModels)

        }
        
        /// If no  subcategory view for the category, existing as a subview, build it
        if subCategoryContainers[index] == nil {
            
            let subCategory = makeSubCategory(for: index)

            let subCategoryViewModel = delegate.tabbedMenu(self, subCategoryViewModelAtIndex: index)
            
            subCategory.update(withViewModel: subCategoryViewModel)
            
        }
        
        /// New model with new state
        model = FLXTabbedMenuModel(selectedCategory: index, selectedSubCategory: nil, highlightedCategory: nil, highlightedSubCategory: nil)
        
        /// Show the view
        isHidden = false
        
        /// Present menu with an animation
        
    
    }
    
    public func hide() {
    
        /// Dismiss the menu with an animation
    
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
