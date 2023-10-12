//
//  FilterDialog.swift
//  Cardx
//
//  Created by Xchel Carranza on 11/10/23.
//

import UIKit

protocol FilterDialogCoordinator {
    func applyFilter(
        categoriesFiltered: [UUID]?, languagesFiltered: [UUID]?, difficultiesFiltered: [Int]?
    )
}

class FilterDialog: UIViewController {
    
    private let coordinator: FilterDialogCoordinator
    
    init(coordinator: FilterDialogCoordinator) {
        self.coordinator = coordinator
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @IBOutlet weak var mainView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    @IBAction func filter(_ sender: Any) {
        // MARK: - change the categories/languages/difficulties filtered
        
        coordinator.applyFilter(
            categoriesFiltered: nil,
            languagesFiltered: nil,
            difficultiesFiltered: nil
        )
    }
    
    @IBAction func dismiss(_ sender: Any) {
        dismiss(animated: true)
    }
}
