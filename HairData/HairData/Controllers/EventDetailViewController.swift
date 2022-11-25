//
//  EventDetailViewController.swift
//  HairData
//
//  Created by Andrey Piskunov on 24.11.2022.
//

import UIKit

final class EventDetailViewController: UIViewController {
    
    @IBOutlet var backgroundImageView: UIImageView!
    
    var viewModel: EventDetailViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        
        viewModel.onUpdate = { [weak self] in
            self?.backgroundImageView.image = self?.viewModel.image
 //       TODO: label
        }
        
        viewModel.viewDidLoad()
    }
}
