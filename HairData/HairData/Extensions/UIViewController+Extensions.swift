//
//  UIViewController+Extensions.swift
//  HairData
//
//  Created by Andrey Piskunov on 15.11.2022.
//

import UIKit

extension UIViewController {
   static func instantiate<T>() -> T {
        let storyboard = UIStoryboard(name: "Main", bundle: .main)
        let controller = storyboard.instantiateViewController(identifier: "\(T.self)") as! T
        return controller
    }
}
