//
//  Context.swift
//  Odeon
//
//  Created by Damien Rojo on 17.12.20.
//

import Foundation

final class Context {

    // MARK: - Properties

    public let client: HTTPClient
    public let coinCoredataStack: CoinCoredataStack
    public let portfolioCoredataStack: PortfolioCoredataStack
    
    // MARK: - Init

    init() {
        let engine = HTTPEngine(configuration: .default)
        client = HTTPClient(engine: engine)
        coinCoredataStack = CoinCoredataStack()
        portfolioCoredataStack = PortfolioCoredataStack()
    }
}
