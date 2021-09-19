//
//  TextStyles.swift
//  MyHabits
//
//  Created by Dmitrii Lobanov on 16.09.2021.
//

import UIKit

extension UILabel {
    
    func textTitle3(width: CGFloat) {
        self.textColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1)
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineHeightMultiple = 1.01
        if width <= 428 {
            self.font = UIFont(name: "SFProDisplay-Semibold", size: 20)
            print(self.font.pointSize)
        }
        else {
            self.font = UIFont(name: "SFProDisplay-Semibold", size: 40)
            print(self.font.pointSize)
        }
        self.toAutoLayout()
        self.numberOfLines = 0
    }

    func textBody(width: CGFloat) {
        self.textColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1)
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineHeightMultiple = 1.08
        if width <= 428 {
            self.font = UIFont(name: "SFProText-Regular", size: 17)
            print(self.font.pointSize)
        }
        else {
            self.font = UIFont(name: "SFProText-Regular", size: 24)
            print(self.font.pointSize)
        }
        self.toAutoLayout()
        self.numberOfLines = 0
    }
    
    
}


