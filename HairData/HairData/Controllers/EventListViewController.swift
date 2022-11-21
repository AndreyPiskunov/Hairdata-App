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
    
    @IBOutlet weak var tableView: UITableView!
    
    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
        
        viewModel.onUpdate = {[weak self] in
            self?.tableView.reloadData()
        }
        
        viewModel.viewDidLoad()
    
    }
    //MARK: - Methods
    
    private func setupViews() {
        let plusImage = UIImage(systemName: "plus.circle.fill")
        let barButtonItem = UIBarButtonItem(image: plusImage, style: .plain, target: self, action: #selector(tappedAddEventButton))
        barButtonItem.tintColor = .primaryColorApp
        navigationItem.rightBarButtonItem = barButtonItem
        navigationItem.title = viewModel.titleNavigationBar
        //navigationController?.navigationBar.prefersLargeTitles = true
        
        tableView.dataSource = self
        tableView.register(EventCell.self, forCellReuseIdentifier: "EventCell")
    }
    
    @objc private func tappedAddEventButton() {
        viewModel.tapAddEvent()
    }
}

extension EventListViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch viewModel.cell(at: indexPath) {
        case .event(let eventCellViewModel):
            let cell = tableView.dequeueReusableCell(withIdentifier: "EventCell", for: indexPath) as! EventCell
            cell.update(with: eventCellViewModel)
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfRows()
    }
}
