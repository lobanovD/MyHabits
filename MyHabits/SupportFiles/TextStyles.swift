//
//  TextStyles.swift
//  MyHabits
//
//  Created by Dmitrii Lobanov on 16.09.2021.
//

import UIKit

extension UILabel {
    
    func textTitle3() {
        self.textColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1)
        self.font = UIFont(name: "SFProDisplay-Semibold", size: 20)
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineHeightMultiple = 1.01
    }

    func textBody() {
        self.textColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1)
        self.font = UIFont(name: "SFProText-Regular", size: 17)
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineHeightMultiple = 1.08
    }
    
    
}


