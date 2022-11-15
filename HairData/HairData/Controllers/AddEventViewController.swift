//
//  AddEventViewController.swift
//  HairData
//
//  Created by Andrey Piskunov on 15.11.2022.
//

import UIKit

class AddEventViewController: UIViewController {
    
    var viewModel: AddEventViewModel!

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        
        viewModel.viewDidDisappear()
    }
    deinit {
        print("deinit from add event controller")
    }
}
