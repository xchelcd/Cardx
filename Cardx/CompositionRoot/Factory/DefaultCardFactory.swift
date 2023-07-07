//
//  DefaultCardFactory.swift
//  Cardx
//
//  Created by Xchel Carranza on 06/07/23.
//

import UIKit

protocol DefaultCardsFactory {
    func makeModule(coordinator: DefaultCardsCoordinator) -> UIViewController
}

struct DefaultCardsFactoryImp: DefaultCardsFactory {
    func makeModule(coordinator: DefaultCardsCoordinator) -> UIViewController {
        
        let controller = DefaultCardsScreen()
        
        return controller
    }
}
