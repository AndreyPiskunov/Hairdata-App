//
//  EventDetailViewModel.swift
//  HairData
//
//  Created by Andrey Piskunov on 24.11.2022.
//

import CoreData
import UIKit

final class EventDetailViewModel {
    private let eventID: NSManagedObjectID
    private let coreDataManager: CoreDataManager
    private var event: Event?
    var onUpdate = {}

    var image: UIImage? {
        
        guard let imageData = event?.image else { return nil }
        return UIImage(data: imageData)
    }
    
    init(eventID: NSManagedObjectID, coreDataManager: CoreDataManager = .shared) {
        self.eventID = eventID
        self.coreDataManager = coreDataManager
    }
    
    func viewDidLoad(){
        event = coreDataManager.getEvent(eventID)
        onUpdate()
    }
}
