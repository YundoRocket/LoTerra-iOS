//
//  HTTPEngine.swift
//  Eteocles
//
//  Created by Damien Rojo on 17.12.20.
//

import Foundation

typealias HTTPCompletionHander = (Data?, HTTPURLResponse?, Error?) -> Void

enum URLSessionEngineError: Error {
    case invalideURLResponseType
}

final class HTTPEngine {
    
    private let session: URLSession
    
    init(configuration: URLSessionConfiguration = .default) {
        self.session = URLSession(configuration: configuration)
    }
    
    func send(request: URLRequest,
              cancelledBy token: RequestCancellationToken,
              callback: @escaping HTTPCompletionHander) {
        
        let task = session.dataTask(with: request) { (data, urlResponse, _) in
            if urlResponse != nil, let httpUrlResponse = urlResponse as? HTTPURLResponse {
                callback(data, httpUrlResponse, nil)
            } else {
                callback(data, nil, URLSessionEngineError.invalideURLResponseType)
            }
        }

        task.resume()
        token.willDealocate = {
            task.cancel()
        }
    }

    deinit {
        session.invalidateAndCancel()
    }
}
