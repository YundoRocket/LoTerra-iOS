//
//  MainCoordinator.swift
//  Eteocles
//
//  Created by Damien Rojo on 17.12.20.
//

import UIKit

enum ViewControllerItem: Int {
    case home = 0
    case wallet = 1
}

protocol TabBarSourceType {
    var items: [UINavigationController] { get set }
}

extension TabBarSourceType {
    subscript(item: ViewControllerItem) -> UINavigationController {
        get {
            guard !items.isEmpty,
                  item.rawValue < items.count,
                  item.rawValue >= 0
            else {
                fatalError("Item does not exists")
            }
            return items[item.rawValue]
        }
    }
}

fileprivate class TabBarSource: TabBarSourceType {
    var items: [UINavigationController] = [
        UINavigationController(nibName: nil, bundle: nil),
        UINavigationController(nibName: nil, bundle: nil)
    ]

    init() {
        self[.home].tabBarItem = UITabBarItem(title: "Home",
                                              image: UIImage(systemName: "house"),
                                              tag: 0)
        self[.wallet].tabBarItem = UITabBarItem(title: "wallet",
                                                image: UIImage(systemName: "creditcard"),
                                                tag: 1)
    }
}

final class MainCoordinator: NSObject {

    // MARK: - Properties
    
    private let presenter: UIWindow
    private let tabBarController: UITabBarController
    private let screens: Screens
    private var tabBarSource = TabBarSource()
    private var homeCoordinator: HomeCoordinator?
    private var walletCoordinator: WalletCoordinator?

    // MARK: - Init

    init(
        presenter: UIWindow,
        context: Context
    ) {
        self.presenter = presenter
        screens = Screens(context: context)
        tabBarController = UITabBarController(nibName: nil,
                                              bundle: nil)
        tabBarController.viewControllers = tabBarSource.items
        tabBarController.selectedViewController = tabBarSource[.home]

        super.init()

        tabBarController.delegate = self
    }

    // MARK: - Coordinator

    func start() {
        presenter.rootViewController = tabBarController
        showHome()
    }

    private func showHome() {
        homeCoordinator = HomeCoordinator(presenter: tabBarSource[.home],
                                          screens: screens)
        homeCoordinator?.start()
    }
    
    private func showWallet() {
        walletCoordinator = WalletCoordinator(presenter: tabBarSource[.wallet],
                                                    screens: screens)
        walletCoordinator?.start()
    }
}

extension MainCoordinator: UITabBarControllerDelegate {
    func tabBarController(_ tabBarController: UITabBarController,
                          didSelect viewController: UIViewController
    ) {
        let index = tabBarController.selectedIndex
        guard index < tabBarSource.items.count,
              let item = ViewControllerItem(rawValue: index)
        else {
            fatalError("Selected ViewController Index Out Of range")
        }

        switch item {
        case .home:
            showHome()
        case .wallet:
            showWallet()
        }
    }
}
