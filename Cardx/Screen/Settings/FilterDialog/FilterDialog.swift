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
    private var categoryFilterList: [Category] = []
    
    private var languageList: [Language] = []
    private var languageFilterList: [Language] = []
    
    private var difficultyList: [Difficulty] = Difficulty.difficulties
    private var difficultyFilterList: [Category] = []
    
    let viewModel: SettingViewModel
    
    init(coordinator: FilterDialogCoordinator, viewModel: SettingViewModel) {
        self.viewModel = viewModel
        self.coordinator = coordinator
        super.init(nibName: nil, bundle: nil)
        
        categoryList = [
            .init(id: UUID(), name: "phrasal verb"),
            .init(id: UUID(), name: "verb"),
            .init(id: UUID(), name: "connectors"),
        ]//viewModel.fetchAllCategories()
        languageList = [
            .init(id: UUID(), name: "English"),
            .init(id: UUID(), name: "German"),
            .init(id: UUID(), name: "Spanish"),
            .init(id: UUID(), name: "French"),
        ]//viewModel.fetchAllLanguages()
        print(_tag, "Categories: \(categoryList)")
        print(_tag, "Languages: \(languageList)")
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
            categoriesFiltered: nil,
            languagesFiltered: nil,
            difficultiesFiltered: nil
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
    }
}

protocol CollectionData: SelectableNameProtocol {
    func toString() -> String
    
}

