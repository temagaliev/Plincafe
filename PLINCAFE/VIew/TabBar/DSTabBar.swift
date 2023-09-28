//
//  DSTabBar.swift
//  Romance Kingdom
//
//  Created by e.nesterov on 25.11.2022.
//

import UIKit

typealias GenericCompletion<T> = ((T) -> Void)

final class DSTabBar: UIStackView {
    // MARK: - Lifecycle
    init(items: [DSTabBarItem]) {
        self.items = items
        super.init(frame: .zero)
        
        for item in items {
            item.actionHandler = { [weak self] itemIndex in
                self?.onItemSelected(itemIndex)
            }
            self.addArrangedSubview(item)
        }
        
        setupStyle()
    }
    
    override init(frame:CGRect) {
        super.init(frame:frame)
        setupStyle()
    }
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupStyle()
    }
    
    
    // MARK: - Public Properties
    var tabBarSelectionHandler: GenericCompletion<Int>?
    private (set) var selectedIndex: Int = -1
    
    func setSelectedTab(_ tabIndex: Int) {
        if (0...items.count).contains(tabIndex) {
            selectedIndex = tabIndex
            for item in items {
                item.isSelected = item.itemIndex == tabIndex
            }
        }
    }
    
    
    // MARK: - Private Properties
    private var items: [DSTabBarItem] = []
    
    private func onItemSelected(_ itemIndex: Int) {
        selectedIndex = itemIndex
        for item in items {
            item.isSelected = item.itemIndex == itemIndex
        }
        
        if let tabBarSelectionHandler = tabBarSelectionHandler {
            tabBarSelectionHandler(itemIndex)
        }
    }
    
    private func setupStyle() {
        axis = .horizontal
        alignment = .fill
        contentMode = .left
        distribution = .fillEqually
        backgroundColor = .clear
    }
    
}
