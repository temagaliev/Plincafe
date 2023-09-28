//
//  DSTabBarItem.swift
//  Romance Kingdom
//
//  Created by e.nesterov on 25.11.2022.
//

import UIKit

final class DSTabBarItem: UIView {
    
    // MARK: - Lifecycle
    init(itemIndex: Int, icon: UIImage?, text: String) {
        self.isSelected = false
        self.itemIndex = itemIndex
        
        super.init(frame: .zero)
        
        self.iconView.image = icon
        self.textLabel.text = text
        
        setupStyle()
    }
    
    override init(frame:CGRect) {
        self.isSelected = false
        super.init(frame:frame)
        setupStyle()
    }
    
    required init?(coder aDecoder: NSCoder) {
        self.isSelected = false
        super.init(coder: aDecoder)
        setupStyle()
    }
    
    
    // MARK: - Public Properties
    var isSelected: Bool {
        didSet {
            setupSelectedState()
        }
    }
    
    var actionHandler: GenericCompletion<Int>?
    
    
    // MARK: - Private Properties
    private (set) var itemIndex: Int = 0
    
    private lazy var selectorView: UIView = {
        let view = UIImageView()
        return view
    }()
    
    private lazy var selectButton: UIButton = {
        let view = UIButton()
        return view
    }()
    
    private lazy var backgroundView: UIView = {
        let view = UIImageView()
        backgroundColor = DesignSystemColors.tabBarItem_defaultBackgroundColor
        return view
    }()
    
    private lazy var iconView: UIImageView = {
        let view = UIImageView()
        view.contentMode = .scaleAspectFit
        view.clipsToBounds = true
        return view
    }()
    
    lazy var textLabel: UILabel = {
        let view = UILabel()
        view.textAlignment = .center
        view.font = UIFont.systemFont(ofSize: 14, weight: .semibold)
        view.minimumScaleFactor = 0.3
        view.adjustsFontSizeToFitWidth = true
        return view
    }()
    
    @objc private func onButtonClick() {
        if let actionHandler = actionHandler {
            actionHandler(itemIndex)
        }
    }
    
    private func setupStyle() {
        selectButton.addTarget(self, action: #selector(onButtonClick), for: .touchUpInside)
        
        addSubview(selectorView)
        addSubview(backgroundView)
        backgroundView.addSubview(iconView)
        backgroundView.addSubview(textLabel)
        addSubview(selectButton)
        
        selectorView.activateAnchors()
        backgroundView.activateAnchors()
        iconView.activateAnchors()
        textLabel.activateAnchors()
        selectButton.activateAnchors()
        
        selectorView.heightAnchor(constant: 5)
        selectorView.leadingAnchor(to: leadingAnchor)
        selectorView.trailingAnchor(to: trailingAnchor)
        selectorView.topAnchor(to: topAnchor)
        
        backgroundView.topAnchor(to: selectorView.bottomAnchor)
        backgroundView.leadingAnchor(to: leadingAnchor)
        backgroundView.trailingAnchor(to: trailingAnchor)
        backgroundView.bottomAnchor(to: bottomAnchor)
        
        textLabel.topAnchor(to: iconView.bottomAnchor, constant: 4)
        textLabel.leadingAnchor(to: backgroundView.leadingAnchor, constant: 12)
        textLabel.trailingAnchor(to: backgroundView.trailingAnchor, constant: -12)
        textLabel.bottomAnchor(to: backgroundView.bottomAnchor, constant: -8)
        
        iconView.widthAnchor(constant: 30)
        iconView.heightAnchor(constant: 30)
        iconView.centerXAnchor(to: centerXAnchor)
        //iconView.topAnchor(to: backgroundView.topAnchor)
        
        selectButton.equalToSuperview()
        
        setupSelectedState()
    }
    
    private func setupSelectedState() {
        if isSelected {
            textLabel.textColor = DesignSystemColors.tabBarItem_selectedTitleColor
            iconView.tintColor = DesignSystemColors.tabBarItem_selectedIconColor
            selectorView.backgroundColor = DesignSystemColors.tabBarItem_selectedSelectorColor
            selectorView.applyShadow(color: DesignSystemColors.tabBarItem_selectedSelectorColor)
            iconView.applyShadow(color: DesignSystemColors.tabBarItem_selectedSelectorColor)
            textLabel.applyShadow(color: DesignSystemColors.tabBarItem_selectedSelectorColor)
        } else {
            textLabel.textColor = DesignSystemColors.tabBarItem_defaultTitleColor
            iconView.tintColor = DesignSystemColors.tabBarItem_defaultIconColor
            selectorView.backgroundColor = DesignSystemColors.tabBarItem_defaultSelectorColor
            selectorView.applyShadow(color: .clear)
            iconView.applyShadow(color: .clear)
            textLabel.applyShadow(color: .clear)
        }
    }
}

