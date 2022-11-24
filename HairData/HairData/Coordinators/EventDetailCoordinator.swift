//
//  EventDetailCoordinator.swift
//  HairData
//
//  Created by Andrey Piskunov on 23.11.2022.
//

import UIKit

final class EventDetailCoordinator: Coordinator {
    
    let childCoordinators: [Coordinator] = []
    private let navigationController = UINavigationController()
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        <#code#>
    }
    
}