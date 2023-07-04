//
//  AddCardCoordinator.swift
//  Cardx
//
//  Created by Xchel Carranza on 04/07/23.
//

import UIKit

class AddCardCoordinator: Coordinator {
    
    var navController: UINavigationController
    private let factory: AddCardFactory
    
    init(navController: UINavigationController, factory: AddCardFactory) {
        self.navController = navController
        self.factory = factory
    }
    
    func start() {
        let controller = factory.makeModule(coordinator: self)
        navController.pushViewController(controller, animated: true)
    }
}

extension AddCardCoordinator: AddCardScreenCoordinator {
    
}
