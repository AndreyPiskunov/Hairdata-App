//
//  EventListCoordinator.swift
//  HairData
//
//  Created by Andrey Piskunov on 14.11.2022.
//

import UIKit
import CoreData

final class EventListCoordinator: Coordinator {
    //MARK: - Properties
    private(set) var childCoordinators: [Coordinator] = []
    
    var onSaveEvent = {}
    
    private let navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    //MARK: - Methods
    func start() {
        let eventListViewController: EventListViewController = .instantiate()
        let eventListViewModel = EventListViewModel()
        eventListViewModel.coordinator = self
        onSaveEvent = eventListViewModel.reload
        eventListViewController.viewModel = eventListViewModel
        navigationController.setViewControllers([eventListViewController], animated: false)//Root view controller
    }
    
    func startAddEvent() {
        let addEventCoordinator = AddEventCoordinator(navigationController: navigationController)
        addEventCoordinator.parentCoordinator = self
        childCoordinators.append(addEventCoordinator)
        addEventCoordinator.start()
    }
    
    func onSelect( _ id: NSManagedObjectID) {
        let eventDetailCoordinator = EventDetailCoordinator(navigationController: navigationController)
        childCoordinators.append(eventDetailCoordinator)
        eventDetailCoordinator.start()
    }
    
    func childDidFinish(_ childCoordinator: Coordinator) {
        
        //search index
        if let index = childCoordinators.firstIndex(where: { coordinator -> Bool in
            return childCoordinator === coordinator
        }) {
            childCoordinators.remove(at: index)
        }
    }
}

