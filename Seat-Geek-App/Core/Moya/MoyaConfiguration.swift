//
//  MoyaConfiguration.swift
//  Seat-Geek-App
//
//  Created by abdallah ragab on 19/02/2022.
//

import Alamofire
import Foundation
import Moya
import RxSwift

class AppMoyaProvider<T: TargetType>: MoyaProvider<T> {
    init(isMock: Bool? = false) {
        
        let sessionManager = DefaultAlamofireManager.sharedManager
        // TODO: @Ahmed Ibrahim consider to add [AccessToken Plugin]
        
        #if DEBUG
        let loggingPlugin = NetworkLoggerPlugin(configuration: .init(formatter: .init(responseData: JSONResponseDataFormatter), logOptions: .verbose))
        
        if isMock ?? false {
            super.init(
                stubClosure: AppMoyaProvider.delayedStub(3),
                session: sessionManager,
                plugins: [loggingPlugin])
        } else {
            super.init(session: sessionManager, plugins: [loggingPlugin])
        }
        #else
        super.init(session: sessionManager)
        #endif
    }
}

class MockAppMoyaProvider<T: TargetType>: MoyaProvider<T> {
    init() {
        super.init(stubClosure: MoyaProvider.delayedStub(3),
                   plugins: [NetworkLoggerPlugin(configuration: .init(formatter: .init(responseData:
                           JSONResponseDataFormatter),
                       logOptions: .verbose))])
    }
}

class DefaultAlamofireManager: Session {
    static let sharedManager: DefaultAlamofireManager = {
        let configuration = URLSessionConfiguration.default
        configuration.timeoutIntervalForRequest = 60 // as seconds, you can set your request timeout
        configuration.timeoutIntervalForResource = 60 // as seconds, you can set your resource timeout
        configuration.requestCachePolicy = .useProtocolCachePolicy
        return DefaultAlamofireManager(configuration: configuration)
    }()
}

extension Reactive where Base: MoyaProviderType {
    func request(_ token: Base.Target, callbackQueue: DispatchQueue? = nil) -> Single<Response> {
        return Single.create { [weak base] single in
            let cancellableToken = base?.request(token, callbackQueue: callbackQueue, progress: nil) { result in
                switch result {
                case let .success(response):
                    single(.success(response))
                case let .failure(error):
                    single(.error(error))
                }
            }

            return Disposables.create {
                cancellableToken?.cancel()
            }
        }
        .filterSuccessfulStatusCodes()
    }
}


extension TargetType {
    
    /// The type of validation to perform on the request. Default is `.none`.
    var refershAuthRequierd: Bool {
        return true
    }
}



