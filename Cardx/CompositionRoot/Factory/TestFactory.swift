//
//  TestFactory.swift
//  Cardx
//
//  Created by Xchel Carranza on 03/07/23.
//

import UIKit

protocol TestFactory {
    func makeModule(coordinator: TestCoordinator) -> UIViewController
}


struct TestFactoryImp: TestFactory {
    func makeModule(coordinator: TestCoordinator) -> UIViewController {
        let controller = TestScreen()
        return controller
    }
}
