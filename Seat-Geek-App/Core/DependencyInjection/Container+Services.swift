//
//  Container+Services.swift
//  WeatherApp
//
//  Created by abdallah ragab on 19/02/2022.
//

import Swinject
import SwinjectAutoregistration

extension Container {
    func registerServices() {
        autoregister(SeatGeekService.self, initializer: SeatGeekServiceManager.init).inObjectScope(.container)

    }
}
