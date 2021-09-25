//
//  TextStyles.swift
//  MyHabits
//
//  Created by Dmitrii Lobanov on 16.09.2021.
//

import UIKit

extension UILabel {
    
    func textTitle3(width: CGFloat) {
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineHeightMultiple = 1.01
        self.toAutoLayout()
        self.numberOfLines = 0
        if width <= 428 {
            self.font = UIFont(name: "SFProDisplay-Semibold", size: 20)
        }
        else {
            self.font = UIFont(name: "SFProDisplay-Semibold", size: 30)
        }
    }

    func textBody(width: CGFloat) {
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineHeightMultiple = 1.08
        self.toAutoLayout()
        self.numberOfLines = 0
        if width <= 428 {
            self.font = UIFont(name: "SFProText-Regular", size: 17)
        }
        else {
            self.font = UIFont(name: "SFProText-Regular", size: 34)
        }
    }

    func textFootnote(width: CGFloat) {
        self.font = UIFont(name: "SFProText-Semibold", size: 13)
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineHeightMultiple = 1.16
        self.toAutoLayout()
        self.numberOfLines = 0
        if width <= 428 {
            self.font = UIFont(name: "SFProText-Semibold", size: 13)
        }
        else {
            self.font = UIFont(name: "SFProText-Semibold", size: 30)
        }
    }

    func textHeadline(width: CGFloat) {
        self.font = UIFont(name: "SFProText-Semibold", size: 17)
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineHeightMultiple = 1.08
        self.toAutoLayout()
        self.numberOfLines = 0

        if width <= 428 {
            self.font = UIFont(name: "SFProText-Semibold", size: 17)
        }
        else {
            self.font = UIFont(name: "SFProText-Semibold", size: 34)
        }
    }

    func textCaption(width: CGFloat) {
        self.font = UIFont(name: "SFProText-Regular", size: 12)
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineHeightMultiple = 1.12
        self.toAutoLayout()
        self.numberOfLines = 1
        if width <= 428 {
            self.font = UIFont(name: "SFProText-Semibold", size: 12)
        }
        else {
            self.font = UIFont(name: "SFProText-Semibold", size: 24)
        }
    }



}


extension UITextField {
    func textHeadline(width: CGFloat) {
        self.font = UIFont(name: "SFProText-Semibold", size: 17)
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineHeightMultiple = 1.08
        self.toAutoLayout()
        if width <= 428 {
            self.font = UIFont(name: "SFProText-Semibold", size: 17)
        }
        else {
            self.font = UIFont(name: "SFProText-Semibold", size: 34)
        }
    }
}
