//
//  DisplayCardsCoordinator.swift
//  Cardx
//
//  Created by Xchel Carranza on 21/10/23.
//

import UIKit

class DisplayCardsCoordinator: Coordinator {
    var navController: UINavigationController
    
    private let factory: DisplayCardsFactory
    
    init(navController: UINavigationController, factory: DisplayCardsFactory) {
        self.navController = navController
        self.factory = factory
    }
    
    func start() {
        let controller = factory.makeModule(coordinator: self)
//        navController.viewControllers.last?.present(controller, animated: true)
        navController.pushViewController(controller, animated: true)
    }
    
    
}

extension DisplayCardsCoordinator: DisplayCardsScreenCoordinator {
    
}
