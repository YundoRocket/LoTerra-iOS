//
//  HomeCoordinator.swift
//  LoTerra
//
//  Created by Damien Rojo on 26.02.21.
//

import UIKit

final class HomeCoordinator {
    
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
        showHome()
    }
    
    private func showHome() {
        let vc = screens.createHomeViewController()
        presenter.viewControllers = [vc]
    }
}
