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
//        backgroundView.addSubview(textLabel)
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
        
//        textLabel.topAnchor(to: iconView.bottomAnchor, constant: 4)
//        textLabel.leadingAnchor(to: backgroundView.leadingAnchor, constant: 12)
//        textLabel.trailingAnchor(to: backgroundView.trailingAnchor, constant: -12)
//        textLabel.bottomAnchor(to: backgroundView.bottomAnchor, constant: -8)
        
        iconView.widthAnchor(constant: 50)
        iconView.heightAnchor(constant: 50)
        iconView.centerXAnchor(to: centerXAnchor)
        iconView.centerYAnchor.constraint(equalTo: backgroundView.centerYAnchor).isActive = true
        //iconView.topAnchor(to: backgroundView.topAnchor)
        
        selectButton.equalToSuperview()
        
        setupSelectedState()
    }
    
    private func setupSelectedState() {
        if isSelected {
            iconView.image = UIImage(named: NameImage.selectedMenuIcon.rawValue)
        } else {
            iconView.image = UIImage(named: NameImage.menuIcon.rawValue)
        }
    }
}

