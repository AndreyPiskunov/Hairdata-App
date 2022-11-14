//
//  EventListViewController.swift
//  HairData
//
//  Created by Andrey Piskunov on 14.11.2022.
//

import UIKit

class EventListViewController: UIViewController {
    
//MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
    }
//MARK: - Methods

    static func instantiate() -> EventListViewController {
        let storyboard = UIStoryboard(name: "Main", bundle: .main)
        let controller = storyboard.instantiateViewController(identifier: "EventListViewController") as! EventListViewController
        return controller
    }

    private func setupViews() {
        let plusImage = UIImage(systemName: "plus.circle.fill")
        let barButtonItem = UIBarButtonItem(image: plusImage, style: .plain, target: self, action: #selector(tappedRightBarButton))
        barButtonItem.tintColor = .primaryColorApp
        navigationItem.rightBarButtonItem = barButtonItem
        navigationItem.title = "Working Events"
        //navigationController?.navigationBar.prefersLargeTitles = true
        
    }
    
    @objc private func tappedRightBarButton() {
        print("tapped")
    }
}
