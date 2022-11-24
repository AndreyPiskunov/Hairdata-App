//
//  CoreDataManager.swift
//  HairData
//
//  Created by Andrey Piskunov on 14.11.2022.
//

import CoreData
import UIKit

final class CoreDataManager {
    
    static let shared = CoreDataManager()
    private init() {}
    
    var persistentContainer: NSPersistentContainer = {
        let persistentContainer = NSPersistentContainer(name: "WorkEventsData")
        persistentContainer.loadPersistentStores { _, error in
            print(error?.localizedDescription ?? "")
        }
        return persistentContainer
    }()
    
    var moc: NSManagedObjectContext {
        persistentContainer.viewContext
    }
    
    func saveEvent(name: String, date: Date, image: UIImage) {
        let event = Event(context: moc)
        event.setValue(name, forKey: "name")
        
        let resizeImage = image.sameAspectRatio(newHeight: 250)
        
        let imageData = resizeImage.jpegData(compressionQuality: 1)
        event.setValue(imageData, forKey: "image")
        event.setValue(date, forKey: "date")
        
        do {
            try moc.save()
        } catch {
            print(error)
        }
    }
    
    func fetchEvents() -> [Event] {
        do {
            let fetchRequest = NSFetchRequest<Event>(entityName: "Event")//Request to sample the event type
            let events = try moc.fetch(fetchRequest)
            return events
        } catch {
            print(error)
            return []
        }
    }
}
