//
//  SettingCoordiantor.swift
//  Cardx
//
//  Created by Xchel Carranza on 05/07/23.
//

import UIKit

class SettingCoordinator: Coordinator {
    
    var navController: UINavigationController
    private let factory: SettingFactory
    
    init(navController: UINavigationController, factory: SettingFactory) {
        self.navController = navController
        self.factory = factory
    }
    
    func start() {
        let controller = factory.makeModule(coordinator: self)
        navController.pushViewController(controller, animated: true)
    }
    
}

extension SettingCoordinator: SettingScreenCoordinator {
    
}
