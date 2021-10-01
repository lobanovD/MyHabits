//
//  HabitVCConstants.swift
//  MyHabits
//
//  Created by Dmitrii Lobanov on 21.09.2021.
//

import UIKit

extension UIView {
    
    func colorCircle(width: CGFloat) {
        if width <= 428 {
            self.widthAnchor.constraint(equalToConstant: 30).isActive = true
            self.heightAnchor.constraint(equalToConstant: 30).isActive = true
            self.layer.cornerRadius = 15
        }
        else {
            self.widthAnchor.constraint(equalToConstant: 60).isActive = true
            self.heightAnchor.constraint(equalToConstant: 60).isActive = true
            self.layer.cornerRadius = 30
        }
    }
}

struct HabitVCConstants {
    static let leadingMargin: CGFloat = 16
    static let topMargin: CGFloat = 7
    static let trailingMargin: CGFloat = -16
    static let bottomMargin: CGFloat = -18
}


