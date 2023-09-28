//
//  MainScreenViewController.swift
//  Romance Kingdom
//
//  Created by e.nesterov on 25.11.2022.
//

import UIKit


final class MainScreenViewController: UIViewController {
    
    // MARK: Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        setupUI()
        setupViewControllers()
        selectTabBar()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: false)
    }
    

    // MARK: Private properties
    private lazy var menuViewController: MenuViewController = {
        let viewController = MenuViewController()
        self.add(asChildViewController: viewController)
        return viewController
    }()

    
 
    private var childControllers: [UIViewController] = []
    private lazy var constants = Constants()
    
    private lazy var containerView: UIView = {
        let view = UIView()
        view.clipsToBounds = true
        return view
    }()
    
        
    private lazy var tabBar: DSTabBar = {
        let items = [DSTabBarItem(itemIndex: 0, icon: UIImage(named: "menu"), text: "<Меню>")]
        let view = DSTabBar(items: items)
        view.tabBarSelectionHandler = { [weak self] tabItemindex in
            guard let self = self else { return }
            
            if (0...self.childControllers.count).contains(tabItemindex) {
                self.selectViewController(tabItemindex)
            }
        }

        return view
    }()
    

    
    
    private func setupViewControllers() {
        childControllers.append(menuViewController)
//        childControllers.append(galleryViewController)
//        childControllers.append(partnersViewController)
    }
    
    private func setupUI() {
        view.backgroundColor = .blue
        
        view.addSubview(containerView)
        containerView.activateAnchors()
        containerView.topAnchor(to: view.bottomAnchor)
        containerView.bottomAnchor(to: view.topAnchor)
        containerView.leadingAnchor(to: view.leadingAnchor)
        containerView.trailingAnchor(to: view.trailingAnchor)
        
        
        containerView.addSubview(tabBar)
        tabBar.activateAnchors()
        tabBar.heightAnchor(constant: constants.tabBarHeight)
        tabBar.leadingAnchor(to: containerView.leadingAnchor)
        tabBar.trailingAnchor(to: containerView.trailingAnchor)
        tabBar.bottomAnchor(to: containerView.bottomAnchor)
    }
    
    private struct Constants {
        let adsViewHeight: CGFloat = 80
        let topStackViewHeight: CGFloat = 60
        let settingsButtonHeight: CGFloat = 35
        let tabBarHeight: CGFloat = 70
        let stackViewOffset: CGFloat = 12
    }
    
    
    // MARK: Child ViewControllers methods
    
    private func add(asChildViewController viewController: UIViewController) {
        addChild(viewController)
        
        guard let vcView = viewController.view else { return }
        containerView.addSubview(vcView)
        vcView.activateAnchors()
        
        vcView.topAnchor(to: containerView.topAnchor)
        vcView.leadingAnchor(to: containerView.leadingAnchor)
        vcView.trailingAnchor(to: containerView.trailingAnchor)
        vcView.bottomAnchor(to: tabBar.topAnchor)
        
        viewController.didMove(toParent: self)
        containerView.sendSubviewToBack(vcView)
    }
    
    private func remove(asChildViewController viewController: UIViewController) {
        viewController.willMove(toParent: nil)
        viewController.view.removeFromSuperview()
        viewController.removeFromParent()
    }
    
    private func selectTabBar(index: Int = 0) {
        guard index != tabBar.selectedIndex else { return }
        
        if (0...childControllers.count).contains(index) {
            tabBar.setSelectedTab(index)
            selectViewController(index)
        }
    }
    
    private func selectViewController(_ tabItemindex: Int) {
        for (index, viewController) in childControllers.enumerated() {
            if index == tabItemindex {
                add(asChildViewController: viewController)
            } else {
                remove(asChildViewController: viewController)
            }
        }
    }
    
}

