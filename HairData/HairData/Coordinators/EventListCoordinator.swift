//
//  EventListCoordinator.swift
//  HairData
//
//  Created by Andrey Piskunov on 14.11.2022.
//

import UIKit

final class EventListCoordinator: Coordinator {
    //MARK: - Properties
    private(set) var childCoordinators: [Coordinator] = []
    private let navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let eventListViewController = EventListViewController.instantiate()
        navigationController.setViewControllers([eventListViewController], animated: false)//Root view controller
    }
}
