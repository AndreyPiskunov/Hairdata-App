//
//  AddEventViewModel.swift
//  HairData
//
//  Created by Andrey Piskunov on 15.11.2022.
//

import UIKit

final class AddEventViewModel {
    
    enum Cell {
        case titleSubtitle (TitleSubtitleCellViewModel)
        case titleImage
    }
    
    private(set) var cells: [AddEventViewModel.Cell] = []
    var coordinator: AddEventCoordinator?
    
    
    func viewDidDisappear() {
        coordinator?.didFinishAddEvent()
    }
    
    func numberOfRows() -> Int {
        return cells.count
    }
    
    func cell(for indexPath: IndexPath) -> Cell {
        return cells[indexPath.row]
    }
}

