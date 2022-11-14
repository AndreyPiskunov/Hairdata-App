//
//  AppCoordinator.swift
//  HairData
//
//  Created by Andrey Piskunov on 14.11.2022.
//

import UIKit

//Point of entry
protocol Coordinator {
    var childCoordinators: [Coordinator] { get }
    func start()
}

final class AppCoordinator: Coordinator {
//MARK: - Private properties
    private(set) var childCoordinators: [Coordinator] = []
    
    private let window: UIWindow
    
    init (window: UIWindow) {
        self.window = window
    }
 //MARK: - Methods
    func start() {
        let navigationController = UINavigationController()
        
        let eventCoordinator = EventListCoordinator(navigationController: navigationController)
        
        childCoordinators.append(eventCoordinator)//Add coordinator list of events to list child coordinators
        
        eventCoordinator.start()//Add to navigation stack root view controller
        
        window.rootViewController = navigationController
        window.makeKeyAndVisible()
    }
}

