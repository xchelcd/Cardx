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
        print(_tag, "data: \(cardList.map(\.translation))")
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
        
        // MARK: - algoritmo para cambiar la posición en una lista
        // MARK: - otra forma podría ser eliminar la carta y volverla a insertar en la base de datos -> **********
        for i in 0...cardList.count - 1 {
            var cardUpdated = cardList[i]
            cardUpdated.position = i
            cardList[i] = cardUpdated
        }
        print(_tag, cardList.map{"\($0.toString1())"})
        
        for i in 0...cardList.count - 1 {
            var cardUpdated = cardList[i]
            if i - 1 == -1 {
                cardUpdated.position = cardList.count - 1
            } else {
                cardUpdated.position = i - 1
            }
            
            cardList[i] = cardUpdated
        }
        print(_tag, cardList.map{"\($0.toString1())"})
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
        cell.bind(difficultyDelegate: self, card: card, indexPath: indexPath)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return (UIScreen.main.bounds.height / 4.0) + 25.0 //+ 36 //+ 75
    }
    
    private func setupTable() {
        tableView.dataSource = self
        tableView.delegate = self
        tableView.allowsSelection = false
        self.view.addSubview(tableView)
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: self.view.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor)
        ])
        tableView.reloadData()
    }
}

extension DisplayCardsScreen: CardItemDifficultyDelegate {
    func difficultySelected(difficulty: CardDifficultyId) {
        print(_tag, "Deprecated")
    }
    
    
    func difficultySelected(difficulty: CardDifficultyId, indexPath: IndexPath?) {
//        let cardDifficultyId = difficulty.rawValue
//        let carddifficultySelected = CardDifficulty.allCases[difficulty.rawValue]
        
//        print(_tag, "difficulty: \(carddifficultySelected)")
        
        switch difficulty {
        case .NULL:
            reSortList(indexPath: indexPath)
            break
        case .TRY_AGAING:
            reSortList(indexPath: indexPath)
            break
        case .EASY:
            reSortList(indexPath: indexPath)
            break
        case .MEDIUM:
            reSortList(indexPath: indexPath)
            break
        case .HARD:
            reSortList(indexPath: indexPath)
            break
        }
    }
    
    private func reSortList(indexPath: IndexPath?) {
        guard let indexPath = indexPath else {
            print(_tag, "No indexPath")
            return
        }
        
        let index = indexPath.row
        let elementSelected = cardList[index]
        
        print(_tag, "data: \(cardList.map(\.toTranslate))")
        
        removeData(indexPath: indexPath)
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.25) {
            self.insertData(element: elementSelected)
            
        }
    }
    
    private func removeData(indexPath: IndexPath) {
        cardList.remove(at: indexPath.row)
        tableView.deleteRows(at: [indexPath], with: .bottom)
    }
    
    private func insertData(element: Card) {
        cardList.append(element)
        let newIndexPath = IndexPath(row: cardList.count - 1, section: 0)
        tableView.insertRows(at: [newIndexPath], with: .top)
        
        tableView.reloadData()
        print(self._tag, "data: \(cardList.map(\.toTranslate))")
    }
    
}
