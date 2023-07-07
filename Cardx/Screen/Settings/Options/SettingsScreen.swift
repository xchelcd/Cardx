//
//  SettingsScreen.swift
//  Cardx
//
//  Created by Xchel Carranza on 05/07/23.
//

import UIKit

protocol SettingScreenCoordinator {
    func navigateToDefaultsCards()
}

class SettingsScreen: UIViewController {
    
    private let coordinator: SettingScreenCoordinator
    private let settingViewmodel: SettingViewModel
    
    init(coordinator: SettingScreenCoordinator, settingViewmodel: SettingViewModel) {
        self.coordinator = coordinator
        self.settingViewmodel = settingViewmodel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func addNewLanguage(_ sender: UIButton) {
        self.showDefaultPopUpToAdd(title: "Add New Language", message: "Write the [Language] that you want to add", placeholder: "Language") { language in
            guard let language = language else {
                print(self._tag, "Language is null")
                return
            }
            self.settingViewmodel.addNewLanguage(language: .init(id: UUID(), name: language))
        }
    }
    
    @IBAction func addNewCategory(_ sender: UIButton) {
        self.showDefaultPopUpToAdd(title: "Add New Category", message: "Write the [Category] that you want to add", placeholder: "Category") { category in
            guard let category = category else {
                print(self._tag, "Category is null")
                return
            }
            self.settingViewmodel.addNewCategory(category: .init(id: UUID(), name: category))
        }
    }
    
    @IBAction func showAllLanguages(_ sender: UIButton) {
        let languageList = settingViewmodel.fetchAllLanguages()
        print(_tag, "Languages (\(languageList.count)): \(languageList.map{$0.name})")
        presentBottomSheet(languageList: languageList)
    }
    
    @IBAction func showAllCategories(_ sender: UIButton) {
        let categoryList = settingViewmodel.fetchAllCategories()
        print(_tag, "Categories (\(categoryList.count)): \(categoryList.map{$0.name})")
        presentBottomSheet(categoryList: categoryList)
    }
    
    @IBAction func showDefaultCards(_ sender: UIButton) {
        coordinator.navigateToDefaultsCards()
    }
    
    
    private func presentBottomSheet(categoryList: [Category]? = nil, languageList: [Language]? = nil) {
        showBlurEffect()
        let controller = DataBottomSheet(categoryList: categoryList, languageList: languageList)
        controller.modalPresentationStyle = .custom
        present(controller, animated: true)
    }
    
}
