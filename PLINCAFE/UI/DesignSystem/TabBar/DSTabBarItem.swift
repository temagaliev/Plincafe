//
//  DSTabBarItem.swift
//  Romance Kingdom
//
//  Created by e.nesterov on 25.11.2022.
//

import UIKit

final class DSTabBarItem: UIView {
    
    // MARK: - Lifecycle
    init(itemIndex: Int, icon: UIImage?, selectedIcon: UIImage?) {
        self.isSelected = false
        self.itemIndex = itemIndex
        
        super.init(frame: .zero)
        
        self.notSelectedIconView.image = icon
        self.selectedIconView.image = selectedIcon
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
//        view.image = UIImage(named: NameImage.tabBarBg.rawValue)
//        backgroundColor = DesignSystemColors.tabBarItem_defaultBackgroundColor
        return view
    }()
    
    private lazy var iconView: UIImageView = {
        let view = UIImageView()
        view.contentMode = .scaleAspectFit
        view.clipsToBounds = true
        return view
    }()
    
    private lazy var selectedIconView: UIImageView = {
        let view = UIImageView()
        view.contentMode = .scaleAspectFit
        view.clipsToBounds = true
        return view
    }()
    
    private lazy var notSelectedIconView: UIImageView = {
        let view = UIImageView()
        view.contentMode = .scaleAspectFit
        view.clipsToBounds = true
        return view
    }()
    
    @objc private func onButtonClick() {
        if let actionHandler = actionHandler {
            actionHandler(itemIndex)
        }
        print("send")
    }
    
    private func setupStyle() {
        selectButton.addTarget(self, action: #selector(onButtonClick), for: .touchUpInside)
        
        addSubview(selectorView)
        addSubview(backgroundView)
        backgroundView.addSubview(iconView)
        addSubview(selectButton)
        
        selectorView.activateAnchors()
        backgroundView.activateAnchors()
        iconView.activateAnchors()
        selectButton.activateAnchors()
        
        selectorView.heightAnchor(constant: 5)
        selectorView.leadingAnchor(to: leadingAnchor)
        selectorView.trailingAnchor(to: trailingAnchor)
        selectorView.topAnchor(to: topAnchor)
        
        backgroundView.topAnchor(to: selectorView.bottomAnchor)
        backgroundView.leadingAnchor(to: leadingAnchor)
        backgroundView.trailingAnchor(to: trailingAnchor)
        backgroundView.bottomAnchor(to: bottomAnchor)
        
        if itemIndex == 2 {
            iconView.widthAnchor(constant: 60)
            iconView.heightAnchor(constant: 60)
        } else {
            iconView.widthAnchor(constant: 50)
            iconView.heightAnchor(constant: 50)
        }
        iconView.centerXAnchor(to: centerXAnchor)
        iconView.centerYAnchor.constraint(equalTo: backgroundView.centerYAnchor).isActive = true
        //iconView.topAnchor(to: backgroundView.topAnchor)
        
        selectButton.equalToSuperview()
        
        setupSelectedState()
    }
    
    private func setupSelectedState() {
        if isSelected {
            iconView.image = selectedIconView.image
        } else {
            iconView.image = notSelectedIconView.image
        }
    }
}

