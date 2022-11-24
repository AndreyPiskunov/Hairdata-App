//
//  AddEventViewModel.swift
//  HairData
//
//  Created by Andrey Piskunov on 15.11.2022.
//

import UIKit

final class AddEventViewModel {
    
    let mainTitle = "Add"
    var onUpdate: () -> Void = {}
    
    enum Cell {
        case titleSubtitle (TitleSubtitleCellViewModel)
    }
    
    private(set) var cells: [Cell] = []
    weak var coordinator: AddEventCoordinator?
    
    private var nameCellViewModel: TitleSubtitleCellViewModel?
    private var dateCellViewModel: TitleSubtitleCellViewModel?
    private var backgroundImageCellViewModel: TitleSubtitleCellViewModel?
    private let cellBuilder: EventsCellBuilder
    private let coreDataManager: CoreDataManager
    
    lazy var dateFormatter: DateFormatter = {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd.MM.yyy"
        return dateFormatter
    }()
    
    init(cellBuilder: EventsCellBuilder, coreDataManager: CoreDataManager = CoreDataManager.shared) {
        self.cellBuilder = cellBuilder
        self.coreDataManager = coreDataManager
    }
    
    func viewDidLoad() {
        setupCell()
        onUpdate()
    }
                           
    func viewDidDisappear() {
        coordinator?.didFinish()
    }
    
    func numberOfRows() -> Int {
        return cells.count
    }
    
    func cell(for indexPath: IndexPath) -> Cell {
        return cells[indexPath.row]
    }
    
    func tappedDone() {
        guard let name = nameCellViewModel?.subtitle,
              let dateString = dateCellViewModel?.subtitle,
              let image = backgroundImageCellViewModel? .image,
              let date = dateFormatter.date(from: dateString)
        else { return }
        coreDataManager.saveEvent(name: name, date: date, image: image)
        coordinator?.didFinishSaveEvent()
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

private extension AddEventViewModel {
    func setupCell() {
        
        nameCellViewModel = cellBuilder.makeTitleSubtitleCellViewModel(.text)
        dateCellViewModel = cellBuilder.makeTitleSubtitleCellViewModel(.date) {
            [weak self] in
            self?.onUpdate()
        }
        
        backgroundImageCellViewModel = cellBuilder.makeTitleSubtitleCellViewModel(.image) {
            [weak self] in
            self?.onUpdate()
        }
        
        guard let nameCellViewModel = nameCellViewModel,
              let dateCellViewModel = dateCellViewModel,
              let backgroundImageCellViewModel = backgroundImageCellViewModel else { return }
        
        cells = [
            .titleSubtitle(
                nameCellViewModel) ,
            .titleSubtitle(
                dateCellViewModel ),
            .titleSubtitle(
                backgroundImageCellViewModel
            )
        ]
    }
}

