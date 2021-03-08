//
//  RequestCancellationToken.swift
//  Eteocles
//
//  Created by Damien Rojo on 17.12.20.
//

import Foundation

final class RequestCancellationToken {
    
    init() {}
    
    deinit {
        willDealocate?()
    }
    
    var willDealocate: (() -> Void)?
}
