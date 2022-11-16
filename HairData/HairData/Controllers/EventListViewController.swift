//
//  EventListViewController.swift
//  HairData
//
//  Created by Andrey Piskunov on 14.11.2022.
//

import UIKit
//import CoreData

class EventListViewController: UIViewController {
    //MARK: - Properties
    
    var viewModel: EventListViewModel!
    
    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
    }
    //MARK: - Methods
    
    private func setupViews() {
        let plusImage = UIImage(systemName: "plus.circle.fill")
        let barButtonItem = UIBarButtonItem(image: plusImage, style: .plain, target: self, action: #selector(tappedAddEventButton))
        barButtonItem.tintColor = .primaryColorApp
        navigationItem.rightBarButtonItem = barButtonItem
        navigationItem.title = viewModel.titleNavigationBar
        //navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    @objc private func tappedAddEventButton() {
        viewModel.tapAddEvent()
    }
}
