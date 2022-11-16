//
//  AddEventViewController.swift
//  HairData
//
//  Created by Andrey Piskunov on 15.11.2022.
//

import UIKit

class AddEventViewController: UIViewController {
    //MARK: - Properties
    
    @IBOutlet weak var tableView: UITableView!
    
    var viewModel: AddEventViewModel!
    
    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        
        viewModel.viewDidDisappear()
    }
}

extension AddEventViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfRows()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cellViewModel = viewModel.cell(for: indexPath)
        
        switch cellViewModel {
        case .titleSubtitle(let titleSubtitleViewModel):
            let cell = tableView.dequeueReusableCell(withIdentifier: "TitleSubtitleCell", for: indexPath)
            as! TitleSubtitleCell
            cell.update(with: titleSubtitleViewModel)
            return cell
        case .titleImage:
            return UITableViewCell()
        }
    }
}
