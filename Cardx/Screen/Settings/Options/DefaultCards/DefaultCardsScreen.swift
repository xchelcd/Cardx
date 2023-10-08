//
//  DefaultCardsScreen.swift
//  Cardx
//
//  Created by Xchel Carranza on 06/07/23.
//

import UIKit

protocol DefaultCardsSreenCoordiantor {
    
}

class DefaultCardsScreen: UIViewController {

    private let tableViewIdentifier = "CardCell"
    
    @IBOutlet weak var tableView: UITableView!
    
    private let cardList: [Card]
    
    private let cardViewModel: CardViewModel
    
    init(cardList: [Card], cardviewModel: CardViewModel) {
        self.cardList = cardList
        self.cardViewModel = cardviewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
    }

    @IBAction func displayOptions(_ sender: UIButton) {
        print(_tag, "display options to filter the below cards")
    }
    
}


extension DefaultCardsScreen: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        cardList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: tableViewIdentifier, for: indexPath) as? TestCell else {
            return UITableViewCell()
        }
        let card = cardList[indexPath.row]
        cell.bind(card: card)
        return cell
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let currentCard = cardList[indexPath.item]
        let addAction = UIContextualAction(style: .normal, title: "Add") { action, view, success in
            print("AddAction", "item selected: \(currentCard)")
            self.cardViewModel.saveCard(card: currentCard)
            self.displayMessage(self.view, message: "Added: \(currentCard.toTranslate)")
            success(true)
        }
        addAction.backgroundColor = .systemBlue.withAlphaComponent(0.75)
        
        addAction.image = UIImage(systemName: "plus.app")
        
        return UISwipeActionsConfiguration(actions: [addAction])
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return (UIScreen.main.bounds.height / 4.0) + 25.0 //+ 36 //+ 75
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    private func setupTableView() {
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(TestCell.self, forCellReuseIdentifier: tableViewIdentifier)
    }
}
