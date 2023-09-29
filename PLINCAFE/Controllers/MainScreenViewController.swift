//
//  MainScreenViewController.swift
//  Romance Kingdom
//
//  Created by e.nesterov on 25.11.2022.
//

import UIKit


final class MainScreenViewController: UIViewController {
    
    let viewControllers = UIViewController()
    
    // MARK: Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white

        setupUI()
        setupVC()

        selectTabBar()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: false)
    }
    

    // MARK: Private properties
//    private lazy var menuViewController: MenuViewController = {
//        let viewController = MenuViewController()
//        self.add(asChildViewController: viewController)
//        return viewController
//    }()
//
//    private lazy var cockteilsViewController: CocktailsViewController = {
//        let viewController = CocktailsViewController()
//        self.add(asChildViewController: viewController)
//        return viewController
//    }()

    
 
    private var childControllers: [UINavigationController] = []
    private lazy var constants = Constants()
    
    private lazy var containerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.clipsToBounds = true
        return view
    }()
    
    private lazy var tabImageView: UIImageView = {
        let view = UIImageView(image: UIImage(named: NameImage.tabBarBg.rawValue))
        view.translatesAutoresizingMaskIntoConstraints = false
        view.clipsToBounds = true
        return view
    }()
    
        
    private lazy var tabBar: DSTabBar = {
        let items = [DSTabBarItem(itemIndex: 0, icon: UIImage(named: NameImage.cocktailsIcon.rawValue), selectedIcon: UIImage(named: NameImage.selectedCocktails.rawValue)),
                     DSTabBarItem(itemIndex: 1, icon: UIImage(named: NameImage.menuIcon.rawValue), selectedIcon: UIImage(named: NameImage.selectedMenuIcon.rawValue)),
                     DSTabBarItem(itemIndex: 2, icon: UIImage(named: NameImage.touchIcon.rawValue), selectedIcon: UIImage(named: NameImage.selectedTouch.rawValue)),
                     DSTabBarItem(itemIndex: 3, icon: UIImage(named: NameImage.favoriteIcon.rawValue), selectedIcon: UIImage(named: NameImage.selectedFavoriteIcon.rawValue)),
                     DSTabBarItem(itemIndex: 4, icon: UIImage(named: NameImage.mapIcon.rawValue), selectedIcon: UIImage(named: NameImage.selectedMapIcon.rawValue)),]
        let view = DSTabBar(items: items)
        view.tabBarSelectionHandler = { [weak self] tabItemindex in
            guard let self = self else { return }
            print("tabItemindex", tabItemindex)
            if (0...self.childControllers.count).contains(tabItemindex) {
                self.selectViewController(tabItemindex)
            }
        }

        return view
    }()
    

    
    
    private func setupViewControllers() {

//        childControllers.append(partnersViewController)
    }
    
    private func setupUI() {
        view.backgroundColor = .blue
        
        view.addSubview(containerView)
        containerView.addSubview(tabImageView)
        containerView.addSubview(tabBar)

        containerView.activateAnchors()
        containerView.topAnchor(to: view.topAnchor)
        containerView.bottomAnchor(to: view.bottomAnchor)
        containerView.leadingAnchor(to: view.leadingAnchor)
        containerView.trailingAnchor(to: view.trailingAnchor)
        
        tabBar.activateAnchors()
        tabBar.heightAnchor(constant: constants.tabBarHeight)
        tabBar.leadingAnchor(to: containerView.leadingAnchor)
        tabBar.trailingAnchor(to: containerView.trailingAnchor)
        tabBar.bottomAnchor(to: containerView.bottomAnchor)
        
        tabImageView.activateAnchors()
        tabImageView.heightAnchor(constant: constants.tabBarHeight)
        tabImageView.leadingAnchor(to: containerView.leadingAnchor)
        tabImageView.trailingAnchor(to: containerView.trailingAnchor)
        tabImageView.bottomAnchor(to: containerView.bottomAnchor)
    }
    
    private struct Constants {
        let adsViewHeight: CGFloat = 80
        let topStackViewHeight: CGFloat = 60
        let settingsButtonHeight: CGFloat = 35
        let tabBarHeight: CGFloat = 120
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
//        vcView.bottomAnchor(to: tabBar.topAnchor)
        vcView.bottomAnchor.constraint(equalTo: tabBar.topAnchor, constant: 40).isActive = true
        
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
    
    private func setupVC() {
        childControllers = [
            createNavController(for: MenuViewController()),
            createNavController(for: BasketViewController()),
            createNavController(for: ReservationViewController()),
            createNavController(for: FavoriteViewController()),
            createNavController(for: MapViewController())
        ]
    }
        
    private func createNavController(for rootViewController: UIViewController) -> UINavigationController {
        let navController = UINavigationController(rootViewController: rootViewController)
        return navController
    }
    
}

