//
//  AppCoordinator.swift
//  Cardx
//
//  Created by Xchel Carranza on 03/07/23.
//

import UIKit

final class AppCoordinator: Coordinator {
    var navController: UINavigationController
    
    let appFactory: AppFactory
    var coordinator: Coordinator?
    
    init(navController: UINavigationController, appFactpry: AppFactory, window: UIWindow?) {
        self.navController = navController
        self.appFactory = appFactpry
        configWindow(window: window)
    }
    
    func start() {
        coordinator = appFactory.makeCoordinator(navController: navController)
        coordinator?.start()
    }
    
    func configWindow(window: UIWindow?) {
        window?.rootViewController = navController
        window?.makeKeyAndVisible()
    }
}
