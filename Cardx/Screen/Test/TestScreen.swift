//
//  TestScreen.swift
//  Cardx
//
//  Created by Xchel Carranza on 03/07/23.
//

import UIKit

class TestScreen: UIViewController {
    
    private let addButton: UIButton = {
        let button = UIButton(configuration: .borderedTinted())
        button.setTitle("Add", for: .normal)
        button.addTarget(self, action: #selector(add), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private let identifier = "testCell"
    private var cardList: [Card] = [
        .init(id: UUID(), toTranslate: "Hallo", translation: "Hola", language: .init(id: UUID(), name: "German"), difficulty: Difficulty(id: UUID(), name: CardDifficulty.EASY), difficultySelected: nil, category: .init(id: UUID(), name: "All")),
        .init(id: UUID(), toTranslate: "Wie geht ist dir", translation: "Cómo estás?", language: .init(id: UUID(), name: "German"), difficulty: Difficulty(id: UUID(), name: CardDifficulty.EASY), difficultySelected: nil, category: .init(id: UUID(), name: "All")),
        .init(id: UUID(), toTranslate: "Auf Wiedersehen", translation: "Adiós", language: .init(id: UUID(), name: "German"), difficulty: Difficulty(id: UUID(), name: CardDifficulty.EASY), difficultySelected: nil, category: .init(id: UUID(), name: "All")),
        .init(id: UUID(), toTranslate: "Wollen", translation: "Querer", language: .init(id: UUID(), name: "German"), difficulty: Difficulty(id: UUID(), name: CardDifficulty.EASY), difficultySelected: nil, category: .init(id: UUID(), name: "All")),
        .init(id: UUID(), toTranslate: "das Wasser", translation: "Agua", language: .init(id: UUID(), name: "German"), difficulty: Difficulty(id: UUID(), name: CardDifficulty.EASY), difficultySelected: nil, category: .init(id: UUID(), name: "All")),
    ]
    private let tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(TestCell.self, forCellReuseIdentifier: "testCell")
        tableView.separatorStyle = .none
        return tableView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        if false {
            // MARK: - to add
            setupCardItem()
        } else {
            // MARK: to display cards
            setupTableView()
        }
    }

}

// MARK: - TableView start
extension TestScreen: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cardList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: identifier, for: indexPath) as? TestCell else {
            return UITableViewCell()
        }
        let card = cardList[indexPath.row]
        cell.bind(card: card)
        return cell
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let deleteAction = UIContextualAction(style: .destructive, title: "Delete") { action, view, success in
            success(true)
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
        return (UIScreen.main.bounds.height / 4.0) + 25.0 + 36 + 75
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
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
}

class TestCell: UITableViewCell {
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }
    
    func bind(card: Card) {
        let cardItem = CardItem(card: card)
        self.addSubview(cardItem)
        NSLayoutConstraint.activate([
            cardItem.topAnchor.constraint(equalTo: topAnchor),
            cardItem.leadingAnchor.constraint(equalTo: leadingAnchor),
            cardItem.trailingAnchor.constraint(equalTo: trailingAnchor)
        ])
    }
}
// MARK: - TableView end



// MARK: - AddCard start
extension TestScreen {
    
    
    @objc private func add(sender: UIButton) {
        print(_tag, "add")
    }
    
    private func setupCardItem() {
        let cardItem = CardItem(card: nil)
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
