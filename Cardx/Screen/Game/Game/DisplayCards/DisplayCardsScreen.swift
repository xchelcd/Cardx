//
//  DisplayCardScreen.swift
//  Cardx
//
//  Created by Xchel Carranza on 20/10/23.
//

import UIKit

protocol DisplayCardsScreenCoordinator {
    
}

class DisplayCardsScreen: UIViewController {
    
    private let identifier = "card_cell"
    
    private let coordinator: DisplayCardsScreenCoordinator?
    
    private var cardList: [Card] = []
    
    private let viewModel: DisplayCardViewModel
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(CardCell.self, forCellReuseIdentifier: identifier)
        tableView.separatorStyle = .none
        return tableView
    }()
    
    init(coordinator: DisplayCardsScreenCoordinator?, viewModel: DisplayCardViewModel) {
        self.coordinator = coordinator
        self.viewModel = viewModel
        
        cardList = viewModel.getAllCards()
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if cardList.isEmpty {
            self.displayMessage(self.view, message: "No Cards")
        }
        setupTable()
    }

}

extension DisplayCardsScreen: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cardList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: identifier, for: indexPath) as? CardCell else {
            return UITableViewCell()
        }
        let card = cardList[indexPath.row]
        cell.bind(difficultyDelegate: self, card: card, index: indexPath.row)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return (UIScreen.main.bounds.height / 4.0) + 25.0 //+ 36 //+ 75
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: false)
        cardList.moveFirstToLastIndex()
    }
    
    private func setupTable() {
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

extension DisplayCardsScreen: CardItemDifficultyDelegate {
    
    func difficultySelected(difficulty: CardDifficultyId) {
        let cardDifficultyId = difficulty.rawValue
        let carddifficultySelected = CardDifficulty.allCases[difficulty.rawValue]
        
        print(_tag, "difficulty: \(carddifficultySelected)")
        
        switch difficulty {
        case .NULL:
            reSortList()
            break
        case .TRY_AGAING:
            reSortList()
            break
        case .EASY:
            reSortList()
            break
        case .MEDIUM:
            reSortList()
            break
        case .HARD:
            reSortList()
            break
        }
    }
    
    private func reSortList() {
        cardList.moveFirstToLastIndex()
        tableView.reloadData()
    }
    
}
