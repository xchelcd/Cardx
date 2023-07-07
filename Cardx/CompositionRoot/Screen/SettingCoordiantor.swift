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
    
    func openBottomSheet<T>(list: [T]) {
        let categoryList = list as? [Category]
        let langaugeList = list as? [Language]
        
        let coordinator = factory.makeBottomSheetModule(navController: navController, categoryList: categoryList, langaugeList: langaugeList)
        
        coordinator.start()
    }
    
    func navigateToDefaultsCards() {
        let coordinator = factory.makeDefaultCardsModule(navController: navController)
        coordinator.start()
    }
}
