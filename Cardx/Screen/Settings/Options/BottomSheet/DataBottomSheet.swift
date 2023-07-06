//
//  DataBottomSheet.swift
//  Cardx
//
//  Created by Xchel Carranza on 05/07/23.
//

import UIKit

class DataBottomSheet: UIViewController {
    
    @IBOutlet weak var topView: UIView!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var tableViewLayout: UIView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var messageLabel: UILabel!
    @IBOutlet weak var secondaryView: UIView!
    @IBOutlet weak var deleteOutlet: UIButton!
    
    private let tableViewIdentifier = "BottomSheetCell"
    
    
    //MARK: - BottomSheet
    var hasSetPointOrigin = false
    var pointOrigin: CGPoint?
    
    private let categoryList: [Category]?
    private let languageList: [Language]?
    
    init(categoryList: [Category]? = nil, languageList: [Language]? = nil) {
        self.categoryList = categoryList
        self.languageList = languageList
        
        super.init(nibName: nil, bundle: nil)
        
        guard let _ = categoryList, let _ = languageList else {
            self.dismiss(animated: true, completion: nil)
            //fatalError("Both list cannot be null")
            return
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupData()
        setupTableView()
    }
    
    override func viewDidLayoutSubviews() {
        if !hasSetPointOrigin {
            hasSetPointOrigin = true
            pointOrigin = self.view.frame.origin
        }
    }
    
    @IBAction func deleteItem(_ sender: UIButton) {
        print(_tag, "Delete: ")
    }
    
}

extension DataBottomSheet: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let list = categoryList {
            return list.count
        } else if let list = languageList {
            return list.count
        }
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: tableViewIdentifier, for: indexPath) as? BottomSheetCell else {
            return UITableViewCell()
        }
        if let list = categoryList {
            let data = list[indexPath.row]
            cell.bind(data: data.name)
        } else if let list = languageList {
            let data = list[indexPath.row]
            cell.bind(data: data.name)
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        if let list = categoryList {
            let data = list[indexPath.row]
            print(_tag, data.name)
            updateTitleToDeleteButton(title: data.name)
        } else if let list = languageList {
            let data = list[indexPath.row]
            print(_tag, data.name)
            updateTitleToDeleteButton(title: data.name)
        }
    }
    
    private func updateTitleToDeleteButton(title: String) {
        deleteOutlet.setTitle("Delete \(title)", for: .normal)
    }
    
    private func setupTableView() {
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(BottomSheetCell.self, forCellReuseIdentifier: tableViewIdentifier)
    }
    
    
}

extension DataBottomSheet {
    
    private func setupData() {
        
    }
}

extension DataBottomSheet {
    
    private func setupView(){
        let panGesture = UIPanGestureRecognizer(target: self, action: #selector(panGestureRecognizerAction))
        view.addGestureRecognizer(panGesture)

        topView.roundCorners(corners: [.topRight, .topLeft], radius: 25)
        tableView.layer.cornerRadius = 5
        tableViewLayout.layer.cornerRadius = 5
    }
    
    @objc func panGestureRecognizerAction(sender: UIPanGestureRecognizer) {
        let translation = sender.translation(in: view)
        
        // Not allowing the user to drag the view upward
        guard translation.y >= 0 else { return }
        
        // setting x as 0 because we don't want users to move the frame side ways!! Only want straight up or down
        view.frame.origin = CGPoint(x: 0, y: self.pointOrigin!.y + translation.y)
        
        if sender.state == .ended {
            let dragVelocity = sender.velocity(in: view)
            if dragVelocity.y >= 1300 {
                self.dismiss(animated: true, completion: nil)
                // MARK: - call protocol to removeBlurEffect
            } else {
                // Set back to original position of the view controller
                UIView.animate(withDuration: 0.3) {
                    self.view.frame.origin = self.pointOrigin ?? CGPoint(x: 0, y: 400)
                }
            }
        }
    }
}
