//
//  AddCardScreen.swift
//  Cardx
//
//  Created by Xchel Carranza on 03/07/23.
//

import UIKit

protocol AddCardScreenCoordinator {
    
}

class AddCardScreen: UIViewController {
    
    private var cardItem: CardItem? = nil
    
    private let coordinator: AddCardScreenCoordinator
    private let cardViewModel: CardViewModel
    private let settingViewModel: SettingViewModel
    
    
    private let toolbarPicker = UIToolbar(frame: CGRect.init(x: 0.0, y: UIScreen.main.bounds.size.height - 300, width: UIScreen.main.bounds.size.width, height: 30))
    
    private let difficulties: [Difficulty] = Difficulty.difficulties
    private var currentDifficulty: Difficulty? = nil
    private let difficultyPicker: UIPickerView = {
        let picker = UIPickerView()
        picker.tag = 3
        return picker
    }()
    
    private var languages: [Language] = []
    private var currentLanguage: Language? = nil
    private let languagePicker: UIPickerView = {
        let picker = UIPickerView()
        picker.tag = 1
        return picker
    }()
    
    private var categories: [Category] = []
    private var currentCategory: Category? = nil
    private let categoryPicker: UIPickerView = {
        let picker = UIPickerView()
        picker.tag = 2
        return picker
    }()
    
    
    init(coordinator: AddCardScreenCoordinator, cardViewModel: CardViewModel, settingViewModel: SettingViewModel) {
        self.coordinator = coordinator
        self.cardViewModel = cardViewModel
        self.settingViewModel = settingViewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private let addButton: UIButton = {
        let button = UIButton(configuration: .borderedTinted())
        button.setTitle("Add", for: .normal)
        button.addTarget(self, action: #selector(add), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupCardItem()
        setupPickerViews()
        
        testCheckCardAdded()
    }
    
}

extension AddCardScreen {
    
    @objc private func add(sender: UIButton) {
        guard let toTranslate = cardItem?.textToTranslate.text,
              let translation = cardItem?.translation.text,
              let languageName = currentLanguage?.name,
              let difficultyName = currentDifficulty?.name,
              let categoryName = currentCategory?.name else {
            print(_tag, "Some value were missing")
            return
        }
        let difficultySelectedName = CardDifficulty.NULL
        
        let card: Card = Card(id: UUID(), toTranslate: toTranslate, translation: translation, language: Language(id: UUID(), name: languageName), difficulty: Difficulty(id: CardDifficultyId.EASY, name: difficultyName), difficultySelected: Difficulty(id: CardDifficultyId.NULL, name: difficultySelectedName), category: Category(id: UUID(), name: categoryName))
        
        cardViewModel.saveCard(card: card)
    }
    
    private func setupCardItem() {
        let cardItem = CardItem(card: nil, optionsDelegate: self)
        self.cardItem = cardItem
        self.view.addSubview(cardItem)
        self.view.addSubview(addButton)
        NSLayoutConstraint.activate([
            cardItem.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor),
            cardItem.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            cardItem.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            
            addButton.topAnchor.constraint(equalTo: cardItem.bottomAnchor, constant: CGFloat(15)),
            addButton.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: CGFloat(-15))
        ])
    }
}

extension AddCardScreen: CardItemOptionsDelegate {
    
    func languageSelected() {
        onPickerDone()
        cardItem?.languageButton.setTitle(languages.first?.name ?? "Language", for: .normal)
        languagePicker.frame = CGRect.init(x: 0.0, y: UIScreen.main.bounds.size.height - 300, width: UIScreen.main.bounds.size.width, height: 300)
        self.view.addSubview(languagePicker)
        languagePicker.autoresizingMask = .flexibleWidth
        
        self.view.addSubview(toolbarPicker)
        
        currentLanguage = languages.first
    }
    
    func categorySelected() {
        onPickerDone()
        cardItem?.categoryButton.setTitle(categories.first?.name ?? "Category", for: .normal)
        categoryPicker.frame = CGRect.init(x: 0.0, y: UIScreen.main.bounds.size.height - 300, width: UIScreen.main.bounds.size.width, height: 300)
        self.view.addSubview(categoryPicker)
        categoryPicker.autoresizingMask = .flexibleWidth
        
        self.view.addSubview(toolbarPicker)
        
        currentCategory = categories.first
    }
    
    func difficultySelected() {
        onPickerDone()
        cardItem?.difficultyButton.setTitle(difficulties.first?.name.rawValue ?? "Difficulty", for: .normal)
        difficultyPicker.frame = CGRect.init(x: 0.0, y: UIScreen.main.bounds.size.height - 300, width: UIScreen.main.bounds.size.width, height: 300)
        self.view.addSubview(difficultyPicker)
        difficultyPicker.autoresizingMask = .flexibleWidth
        
        self.view.addSubview(toolbarPicker)
        
        currentDifficulty = difficulties.first
    }
    
    @objc private func onPickerDone() {
        toolbarPicker.removeFromSuperview()
        difficultyPicker.removeFromSuperview()
        categoryPicker.removeFromSuperview()
        languagePicker.removeFromSuperview()
    }
}

extension AddCardScreen: UIPickerViewDataSource, UIPickerViewDelegate {
    
    private func setupPickerViews() {
        difficultyPicker.delegate = self
        difficultyPicker.dataSource = self
        
        categoryPicker.delegate = self
        categoryPicker.dataSource = self
        
        languagePicker.delegate = self
        languagePicker.dataSource = self
        
        let closeButton = UIBarButtonItem(title: "Close", style: .plain, target: self, action: #selector(onPickerDone))
        toolbarPicker.items = [closeButton]
        
        languages = settingViewModel.fetchAllLanguages()
        categories = settingViewModel.fetchAllCategories()
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        switch pickerView.tag {
        case 1: return languages.count
        case 2: return categories.count
        case 3: return difficulties.count
        default: return 1
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        switch pickerView.tag {
        case 1: return languages[row].name
        case 2: return categories[row].name
        case 3: return difficulties[row].name.rawValue
        default: return "Error"
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        switch pickerView.tag {
        case 1: do {
            let value = languages[row]
            print(_tag, "[Language]: \(value)")
            cardItem?.languageButton.setTitle(value.name, for: .normal)
            currentLanguage = value
        }
        case 2: do {
            let value = categories[row]
            print(_tag, "[Category]: \(value)")
            cardItem?.categoryButton.setTitle(value.name, for: .normal)
            currentCategory = value
        }
        case 3: do {
            let value = difficulties[row]
            print(_tag, "[Difficulty]: \(value)")
            cardItem?.difficultyButton.setTitle(value.name.rawValue, for: .normal)
            currentDifficulty = value
        }
        default: return
        }
    }
}

extension AddCardScreen {
    private func testCheckCardAdded() {
        let cards = cardViewModel.fetchAllCards().map{"\($0.toTranslate)(\($0.translation))"}
        print(_tag, "total cards: \(cards.count)")
        print(_tag, "values: \(cards)")
    }
}
