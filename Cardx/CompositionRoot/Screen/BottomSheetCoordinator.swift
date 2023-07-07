//
//  BottomSheetCoordinator.swift
//  Cardx
//
//  Created by Xchel Carranza on 06/07/23.
//

import UIKit

class BottomSheetCoordinator: Coordinator {
    
    var navController: UINavigationController
    let factory: BottomSheetFactory
    
    let categoryList: [Category]?
    let languageList: [Language]?
    
    init(navController: UINavigationController, factory: BottomSheetFactory, categoryList: [Category]?, languageList: [Language]?) {
        self.navController = navController
        self.factory = factory
        self.categoryList = categoryList
        self.languageList = languageList
    }
    
    func start() {
        let controller = factory.makeModule(coordinator: self, categoryList: categoryList, langaugeList: languageList)
        navController.viewControllers.last?.present(controller, animated: true)
    }
    
}

extension BottomSheetCoordinator: DataBottomSheetScreenCoordinator {
    
    func dismiss(requireReload: Bool) {
        navController.viewControllers.last?.removeBlurEffect()
    }
}
