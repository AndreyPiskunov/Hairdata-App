//
//  TitleSubtitleCellViewModel.swift
//  HairData
//
//  Created by Andrey Piskunov on 16.11.2022.
//

import Foundation

final class TitleSubtitleCellViewModel {
    let title: String
    private(set) var subtitle: String
    let placeholder: String
    
    init(title: String, subtitle: String, placeholder: String) {
        self.title = title
        self.subtitle = subtitle
        self.placeholder = placeholder
    }
}
