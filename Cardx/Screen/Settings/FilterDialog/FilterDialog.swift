//
//  FilterDialog.swift
//  Cardx
//
//  Created by Xchel Carranza on 11/10/23.
//

import UIKit

class FilterDialog: UIViewController {

    @IBOutlet weak var mainView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    @IBAction func filter(_ sender: Any) {
        self.dismiss(animated: true)
    }
}
