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
    
    // MARK: - Init

    init() {
        let engine = HTTPEngine(configuration: .default)
        client = HTTPClient(engine: engine)
    }
}
