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
        
        /// Exit state actions
        willSet(newModel) {
            
            /// Model exists
            guard let model = model, let newModel = newModel else { return }
            
            /// Deselect and unhighlight if different
            
            /// Category deselect
            if model.selectedCategory != newModel.selectedCategory {
                
                let item = categoryMenuItem(at: model.selectedCategory)
                
                item.isSelected = false
                
            }
            
            /// Item deselect
            if model.selectedItem != newModel.selectedItem, model.selectedItem != nil {
                
                let item = itemMenu(at: model.selectedItem!)
                
                item?.isSelected = false
                
            }
            
            /// Category unhighlight
            if model.highlightedCategory != newModel.highlightedCategory, model.highlightedCategory != nil {
                
                let item = categoryMenuItem(at: model.selectedCategory)
                
                item.isHighlighted = false
                
            }
            
            /// Item unhighlight
            if model.highlightedItem != newModel.highlightedItem, model.highlightedItem != nil {
                
                let item = itemMenu(at: model.highlightedItem!)
                
                item?.isHighlighted = false
                
            }
            
        }

        /// Entry state actions
        didSet {

            /// Model exists
            guard let model = model else { return }
            
            if oldValue == nil {
                
                let item = categoryMenuItem(at: model.selectedCategory)
                
                item.isSelected = true
                
            } else {
                
                /// Select and highlight  if different
                
                /// Category select
                if model.selectedCategory != oldValue!.selectedCategory {
                    
                    let item = categoryMenuItem(at: model.selectedCategory)
                    
                    item.isSelected = true
                    
                    show(itemContainerToCategoryIndex: model.selectedCategory, fromIndex: oldValue!.selectedCategory)
                    
                }
                
                /// Item select
                if model.selectedItem != oldValue!.selectedItem, model.selectedItem != nil {
                    
                    let item = itemMenu(at: model.selectedItem!)
                    
                    item?.isSelected = true
                    
                    delegate?.tabbedMenu(self, didSelectItemAtIndexPath: model.selectedItem! )
                    
                }
                
                /// Category highlight
                if model.selectedCategory != oldValue!.selectedCategory, model.highlightedCategory != nil {
                    
                    let item = categoryMenuItem(at: model.selectedCategory)
                    
                    item.isHighlighted = true
                    
                }
                
                /// Item highlight
                if model.highlightedItem != oldValue!.highlightedItem, model.highlightedItem != nil {
                    
                    let item = itemMenu(at: model.highlightedItem!)
                    
                    item?.isHighlighted = true
                    
                }
                
            }

        }

    }
    
    // MARK: Subviews
    
    private(set) var categoryContainer: FLXCategoryContainer = FLXCategoryContainer()
    private(set) var itemsContainers: [Int: FLXItemContainer] = [:]
    private lazy var blurView = UIVisualEffectView(effect: UIBlurEffect(style: .dark))

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
                categoryContainer.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -inset.right),
                
                /// Blur view
                blurView.topAnchor.constraint(equalTo: topAnchor),
                blurView.bottomAnchor.constraint(equalTo: bottomAnchor),
                blurView.leadingAnchor.constraint(equalTo: leadingAnchor),
                blurView.trailingAnchor.constraint(equalTo: trailingAnchor)
                
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
        blurView.translatesAutoresizingMaskIntoConstraints = false
        categoryContainer.translatesAutoresizingMaskIntoConstraints = false

        /// Subviews
        addSubview(blurView)
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
    
    private func show(itemContainerToCategoryIndex index: Int, fromIndex: Int) {
        
        guard let delegate = delegate else { return }
        
        /// If no  item view for the category, existing as a subview, build it
        if itemsContainers[index] == nil {
            
            let item = makeItemContainer(at: index)
            
            let itemViewModel = delegate.tabbedMenu(self, itemContainerViewModelAtIndex: index)
            
            item.update(withViewModel: itemViewModel)
            
            item.isHidden = true
            
        }
      
        guard let fromItem = itemsContainers[fromIndex] else { return }
        guard let toItem = itemsContainers[index] else { return }
        
        fromItem.isHidden = true
        toItem.isHidden = false
        
        /// Present menu with an animation
        #warning("Present menu with animation")
        
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
                    
                    model = model?.model(forHighlightedItem: IndexPath(item: index, section: model!.selectedCategory))
                    
                }
            
            case .changed:
                
                /// Check if newLocation is over any of the menu options
                guard let touchView: UIView = press.view!.hitTest(touchPoint, with: nil) else { return }
                
                if let categoryView = touchView as? FLXCategoryMenuItem {
                    
                    guard let superview = touchView.superview as? FLXCategoryContainer else { return }
                    guard let index = superview.menuItems.firstIndex(of: categoryView) else { return }
                    
//                    model = model?.model(forHighlightedCategory: index)
                    model = model?.model(forSelectedCategory: index)

                    
                } else if let itemView = touchView as? FLXMenuItem {
                    
                    guard let superview = touchView.superview as? FLXItemContainer else { return }
                    guard let index = superview.menuItems.firstIndex(of: itemView) else { return }
                    
                    model = model?.model(forHighlightedItem: IndexPath(item: index, section: model!.selectedCategory))
                    
                } else {
                    
                    model = model?.model(forHighlightedCategory: nil, item: nil)
                    
                }
            
            case .cancelled:
                
                model = model?.model(forHighlightedCategory: nil, item: nil)
            
            case .ended:
                
                guard let touchView: UIView = press.view!.hitTest(touchPoint, with: nil) else { return }
                
                if let categoryView = touchView as? FLXCategoryMenuItem {
                    
                    /// Select new  & unhighlight
                    guard let superview = touchView.superview as? FLXCategoryContainer else { return }
                    guard let index = superview.menuItems.firstIndex(of: categoryView) else { return }
                    
                    model = model?.model(forSelectedCategory: index)
                    
                    
                } else if let itemView = touchView as? FLXMenuItem {
                    
                    /// Select new & unhighlight
                    guard let superview = touchView.superview as? FLXItemContainer else { return }
                    guard let index = superview.menuItems.firstIndex(of: itemView) else { return }
                    
                    model = model?.model(forSelectedItem: IndexPath(item: index, section: model!.selectedCategory))
                    
                } else {
                    
                    if touchView is FLXCategoryContainer { return }
            
                    dismiss()
                    
                }
            
            default: print("Unhandled state")
            
        }
        
    }
    
}

// MARK: - Public methods

extension FLXTabbedMenu {
    
    /// Present / dismiss
    public func present(withSelectedCategoryIndex index: Int, andItemIndex itemIndex: Int?) {
        
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
        
        if itemIndex != nil {
            
             model = FLXTabbedMenuModel(selectedCategory: index, selectedItem: nil, highlightedCategory: nil, highlightedItem: IndexPath(item: itemIndex!, section: index))
            
        } else {
            
             model = FLXTabbedMenuModel(selectedCategory: index, selectedItem: nil, highlightedCategory: nil, highlightedItem: nil)
            
        }
        
        /// Unhide the view
        isHidden = false
        
        /// Present menu with an animation
        #warning("Present menu with animation")
    
    }
    
    public func dismiss() {
    
        /// Dismiss the menu with an animation
        
        /// Reset highlighted states
        model = model!.model(forHighlightedCategory: nil, item: nil)
        
        isHidden = true
        
        delegate?.didDismiss(self)
    
    }
    
    /// Getting menu item views
    public func categoryMenuItem(at index: Int) -> FLXCategoryMenuItem {
        
        return categoryContainer.menuItems[index]
    
    }
    
    public func itemMenu(at indexPath: IndexPath) -> FLXMenuItem? {
        
        return itemsContainers[indexPath.section]?.menuItems[indexPath.item]
    
    }

}
