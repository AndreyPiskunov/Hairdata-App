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
        reload()
    }
    
    func reload() {
        let events = coreDataManager.fetchEvents()
        
        self.cells = events.map {
            var eventCellViewModel = EventCellViewModel($0)
            if let coordinator = coordinator {
                eventCellViewModel.onSelect = coordinator.onSelect
            }
        return .event(eventCellViewModel)
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
    
    func didSelectRow(at indexPath: IndexPath) {
        switch cells[indexPath.row] {
        case .event(let eventCellViewModel):
            eventCellViewModel.didSelect()
        }
    }
}
