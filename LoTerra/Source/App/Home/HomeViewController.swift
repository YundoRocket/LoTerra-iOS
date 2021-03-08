//
//  HomeViewController.swift
//  LoTerra
//
//  Created by Damien Rojo on 26.02.21.
//

import UIKit

final class HomeViewController: UIViewController {
    
    // MARK: - Properties

    var viewModel: HomeViewModel!
    
    // MARK: - Outlets
    
    
    // MARK: - View life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
    }
    
    // MARK: - Helpers

    private func setUI() {
        self.navigationController?
            .navigationBar
            .setBackgroundImage(UIImage(),
                                for: UIBarMetrics.default)
        self.navigationController?
            .navigationBar
            .shadowImage = UIImage()
    }
    
    // MARK: - Actions
    
    
}
