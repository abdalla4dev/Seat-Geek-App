//
//  BaseViewModel.swift
//  Seat-Geek-App
//
//  Created by abdallah ragab on 19/02/2022.
//

import RxCocoa
import RxSwift

class BaseViewModel {
    let error = PublishSubject<String?>()
    let loading = BehaviorRelay<Bool?>(value: nil)
    let success = BehaviorRelay<Bool?>(value: nil)
    var pop = PublishSubject<Void>()
    let dispose = DisposeBag()

    deinit {
        pop.onNext(())
    }
}
