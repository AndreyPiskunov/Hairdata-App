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
    private(set) var cells: [Cell] = []
   
    var onUpdate = {}
    
    enum Cell {
        case event(EventCellViewModel)
    }
    
    func viewDidLoad() {
        cells = [.event(EventCellViewModel()), .event(EventCellViewModel())]
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
