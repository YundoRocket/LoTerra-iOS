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
    func createHomeViewController() -> UIViewController {
        let viewController = storyboard.instantiateViewController(withIdentifier: "HomeViewController") as! HomeViewController
        return viewController
    }
}

extension Screens {
    func createWalletViewController() -> UIViewController {
        let viewController = storyboard.instantiateViewController(withIdentifier: "WalletViewController") as! WalletViewController
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
