//
//  Coordinator.swift
//  Eteocles
//
//  Created by Damien Rojo on 17.12.20.
//

import UIKit

final class Coordinator {

    private unowned var appDelegate: AppDelegate
    private var mainCoordinator: MainCoordinator?
    private let context: Context

    // MARK: - Initializer

    init(appDelegate: AppDelegate, context: Context) {
        self.appDelegate = appDelegate
        self.context = context
    }

    // MARK: - Coordinator

    func start() {
        appDelegate.window = UIWindow(frame: UIScreen.main.bounds)
        appDelegate.window!.rootViewController = UIViewController()
        appDelegate.window!.makeKeyAndVisible()

        if ProcessInfo.processInfo.environment["IS_RUNNING_UNIT_TESTS"] == "YES" {
            return
        }

        showMain()
    }

    private func showMain() {
        mainCoordinator = MainCoordinator(presenter: appDelegate.window!, context: context)
        mainCoordinator?.start()
    }
}
