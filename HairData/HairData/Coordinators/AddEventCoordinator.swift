//
//  AddEventCoordinator.swift
//  HairData
//
//  Created by Andrey Piskunov on 14.11.2022.
//

import UIKit

final class AddEventCoordinator: Coordinator {
    //MARK: - Properties
    
    private(set) var childCoordinators: [Coordinator]  = []
    private let navigationController: UINavigationController
    
    var parentCoordinator: EventListCoordinator?
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    //MARK: - Methods
    
    func start() {
        let modalNavigationController = UINavigationController()
        let addEventViewController: AddEventViewController = .instantiate()
        modalNavigationController.setViewControllers([addEventViewController], animated: false)
        let addEventViewModel = AddEventViewModel()
        addEventViewModel.coordinator = self
        addEventViewController.viewModel = addEventViewModel
        navigationController.present(modalNavigationController, animated: true, completion: nil)
    }
    
    func didFinishAddEvent () {
        parentCoordinator?.childDidFinish(self)
    }
    deinit {
        print ("deinit from add event coordinator")
    }
}
