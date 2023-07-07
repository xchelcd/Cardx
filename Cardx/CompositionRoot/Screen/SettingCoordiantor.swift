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
    var controller: UIViewController? = nil
    func start() {
        controller = factory.makeModule(coordinator: self)
        navController.pushViewController(controller!, animated: true)
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
        
    }
}

extension SettingCoordinator {
    //private func presentBottomSheet(categoryList: [Category]? = nil, languageList: [Language]? = nil) {
    //    //currentController.showBlurEffect()
    //    //let controller = DataBottomSheet(coordiantor: self, categoryList: categoryList, languageList: languageList)
    //    //controller.modalPresentationStyle = .custom
    //    //currentController.present(controller, animated: true)
    //}
}
