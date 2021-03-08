//
//  WalletCoordinator.swift
//  LoTerra
//
//  Created by Damien Rojo on 26.02.21.
//

import UIKit

final class WalletCoordinator {
    
    // MARK: - Properties

    private let presenter: UINavigationController
    private let screens: Screens
    
    // MARK: - Initializer

    init(
        presenter: UINavigationController,
        screens: Screens
    ) {
        self.presenter = presenter
        self.screens = screens
    }

    // MARK: - Coodinator

    func start() {
        showWallet()
    }
    
    private func showWallet() {
        let vc = screens.createWalletViewController()
        presenter.viewControllers = [vc]
    }
}
