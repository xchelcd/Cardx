//
//  HomeFactory.swift
//  Cardx
//
//  Created by Xchel Carranza on 03/07/23.
//

import UIKit

protocol HomeFactory {
    func makeModule(coordinator: HomeCoordinator) -> UIViewController
    //func makeSettingsModule(navController: UINavigationController) -> UIViewController
    func makeTestModule(navController: UINavigationController) -> Coordinator
    
    
    func makeAddCardModule(navController: UINavigationController) -> Coordinator
    //func makeDisplayCardModule(navController: UINavigationController) -> Coordinator
}

struct HomeFactoryImp: HomeFactory {
    
    func makeModule(coordinator: HomeCoordinator) -> UIViewController {
        let viewController = HomeScreen(coordinator: coordinator)
        return viewController
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
    
    //func makeDisplayCardModule(navController: UINavigationController) -> Coordinator {
    //    let displayCardFactory = DisplayCardFactory()
    //    let displayCardCoordiantor = DisplayCardCoordinator(navController: navController, factory: displayCardFactory)
    //    return displayCardCoordiantor
    //}
}
