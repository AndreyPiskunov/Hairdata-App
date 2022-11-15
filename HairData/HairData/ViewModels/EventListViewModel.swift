//
//  EventListViewModel.swift
//  HairData
//
//  Created by Andrey Piskunov on 14.11.2022.
//

import Foundation

final class EventListViewModel {
    
    let titleNavigationBar = "Works events"
    var coordinator: EventListCoordinator?//reference
    
    func tapAddEvent() {
        coordinator?.startAddEvent()
    }
}
