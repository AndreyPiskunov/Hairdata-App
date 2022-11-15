//
//  AddEventViewModel.swift
//  HairData
//
//  Created by Andrey Piskunov on 15.11.2022.
//

import Foundation

final class AddEventViewModel {

    var coordinator: AddEventCoordinator?
    
    func viewDidDisappear() {
        coordinator?.didFinishAddEvent()
    }
    
    deinit {
        print("deinit from add view model")
    }
}
