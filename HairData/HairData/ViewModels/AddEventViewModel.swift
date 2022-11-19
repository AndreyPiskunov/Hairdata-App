//
//  AddEventViewModel.swift
//  HairData
//
//  Created by Andrey Piskunov on 15.11.2022.
//

import UIKit

final class AddEventViewModel {
    
    let mainTitle = "Add"
    var onUpdate:() -> Void = {}
    
    enum Cell {
        case titleSubtitle (TitleSubtitleCellViewModel)
    }
    
    private(set) var cells: [AddEventViewModel.Cell] = []
    var coordinator: AddEventCoordinator?
    
    func viewDidLoad() {
        cells = [
            .titleSubtitle(
                TitleSubtitleCellViewModel(title: "Name", subtitle: "", placeholder: "Add a name", type: .text, onCellUpdate: {})
            ),
            .titleSubtitle(
                TitleSubtitleCellViewModel(title: "Date", subtitle: "", placeholder: "Select a date", type: .date, onCellUpdate: { [weak self] in
                    self?.onUpdate()
                })
            ),
            .titleSubtitle(
                TitleSubtitleCellViewModel(title: "Background", subtitle: "", placeholder: "", type: .image, onCellUpdate: { [weak self] in
                    self?.onUpdate()
                })
            )
        ]
        onUpdate()
    }
                           
    func viewDidDisappear() {
        coordinator?.didFinishAddEvent()
    }
    
    func numberOfRows() -> Int {
        return cells.count
    }
    
    func cell(for indexPath: IndexPath) -> Cell {
        return cells[indexPath.row]
    }
    
    func tappedDone() {
        print("tapped done")
        //extract info from cell view models and save in core data
        //tell coordinator to dismiss
    }
    
    func updateCell(indexPath: IndexPath, subtitle: String) {
        switch cells [indexPath.row] {
        case .titleSubtitle(let titleSubtitleCellViewModel):
            titleSubtitleCellViewModel.update(subtitle)
        }
    }
    //select cell image
    func didSelectRow(at indexPath: IndexPath) {
        switch cells[indexPath.row] {
        case .titleSubtitle(let titleSubtitleCellViewModel):
            guard titleSubtitleCellViewModel.type == .image else {
                return
            }
            coordinator?.showImagePicker { image in
                titleSubtitleCellViewModel.update(image)
            }
        }
    }
    
}

