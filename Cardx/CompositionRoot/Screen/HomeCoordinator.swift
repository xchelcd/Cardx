//
//  HomeCoordinator.swift
//  Cardx
//
//  Created by Xchel Carranza on 03/07/23.
//

import UIKit

final class HomeCoordinator: Coordinator {
    var navController: UINavigationController
    let homeFactory: HomeFactory
    
    init(navController: UINavigationController, homeFactory: HomeFactory) {
        self.navController = navController
        self.homeFactory = homeFactory
    }
    
    func start() {
        let controller = homeFactory.makeModule(coordinator: self)
        navController.pushViewController(controller, animated: true)
    }
}

extension HomeCoordinator: HomeScreenCoordinator {
    
    func navigateToAddCards() {
        let coordinator = homeFactory.makeAddCardModule(navController: navController)
        coordinator.start()
    }
    
    //func navigateToDisplayCards() {
    //    let coordinator = homeFactory.makeDisplayCardModule(navController: navController)
    //    coordinator.start()
    //}
    
    func navigateToSettingScreen() {
        let coordinator = homeFactory.makeSettingModule(navController: navController)
        coordinator.start()
    }
    
    func navigateToTestScreen() {
        let coordinator = homeFactory.makeTestModule(navController: navController)
        coordinator.start()
    }
    
    func navigateToDisplayCards() {
        let coordinator = homeFactory.makeDisplayCardsModule(navController: navController)
        coordinator.start()
    }
}
