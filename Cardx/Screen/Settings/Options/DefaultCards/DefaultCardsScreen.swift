//
//  DefaultCardsScreen.swift
//  Cardx
//
//  Created by Xchel Carranza on 06/07/23.
//

import UIKit

protocol DefaultCardsSreenCoordiantor {
    func openFilterDialog()
}

class DefaultCardsScreen: UIViewController {

    private let tableViewIdentifier = "CardCell"
    
    @IBOutlet weak var tableView: UITableView!
    
    private var cardList: [Card]
    
    private let cardViewModel: CardViewModel
    
    let coordinator: DefaultCardsSreenCoordiantor
    
    init(coordinator: DefaultCardsSreenCoordiantor, cardList: [Card], cardviewModel: CardViewModel) {
        self.coordinator = coordinator
        self.cardList = cardList
        self.cardViewModel = cardviewModel
        
        super.init(nibName: nil, bundle: nil)
        
        //print(_tag, "Cards[\(cardList.count)]: \(cardList.map(\.toTranslate))")
        print(_tag, "Cards[\(cardList.count)]: \(cardList)")
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
        coordinator.openFilterDialog()
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
        cell.bind(card: card, index: indexPath.row)
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

extension DefaultCardsScreen: FilterDialogCoordinator {
    func applyFilter(categoriesFiltered: [UUID]?, languagesFiltered: [UUID]?, difficultiesFiltered: [Int]?) {
        print(_tag, "categoriesSelected: \(categoriesFiltered)")
        print(_tag, "languagesSelected: \(languagesFiltered)")
        print(_tag, "difficultiesSelected: \(difficultiesFiltered)")
        cardViewModel.cardList = cardList
        cardList = cardViewModel.getListFiltered(categoriesFiltered: categoriesFiltered, languagesFiltered: languagesFiltered, difficultiesFiltered: difficultiesFiltered)
        tableView.reloadData()
    }
}
