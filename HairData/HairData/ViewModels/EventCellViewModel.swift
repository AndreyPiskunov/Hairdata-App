//
//  EventCellViewModel.swift
//  HairData
//
//  Created by Andrey Piskunov on 20.11.2022.
//

import UIKit

struct EventCellViewModel {
    let date = Date()
    private static let imageCache = NSCache<NSString, UIImage>()
    private let imageQueue = DispatchQueue(label: "imageQueue", qos: .background)
    
    private var cacheKey: String {
        event.objectID.description
    }
    
    var timeRemainingStrings: [String] {
        guard let eventDate = event.date else { return [] }
        return date.timeRemaining(until: eventDate)?.components(separatedBy: ",") ?? []
        }
    
//    var yearText: String {
//        "1 year"
//    }
//    var monthText: String {
//        "2 months"
//    }
//    var weekText: String {
//        "2 weeks"
//    }
//    var dayText: String {
//        "3 days"
//    }
    var dateText: String? {
        guard let eventDate = event.date else { return nil }
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "d MMM yyyy"
        return dateFormatter.string(from: eventDate)
    }
    var nameEventText: String? {
        event.name
    }
    
    func loadImage(completion: @escaping(UIImage?) -> Void) {
        if  let image = Self.imageCache.object(forKey: cacheKey as NSString) {
            completion(image)
        } else {
            imageQueue.async {
                
                guard let imageData = self.event.image, let image = UIImage(data: imageData) else {
                    completion(nil)
                    return
                }
                Self.imageCache.setObject(image, forKey: self.cacheKey as NSString)
                DispatchQueue.main.async {
                    completion(image)
                }
            }
        }
    }
    
    private let event: Event
        init (_ event: Event) {
            self.event = event
        }
}
