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

// MARK: - this view require a categoryList and languageList from the previous view. it can't fetch own lists

class FilterDialog: UIViewController {
    
    let languageLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.attributedText = "Language".underLined
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let categoryLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.attributedText = "Category".underLined
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let difficultyLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.attributedText = "Difficulty".underLined
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let coordinator: FilterDialogCoordinator
    
    private var categoryList: [Category] = []
    private var categoryFilterList: Set<Category> = []
    
    private var languageList: [Language] = []
    private var languageFilterList: Set<Language> = []
    
    private var difficultyList: [Difficulty] = Difficulty.difficulties
    private var difficultyFilterList: Set<Difficulty> = []
    
    let viewModel: SettingViewModel
    
    init(coordinator: FilterDialogCoordinator, viewModel: SettingViewModel, categories: Set<Category>, languages: Set<Language>, difficulties: [Difficulty]) {
        self.viewModel = viewModel
        self.coordinator = coordinator
        categoryList = Array(categories)
        languageList = Array(languages)
//        difficultyList = difficulties
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @IBOutlet weak var mainView: UIView!
    @IBOutlet weak var applyFilterOutlet: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupCollections()
    }

    @IBAction func filter(_ sender: Any) {
        // MARK: - change the categories/languages/difficulties filtered
        
        coordinator.applyFilter(
            categoriesFiltered: categoryFilterList.map(\.id),
            languagesFiltered: languageFilterList.map(\.id),
            difficultiesFiltered: difficultyFilterList.map(\.id.rawValue)
        )
    }
    
    @IBAction func dismiss(_ sender: Any) {
        dismiss(animated: true)
    }
}

extension FilterDialog {
    
    private func setupCollections() {
        let categoryChipCollection = SelectableCollectionGroup(type: .chip, list: categoryList, delegate: self)
        let languageChipCollection = SelectableCollectionGroup(type: .chip, list: languageList, delegate: self)
        let difficultyChipCollection = SelectableCollectionGroup(type: .chip, list: difficultyList, delegate: self)
        
        self.view.addSubview(languageChipCollection)
        self.view.addSubview(categoryChipCollection)
        self.view.addSubview(difficultyChipCollection)
        self.view.addSubview(languageLabel)
        self.view.addSubview(categoryLabel)
        self.view.addSubview(difficultyLabel)
        
        NSLayoutConstraint.activate([
            languageLabel.topAnchor.constraint(equalTo: self.mainView.topAnchor, constant: 15),
            languageLabel.leadingAnchor.constraint(equalTo: self.mainView.leadingAnchor, constant: 15),
            languageLabel.bottomAnchor.constraint(equalTo: languageChipCollection.topAnchor),
            
            languageChipCollection.topAnchor.constraint(equalTo: self.languageLabel.bottomAnchor),
            languageChipCollection.trailingAnchor.constraint(equalTo: self.mainView.trailingAnchor),
            languageChipCollection.leadingAnchor.constraint(equalTo: self.mainView.leadingAnchor),
            languageChipCollection.bottomAnchor.constraint(equalTo: categoryLabel.topAnchor, constant: -15),
            
            categoryLabel.topAnchor.constraint(equalTo: languageChipCollection.bottomAnchor, constant: 15),
            categoryLabel.leadingAnchor.constraint(equalTo: self.mainView.leadingAnchor, constant: 15),
            categoryLabel.bottomAnchor.constraint(equalTo: categoryChipCollection.topAnchor),

            categoryChipCollection.topAnchor.constraint(equalTo: categoryLabel.bottomAnchor),
            categoryChipCollection.trailingAnchor.constraint(equalTo: self.mainView.trailingAnchor),
            categoryChipCollection.leadingAnchor.constraint(equalTo: self.mainView.leadingAnchor),
            categoryChipCollection.bottomAnchor.constraint(equalTo: difficultyLabel.topAnchor, constant: -15),
            
            difficultyLabel.topAnchor.constraint(equalTo: categoryChipCollection.bottomAnchor, constant: 15),
            difficultyLabel.leadingAnchor.constraint(equalTo: self.mainView.leadingAnchor, constant: 15),
            difficultyLabel.bottomAnchor.constraint(equalTo: difficultyChipCollection.topAnchor),
            
            difficultyChipCollection.topAnchor.constraint(equalTo: difficultyLabel.bottomAnchor),
            difficultyChipCollection.trailingAnchor.constraint(equalTo: self.mainView.trailingAnchor),
            difficultyChipCollection.leadingAnchor.constraint(equalTo: self.mainView.leadingAnchor),
            difficultyChipCollection.bottomAnchor.constraint(equalTo: applyFilterOutlet.topAnchor),
        ])
    }
}

extension FilterDialog : SelectableDelegate {
    
    typealias T = CollectionData
    
    func onSelected(data: T, selectableButton: SelectableButton) {
        print(_tag, "[\(data.toString())] - \(selectableButton.toString())")
        switch data {
        case is Category:
            if selectableButton.isChecked() {
                categoryFilterList.insert(data as! Category)
            } else {
                categoryFilterList.remove(data as! Category)
            }
        case is Language:
            if selectableButton.isChecked() {
                languageFilterList.insert(data as! Language)
            } else {
                languageFilterList.remove(data as! Language)
            }
        case is Difficulty:
            if selectableButton.isChecked() {
                difficultyFilterList.insert(data as! Difficulty)
            } else {
                difficultyFilterList.remove(data as! Difficulty)
            }
        default:
            print(_tag, "Nothing")
        }
    }
}

protocol CollectionData: SelectableNameProtocol {
    func toString() -> String
}

