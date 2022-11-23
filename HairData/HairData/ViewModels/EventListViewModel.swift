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
    var onUpdate = {}
    
    enum Cell {
        case event(EventCellViewModel)
    }
    
    private(set) var cells: [Cell] = []
    private let coreDataManager: CoreDataManager
    
    init(coreDataManager: CoreDataManager = CoreDataManager.shared) {
        self.coreDataManager = coreDataManager
    }
    
    func viewDidLoad() {
        
        let events = coreDataManager.fetchEvents()
        
        cells = events.map {
            .event(EventCellViewModel($0))
        }
        onUpdate()
    }
    
    func tapAddEvent() {
        coordinator?.startAddEvent()
    }
    
    func numberOfRows() -> Int {
        return cells.count
    }
    
    func cell(at indexPath: IndexPath) -> Cell {
        return cells[indexPath.row]
    }
}
