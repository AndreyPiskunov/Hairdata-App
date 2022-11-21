//
//  UIView+Extensions.swift
//  HairData
//
//  Created by Andrey Piskunov on 20.11.2022.
//

import UIKit

enum Edge {
    case left
    case right
    case top
    case bottom
}

extension UIView {
    func pinToSuperViewEdges(_ edges:[Edge] = [.left,.right,.top,.bottom], constant: CGFloat = 0) {
        guard let superview = superview else { return }
        edges.forEach {
            switch $0 {
            case .left:
                leftAnchor.constraint(equalTo: superview.leftAnchor, constant: constant).isActive = true
            case .right:
                rightAnchor.constraint(equalTo: superview.rightAnchor, constant: -constant).isActive = true
            case .top:
                topAnchor.constraint(equalTo: superview.topAnchor, constant: constant).isActive = true
            case .bottom:
                bottomAnchor.constraint(equalTo: superview.bottomAnchor, constant: -constant).isActive = true
            }
        }
    }
}
