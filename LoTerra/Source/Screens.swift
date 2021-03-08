//
//  Screens.swift
//  Eteocles
//
//  Created by Damien Rojo on 17.12.20.
//

import UIKit

public class Screens {
    
    let context: Context
    let storyboard = UIStoryboard(name: "Main",
                                  bundle: Bundle(for: Screens.self))

    init(context: Context) {
       self.context = context
    }
}

extension Screens {
    func createHomeViewController(
        actions: HomeViewModel.Actions
    ) -> UIViewController {
        let viewController = storyboard.instantiateViewController(withIdentifier: "HomeViewController") as! HomeViewController
        let repository = HomeRepository(client: context.client,
                                        stack: context.portfolioCoredataStack)
        let viewModel = HomeViewModel(actions: actions,
                                      repository: repository)
        viewController.viewModel = viewModel
        return viewController
    }
}

extension Screens {
    func createRecoveryViewController() -> UIViewController {
        let viewController = storyboard.instantiateViewController(withIdentifier: "RecoveryViewController") as! RecoveryViewController
        let repository = HomeRepository(client: context.client,
                                        stack: context.portfolioCoredataStack)
        let viewModel = RecoveryViewModel(repository: repository)
        viewController.viewModel = viewModel
        return viewController
    }
}

extension Screens {
    func createCoinInfoViewController(
        coin: Coin,
        action: CoinInfoViewModel.Actions
    ) -> UIViewController {
        let viewController = storyboard.instantiateViewController(withIdentifier: "CoinInfoViewController") as! CoinInfoViewController
        let repository = CoinInfoRepository(client: context.client)
        let viewModel = CoinInfoViewModel(coin: coin,
                                          repository: repository,
                                          actions: action)
        viewController.viewModel = viewModel
        return viewController
    }
}

extension Screens {
    func createAddTransactionViewController(coin: Coin) -> UIViewController {
        let viewController = storyboard.instantiateViewController(withIdentifier: "AddTransactionViewController") as! AddTransactionViewController
        let repository = AddTransactionRepository(client: context.client)
        let viewModel = AddTransactionViewModel(coin: coin,
                                                repository: repository)
        viewController.viewModel = viewModel
        return viewController
    }
}

extension Screens {
    func createCoinsViewController(
        actions: CoinsListViewModel.Actions,
        portfolioCoins: [Coin]
    ) -> UIViewController {
        let viewController = storyboard.instantiateViewController(withIdentifier: "CoinsListViewController") as! CoinsListViewController
        let repository = CoinsListRepository(client: context.client,
                                             stack: context.coinCoredataStack)
        let viewModel = CoinsListViewModel(actions: actions,
                                           repository: repository,
                                           portfolioCoins: portfolioCoins)
        viewController.viewModel = viewModel
        return viewController
    }
}

extension Screens {
    func createAlert(with configuration: AlertConfiguration) -> UIAlertController {
        let alertController = UIAlertController()        
        alertController.title = configuration.title
        alertController.message = configuration.message
        let action = UIAlertAction(title: configuration.okMessage,
                                   style: .default,
                                   handler: nil)

        alertController.addAction(action)
        return alertController
    }
}
