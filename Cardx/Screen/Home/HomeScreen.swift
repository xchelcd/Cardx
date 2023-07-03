//
//  HomeScreen.swift
//  Cardx
//
//  Created by Xchel Carranza on 03/07/23.
//

import UIKit

protocol HomeScreenCoordinator {
    func navigateToTestScreen()
}

class HomeScreen: UIViewController {
    
    private let coordinator: HomeScreenCoordinator
    
    init(coordinator: HomeScreenCoordinator) {
        self.coordinator = coordinator
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    @IBAction func testButton(_ sender: UIButton) {
        coordinator.navigateToTestScreen()
    }
    
    @IBAction func addNewCard(_ sender: UIButton) {
    }
    
    @IBAction func displayCards(_ sender: UIButton) {
    }
}
