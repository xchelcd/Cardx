//
//  TestScreen.swift
//  Cardx
//
//  Created by Xchel Carranza on 03/07/23.
//

import UIKit

protocol TestScreenCoordinator {
    
}

class TestScreen: UIViewController {
    
    // MARK: - Filters start
    let coreDataManager = CoreDataManager.shared
    let getAllLanguages: GetAllLanguages
    let getAllCategories: GetAllCatgories
    
    var languages: [Language] = []
    var categories: [Category] = []
    // MARK: - Filters end
    
    private var cardItem: CardItem? = nil
    
    private let viewModel: TestViewModel
    //private let coordinator: TestScreenCoordinator
    
    init(viewModel: TestViewModel/*, coordinator: TestScreenCoordinator*/) {
        self.viewModel = viewModel
        //self.coordinator = coordinator
        // MARK: - Filters start
        getAllLanguages = GetAllLanguages(coreDataManager: coreDataManager)
        getAllCategories = GetAllCatgories(coreDataManager: coreDataManager)
        // MARK: - Filters end
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private lazy var addButton: UIButton = {
        let button = UIButton(configuration: .borderedTinted())
        button.setTitle("Add", for: .normal)
        button.addTarget(self, action: #selector(add), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private lazy var openFiltersButton: UIButton = {
        let button = UIButton(configuration: .borderedTinted())
        button.setTitle("Filteres", for: .normal)
        button.addTarget(self, action: #selector(openFilters), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private let identifier = "testCell"
    /*
     private var cardList: [Card] = [
     .init(id: UUID(), toTranslate: "Die Frau", translation: "La mujer", language: .init(id: UUID(), name: "German"), difficulty: .init(id: CardDifficultyId.EASY, name: CardDifficulty.EASY), difficultySelected: .init(id: CardDifficultyId.NULL, name: CardDifficulty.NULL), category: .init(id: UUID(), name: "Extra")),
     .init(id: UUID(), toTranslate: "Hallo", translation: "Hola", language: .init(id: UUID(), name: "German"), difficulty: Difficulty(id: CardDifficultyId.EASY, name: CardDifficulty.EASY), difficultySelected: .init(id: CardDifficultyId.NULL, name: CardDifficulty.NULL), category: .init(id: UUID(), name: "All")),
     .init(id: UUID(), toTranslate: "Wie geht ist dir", translation: "Cómo estás?", language: .init(id: UUID(), name: "German"), difficulty: Difficulty(id: CardDifficultyId.EASY, name: CardDifficulty.EASY), difficultySelected: .init(id: CardDifficultyId.NULL, name: CardDifficulty.NULL), category: .init(id: UUID(), name: "All")),
     .init(id: UUID(), toTranslate: "Auf Wiedersehen", translation: "Adiós", language: .init(id: UUID(), name: "German"), difficulty: Difficulty(id: CardDifficultyId.EASY, name: CardDifficulty.EASY), difficultySelected: .init(id: CardDifficultyId.NULL, name: CardDifficulty.NULL), category: .init(id: UUID(), name: "All")),
     .init(id: UUID(), toTranslate: "Wollen", translation: "Querer", language: .init(id: UUID(), name: "German"), difficulty: Difficulty(id: CardDifficultyId.EASY, name: CardDifficulty.EASY), difficultySelected: .init(id: CardDifficultyId.NULL, name: CardDifficulty.NULL), category: .init(id: UUID(), name: "All")),
     .init(id: UUID(), toTranslate: "das Wasser", translation: "Agua", language: .init(id: UUID(), name: "German"), difficulty: Difficulty(id: CardDifficultyId.EASY, name: CardDifficulty.EASY), difficultySelected: .init(id: CardDifficultyId.NULL, name: CardDifficulty.NULL), category: .init(id: UUID(), name: "All")),
     
     ]
     */
    private var cardList: [Card] = []
    
    private let tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(CardCell.self, forCellReuseIdentifier: "testCell")
        tableView.separatorStyle = .none
        return tableView
    }()
    
    private lazy var collectionView: UICollectionView = {
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        let padding = 12.0
        layout.sectionInset = UIEdgeInsets(top: padding, left: padding, bottom: padding, right: padding)
        let minSpaceV = 12.0
        let minSpaceH = 12.0
        layout.minimumLineSpacing = minSpaceV
        layout.minimumInteritemSpacing = minSpaceH
        
        
        let window = UIApplication.shared.windows.first
        let t: CGFloat = window?.safeAreaInsets.top ?? 0.0
        let b: CGFloat = window?.safeAreaInsets.bottom ?? 0.0
        let safeArea = t + b

        let hScreen = window?.frame.height ?? 0.0
        let wScreen = window?.frame.width ?? 0.0
        
        let cHeight = (hScreen - safeArea) / 2
        let cWidth = wScreen / 2
        
        let h = cHeight - (3.25 * minSpaceV)
        let w = cWidth - (2 * minSpaceH)
        
        
        
        layout.itemSize = CGSize(width: w, height: h)
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.isScrollEnabled = false
//        collectionView.backgroundColor = .lightGray
        collectionView.bounces = false
        collectionView.register(OptionsCell.self, forCellWithReuseIdentifier: "options_identifier")
        collectionView.delegate = self
        collectionView.dataSource = self
        return collectionView
    }()
    
    private let options: [String] = [
        "Option One",
        "Option Two",
        "Option Three",
        "Option Four",
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // viewModel.clearDatabase()
        if false {
            setupFilters()
            return
        } else {
            setGridLayout()
            return
        }
        if false {
            // MARK: - to add
            setupCardItem()
        } else {
            // MARK: to display cards
            setupTableView()
            fetchCards()
        }
    }
    
}
// MARK: - Grid view
extension TestScreen: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        options.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "options_identifier", for: indexPath) as? OptionsCell else {
            return UICollectionViewCell()
        }
        let option = options[indexPath.row]
        cell.bind(option: option)
        
        return cell
    }
    
    
    private func setGridLayout() {
        self.view.addSubview(collectionView)
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor),
            collectionView.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor),
            collectionView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor)
        ])
    }
}
class OptionsCell: UICollectionViewCell {
    
    private lazy var button: UIButton = {
        let button = UIButton()
        button.setTitleColor(.label, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private lazy var view: CardView = {
        let view = CardView()
        view.backgroundColor = .systemBackground
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
   
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        addViews()
    }
    
    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        addViews()
    }
    
    private func addViews() {
        view.addSubview(button)
        self.addSubview(view)
        NSLayoutConstraint.activate([
            view.topAnchor.constraint(equalTo: self.topAnchor),
            view.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            view.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            view.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            
            button.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            button.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }
    
    func bind(option: String) {
        button.setTitle(option, for: .normal)
    }
}
// MARK: - Grid view

// MARK: - Filters start

extension TestScreen {
    
    private func setupFilters() {
        initFiltersUI()
        fetchData()
    }
    
    private func showDialog() {
        //        let dialog = FilterDialog()
        //dialog.modalPresentationStyle = .custom
        //dialog.modalPresentationStyle = .overCurrentContext
        //        dialog.modalPresentationStyle = .overFullScreen
        //        self.present(dialog, animated: true)
    }
    
    private func fetchData() {
        categories = getAllCategories.invoke()
        languages = getAllLanguages.invoke()
        
        print(_tag, categories.map(\.name))
        print(_tag, languages.map(\.name))
    }
    
    private func initFiltersUI() {
        self.view.addSubview(openFiltersButton)
        
        NSLayoutConstraint.activate([
            openFiltersButton.topAnchor.constraint(equalTo: self.view.layoutMarginsGuide.topAnchor, constant: 15),
            openFiltersButton.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 15),
            openFiltersButton.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -15)
        ])
    }
    
    @objc private func openFilters(button: UIButton) {
        print(_tag, "openFilters")
        showDialog()
        
    }
    
}

// MARK: - Filters end


// MARK: - AddCard start
extension TestScreen {
    
    // MARK: - Deprecated
    @objc private func add(sender: UIButton) {
        print(_tag, "Add")
        
        
        let toTranslate = "Hallo"
        let translation = "Hola"
        let languageName = "German"
        let difficultyName = CardDifficulty.EASY
        let difficultySelectedName = CardDifficulty.NULL
        let categoryName = "Saludos"
        
        let card: Card = Card(id: UUID(), toTranslate: toTranslate, translation: translation, language: Language(id: UUID(), name: languageName), difficulty: Difficulty(id: CardDifficultyId.EASY, name: difficultyName), difficultySelected: Difficulty(id: CardDifficultyId.NULL, name: difficultySelectedName), category: Category(id: UUID(), name: categoryName))
        
        viewModel.saveCard(card: card)
    }
    
    private func setupCardItem() {
        let cardItem = CardItem(card: nil, indexPath: nil)
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
// MARK: - AddCard end

// MARK: - display cards start
extension TestScreen: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cardList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: identifier, for: indexPath) as? CardCell else {
            return UITableViewCell()
        }
        let card = cardList[indexPath.row]
        cell.bind(card: card, indexPath: indexPath)
        return cell
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let deleteAction = UIContextualAction(style: .destructive, title: "Delete") { action, view, success in
            success(true)
            let card = self.cardList[indexPath.row]
            self.viewModel.deleteCard(card: card)
            self.cardList.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .automatic)
        }
        let editAction = UIContextualAction(style: .normal, title: "Edit") { action, view, success in
            success(true)
        }
        deleteAction.backgroundColor = .red.withAlphaComponent(0.75)
        editAction.backgroundColor = .systemBlue.withAlphaComponent(0.75)
        
        deleteAction.image = UIImage(systemName: "trash")
        editAction.image = UIImage(systemName: "pencil")
        
        return UISwipeActionsConfiguration(actions: [deleteAction, editAction])
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return (UIScreen.main.bounds.height / 4.0) + 25.0 //+ 36 //+ 75
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: false)
    }
    
    private func setupTableView() {
        tableView.dataSource = self
        tableView.delegate = self
        self.view.addSubview(tableView)
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: self.view.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor)
        ])
    }
    
    private func fetchCards() {
        cardList = viewModel.fetchAllCards()
        if cardList.isEmpty {
            displayMessage(self.view, message: "No cards")
        }
        tableView.reloadData()
        
    }
}
// MARK: - display cards end
