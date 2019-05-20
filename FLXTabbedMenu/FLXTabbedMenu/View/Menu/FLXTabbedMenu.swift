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
            
            print(model)
            print("")

        }

    }
    
    // MARK: Subviews
    
    private(set) var categoryContainer: FLXCategoryContainer = FLXCategoryContainer()
    private(set) var itemsContainers: [Int: FLXItemContainer] = [:]

    // MARK: Inbuilt gesture recognizer
    
    private let pressGestureRecognizer = FLXPressGestureRecognizer()

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
                bottomAnchor.constraint(equalTo: superview.safeAreaLayoutGuide.bottomAnchor),
                topAnchor.constraint(equalTo: superview.topAnchor),
                leadingAnchor.constraint(equalTo: superview.leadingAnchor),
                trailingAnchor.constraint(equalTo: superview.trailingAnchor),
                
                /// Category selectpr
                categoryContainer.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -inset.bottom - bottomPadding),
                categoryContainer.heightAnchor.constraint(equalToConstant: categorySelectorHeight),
                categoryContainer.leadingAnchor.constraint(equalTo: leadingAnchor, constant: inset.left),
                categoryContainer.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -inset.right)
                
            ])
        
        }
    
        super.didMoveToSuperview()

    }
    
    // MARK: - Private methods
    
    private func setUpView() {
        
        /// View properties
        isOpaque = false
        backgroundColor = .clear
        
        /// Initialises as hidden
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
        
            pressGestureRecognizer.addTarget(self, action: #selector(handler(press:)))
            addGestureRecognizer(pressGestureRecognizer)
            
        }
        
    }
    
    private func makeItemContainer(at index: Int) -> FLXItemContainer {
        
        let itemContainer = FLXItemContainer()
        
        itemContainer.translatesAutoresizingMaskIntoConstraints = false
        
        itemsContainers[index] = itemContainer
        
        addSubview(itemContainer)
        
        NSLayoutConstraint.activate([
            
            /// Item container
            itemContainer.topAnchor.constraint(equalTo: topAnchor),
            itemContainer.bottomAnchor.constraint(equalTo: categoryContainer.topAnchor),
            itemContainer.leadingAnchor.constraint(equalTo: categoryContainer.leadingAnchor),
            itemContainer.trailingAnchor.constraint(equalTo: categoryContainer.trailingAnchor)
            
        ])
        
        return itemContainer
        
    }
    
    // MARK: - Private gesture handler
    
    @objc private func handler(press: FLXPressGestureRecognizer) {
    
        let touchPoint = press.location(in: press.view)
        
        switch press.state {
            
            case .began:
            
                /// Check if newLocation is over any of the menu options
                guard let touchView: UIView = press.view!.hitTest(touchPoint, with: nil) else { return }
            
                if let categoryView = touchView as? FLXCategoryMenuItem  {
                    
                    guard let superview = touchView.superview as? FLXCategoryContainer else { return }
                    guard let index = superview.menuItems.firstIndex(of: categoryView) else { return }
                    
                    model = model?.model(forHighlightedCategory: index)
                    
                    
                } else if let itemView = touchView as? FLXMenuItem {
                    
                    guard let superview = touchView.superview as? FLXItemContainer else { return }
                    guard let index = superview.menuItems.firstIndex(of: itemView) else { return }
                    
                    model = model?.model(forHighlightedItem: index)
                    
                }
            
            case .changed:
                
                /// Check if newLocation is over any of the menu options
                guard let touchView: UIView = press.view!.hitTest(touchPoint, with: nil) else { return }
                
                if let categoryView = touchView as? FLXCategoryMenuItem  {
                    
                    guard let superview = touchView.superview as? FLXCategoryContainer else { return }
                    guard let index = superview.menuItems.firstIndex(of: categoryView) else { return }
                    
                    model = model?.model(forHighlightedCategory: index)
                    
                    
                } else if let itemView = touchView as? FLXMenuItem {
                    
                    guard let superview = touchView.superview as? FLXItemContainer else { return }
                    guard let index = superview.menuItems.firstIndex(of: itemView) else { return }
                    
                    model = model?.model(forHighlightedItem: index)
                    
                } else {
                    
                    model = model?.model(forHighlightedCategory: nil, item: nil)
                    
                }
            
            case .cancelled:
                
                model = model?.model(forHighlightedCategory: nil, item: nil)
            
            case .ended:
                
                guard let touchView: UIView = press.view!.hitTest(touchPoint, with: nil) else { return }
                
                if touchView is FLXCategoryMenuItem {
                    
                    print("ENDED CATEGORY")
                    
                    /// Select new  & unhighlight
                    
                    
                } else if touchView is FLXMenuItem {
                    
                    print("ENDED SUB CATEGORY")
                    
                    /// Select new & unhighlight
                    
                }
            
            default: print("Unhandled state")
            
        }
        
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
        
        /// If no  item view for the category, existing as a subview, build it
        if itemsContainers[index] == nil {
            
            let item = makeItemContainer(at: index)

            let itemViewModel = delegate.tabbedMenu(self, itemContainerViewModelAtIndex: index)
            
            item.update(withViewModel: itemViewModel)
            
        }
        
        /// New model with new state
        model = FLXTabbedMenuModel(selectedCategory: index, selectedItem: nil, highlightedCategory: nil, highlightedItem: nil)
        
        /// Show the view
        isHidden = false
        
        /// Present menu with an animation
        
    
    }
    
    public func hide() {
    
        /// Dismiss the menu with an animation
        
        
        isHidden = true
    
    }
    
    /// Getting menu item views
    public func categoryMenuItem(at index: Int) -> FLXMenuItemBase? {
    
        return nil
    
    }
    
    public func itemMenuItem(at indexPath: IndexPath) -> FLXMenuItemBase? {
    
        return nil
    
    }
    
    
    /// Highlighting / unhighlighting
    /**
     
        Only need to highlight when engaging from external gesture recognizer.
 
    */
    public func highlightCategory(at index: Int) {
    
        
    
    }
    
    public func highlightItem(at indexPath: IndexPath) {
    
        
    
    }
    
    /// Selecting / deselecting
    /**
     
        Only need to select when engaging from external gesture recognizer.
 
    */
    public func selectCategory(at index: Int) {
    
        
    
    }
    
    public func selectItem(at indexPath: IndexPath) {
    
        
    
    }

}
