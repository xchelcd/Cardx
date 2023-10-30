//
//  DefaultCardsCoordinator.swift
//  Cardx
//
//  Created by Xchel Carranza on 06/07/23.
//

import UIKit

class DefaultCardsCoordinator: Coordinator {
    
    var navController: UINavigationController
    var factory: DefaultCardsFactory
    
    init(navController: UINavigationController, factory: DefaultCardsFactory) {
        self.navController = navController
        self.factory = factory
    }
    
    func start() {
        let controller = factory.makeModule(coordinator: self)
        navController.pushViewController(controller, animated: true)
    }
    
}

extension DefaultCardsCoordinator: DefaultCardsSreenCoordiantor {
    
    func openFilterDialog(categories: Set<Category>, languages: Set<Language>) {
        let coordinator = factory.makeFilterModule(navController: navController, categories: categories, languages: languages)
        coordinator.start()
    }
    
}
