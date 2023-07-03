//
//  TestCoordinator.swift
//  Cardx
//
//  Created by Xchel Carranza on 03/07/23.
//

import UIKit

final class TestCoordinator: Coordinator {
    
    var navController: UINavigationController
    private let testFactory: TestFactory
    
    init(navController: UINavigationController, testFactory: TestFactory) {
        self.navController = navController
        self.testFactory = testFactory
    }
    
    func start() {
        let controller = testFactory.makeModule(coordinator: self)
        navController.pushViewController(controller, animated: true)
    }
}
