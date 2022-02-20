//
//  SeatGeekViewModel.swift
//  Seat-Geek-App
//
//  Created by abdallah ragab on 19/02/2022.
//

import RxCocoa
import RxSwift

class SeatGeekViewModel: BaseViewModel {
    // MARK: - Var
    let noResult = PublishSubject<Bool?>()
    let seatGeekList = BehaviorRelay<[Event]>(value: [])
    var seatGeekRepo: SeatGeekService!
    
    
    init(seatGeekRepo: SeatGeekService) {
        super.init()
        self.seatGeekRepo = seatGeekRepo
    }
    
}


// MARK: - Network Call

extension SeatGeekViewModel {
    func getSeatGeek(searchTxt: String) {
        loading.accept(true)
        seatGeekRepo.getSeatGeek(searchTxt: searchTxt)
            .subscribe(onSuccess: { res in
                self.loading.accept(false)
                self.seatGeekList.accept([])
                self.seatGeekList.accept(res.events ?? [])
                self.noResult.onNext(self.seatGeekList.value.isEmpty)
            }, onError: { err in
                self.loading.accept(false)
                self.error.onNext("Something went wrong")
            }).disposed(by: dispose)
    }
}
