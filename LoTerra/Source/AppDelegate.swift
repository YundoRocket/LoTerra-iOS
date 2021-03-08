//
//  AppDelegate.swift
//  LoTerra
//
//  Created by Damien Rojo on 26.02.21.
//

import UIKit
import CoreData

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var coordinator: Coordinator!
    private var context: Context!

    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        context = Context()
        coordinator = Coordinator(appDelegate: self, context: context)
        coordinator.start()
        
        return true
    }
}
