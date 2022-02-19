//
//  Container+DependencyInjection .swift
//  WeatherApp
//
//  Created by abdallah ragab on 19/02/2022.
//

import Swinject

extension Container {
    func registerDependencies() {
        registerServices()
        registerServicesOffline()
        registerRepositories()
        registerViewModels()
    }
}
