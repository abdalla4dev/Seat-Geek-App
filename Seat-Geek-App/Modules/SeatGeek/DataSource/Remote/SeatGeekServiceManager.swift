//
//  SeatGeekServiceManager.swift
//  Seat-Geek-App
//
//  Created by abdallah ragab on 19/02/2022.
//

import Moya
import RxSwift

protocol SeatGeekService {
    func getSeatGeek(searchTxt:String) -> Single<SeatModel>
}

class SeatGeekServiceManager: SeatGeekService {
    let provider = AppMoyaProvider<SeatGeekApi>(isMock: false)
    let mockProvider = AppMoyaProvider<SeatGeekApi>(isMock: true)
    
    func getSeatGeek(searchTxt: String) -> Single<SeatModel> {
        return provider.rx
            .request(.getSeatGeek(searchTxt: searchTxt))
            .map(SeatModel.self)
            .catchError { error in
                throw error
            }
    }
}
