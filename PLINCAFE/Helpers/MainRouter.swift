//
//  MainRouter.swift


import UIKit
import MessageUI

final class MainRouter {
    
    static let shared: MainRouter = MainRouter()
    private var currentModalScreens: [UIViewController] = []

    
    private init() {
        window = UIWindow(frame: UIScreen.main.bounds)
        window.makeKeyAndVisible()
    }
    
    private (set) var window: UIWindow
    private var rootViewController: UINavigationController?
    
    
    func showMainScreen() {
        let vc = MainScreenViewController()
        let rootNavigationController = UINavigationController(rootViewController: vc)
        rootViewController = rootNavigationController
        currentModalScreens = []
        window.rootViewController = rootViewController
    }


    func showMenuViewScreen() {
        rootViewController?.pushViewController(MenuViewController(), animated: true)
    }
//
//    func showWinViewScreen(isWin: Bool, currentQuestion: Question) {
//        rootViewController?.pushViewController(WinOrLossViewController(isWin: isWin, currentQuestion: currentQuestion), animated: true)
//    }
//
//    func closeWinViewScreen() {
//        rootViewController?.popViewController(animated: true)
//    }
//
//    func showGameViewScreen() {
//        rootViewController?.pushViewController(GameViewController(), animated: true)
//    }

    // MARK: Common
//    func presentCustomViewController(_ viewController: UIViewController, animated: Bool = true) {
//        rootViewController?.present(viewController, animated: animated)
//    }
    
    private func pushToRoot(controller: UIViewController) {
        if let vc = rootViewController {
            if let topmostVC = vc.viewControllers.last, type(of: topmostVC) == type(of: controller) {
                vc.popViewController(animated: false)
                DispatchQueue.main.async {
                    vc.pushViewController(controller, animated: true)
                }
            } else {
                vc.pushViewController(controller, animated: true)
            }
        }
    }
}
