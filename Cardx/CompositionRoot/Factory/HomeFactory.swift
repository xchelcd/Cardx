//
//  HomeFactory.swift
//  Cardx
//
//  Created by Xchel Carranza on 03/07/23.
//

import UIKit

protocol HomeFactory {
    func makeModule(coordinator: HomeCoordinator) -> UIViewController
    func makeSettingModule(navController: UINavigationController) -> Coordinator
    func makeTestModule(navController: UINavigationController) -> Coordinator
    
    
    func makeAddCardModule(navController: UINavigationController) -> Coordinator
    //func makeDisplayCardModule(navController: UINavigationController) -> Coordinator
    func makeDisplayCardsModule(navController: UINavigationController) -> Coordinator
}

struct HomeFactoryImp: HomeFactory {
    
    func makeModule(coordinator: HomeCoordinator) -> UIViewController {
        let controller = HomeScreen(coordinator: coordinator)
        controller.view.accessibilityIdentifier = "view_menu"
        return controller
    }
    
    func makeTestModule(navController: UINavigationController) -> Coordinator {
        let testFactory = TestFactoryImp()
        let testCoordinator = TestCoordinator(navController: navController, testFactory: testFactory)
        
        return testCoordinator
    }
    
    func makeAddCardModule(navController: UINavigationController) -> Coordinator {
        let addCardFactory = AddCardFactoryImp()
        let addCardCoordiantor = AddCardCoordinator(navController: navController, factory: addCardFactory)
        return addCardCoordiantor
    }
    
    func makeSettingModule(navController: UINavigationController) -> Coordinator {
        let factory = SettingFactoryImp()
        let coordinator = SettingCoordinator(navController: navController, factory: factory)
        return coordinator
    }
    
    func makeDisplayCardsModule(navController: UINavigationController) -> Coordinator {
        let factory = DisplayCardsFactoryImp()
        let coordinator = DisplayCardsCoordinator(navController: navController, factory: factory)
        
        return coordinator
    }
}
