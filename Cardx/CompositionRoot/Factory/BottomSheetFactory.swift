//
//  BottomSheetFactory.swift
//  Cardx
//
//  Created by Xchel Carranza on 06/07/23.
//

import UIKit

protocol BottomSheetFactory {
    func makeModule(coordinator: DataBottomSheetScreenCoordinator, categoryList: [Category]?, langaugeList: [Language]?) -> UIViewController
}

struct BottomSheetFactoryImp: BottomSheetFactory {
    
    
    func makeModule(coordinator: DataBottomSheetScreenCoordinator, categoryList: [Category]?, langaugeList: [Language]?) -> UIViewController {
        
        let controller = DataBottomSheet(coordinator: coordinator, categoryList: categoryList, languageList: langaugeList)
        controller.modalPresentationStyle = .custom
        
        return controller
    }

}
