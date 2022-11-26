//
//  EventDetailCoordinator.swift
//  HairData
//
//  Created by Andrey Piskunov on 23.11.2022.
//

import CoreData
import UIKit

final class EventDetailCoordinator: Coordinator {
    
    let childCoordinators: [Coordinator] = []
    private var navigationController = UINavigationController()
    private let eventID: NSManagedObjectID
    
    init(
        eventID: NSManagedObjectID,
        navigationController: UINavigationController) {
        self.eventID = eventID
        self.navigationController = navigationController
    }
    
    func start() {
        let detailViewController: EventDetailViewController = .instantiate()
        detailViewController.viewModel = EventDetailViewModel(eventID: eventID)
        navigationController.pushViewController(detailViewController, animated: true)
    }
}
