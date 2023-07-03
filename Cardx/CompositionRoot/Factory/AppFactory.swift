//
//  AppFactory.swift
//  Cardx
//
//  Created by Xchel Carranza on 03/07/23.
//

import UIKit

protocol AppFactory {
    func makeCoordinator(navController: UINavigationController) -> Coordinator
}

struct AppFactoryImp: AppFactory {
    
    func makeCoordinator(navController: UINavigationController) -> Coordinator {
        let homeFactory = HomeFactoryImp()
        let coordinator = HomeCoordinator(navController: navController, homeFactory: homeFactory)
        return coordinator
    }
}
